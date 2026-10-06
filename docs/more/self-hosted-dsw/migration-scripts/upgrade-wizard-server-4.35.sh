#!/usr/bin/env bash
#
# Upgrades a Wizard Server database from 4.34 to 4.35, in place.
#
# 4.35 squashes the migration history into a single init migration and rebuilds the functions and
# triggers the wizard owns. The server cannot do either on its own: the init migration builds the
# schema from nothing and refuses to run on a database that already holds tables. This script is
# the upgrade path.
#
# No table is renamed: the tables of a 4.34 installation are already spelled the way 4.35 reads
# them, and the only schema changes left
# are the columns and indexes the merge added or dropped.
#
# Usage:
#   DATABASE_URL=postgresql://user:pass@host:5432/wizard ./upgrade-wizard-server-4.35.sh
#
#   DATABASE_URL   the database the server connects to; pass sslmode=... in it if you need TLS
#   CONFIRM        set to yes to skip the confirmation prompt (for unattended runs)
#
# Take a backup first. Everything runs in one transaction, so a failure leaves the database
# untouched, but there is no way back once it has committed.

set -euo pipefail

DATABASE_URL=${DATABASE_URL:?set DATABASE_URL to the wizard database}

fail() { echo "FAIL: $*" >&2; exit 1; }
step() { echo; echo "== $*"; }
q() { psql "$DATABASE_URL" -tAX -v ON_ERROR_STOP=1 "$@"; }

command -v psql > /dev/null || fail "psql not found in PATH"

step "checking the database"
q -c "SELECT 1;" > /dev/null || fail "cannot connect with DATABASE_URL"

for table in tenant knowledge_model_package project document_template migration; do
  present=$(q -c "SELECT count(*) FROM pg_tables WHERE schemaname = current_schema() AND tablename = '$table';")
  [ "$present" = "1" ] || fail "table '$table' is missing - this does not look like a Wizard Server database"
done

history=$(q -c "SELECT count(*) || ' ' || coalesce(max(number), 0) FROM migration;")
[ "$history" != "1 4035000" ] || fail "the migration history is already the 4.35 init row - this database is 4.35"
applied=$(q -c "SELECT coalesce(max(number), 0) FROM migration;")
[ "$applied" -eq 69 ] || fail "the migration history is at $applied, not 69 - start Wizard Server 4.34 once so it migrates the database to 4.34, then run this script"
[ "$applied" -ge 1 ] || fail "the migration history is empty - migrate to 4.34 first"
echo "4.34 database, migration history up to $applied, $(q -c "SELECT count(*) FROM pg_tables WHERE schemaname = current_schema();") tables"

if [ "${CONFIRM:-}" != "yes" ]; then
  echo
  echo "This rewrites the database in place and cannot be undone. Restoring a backup is the only"
  echo "way back. Type 'yes' to continue."
  read -r answer
  [ "$answer" = "yes" ] || fail "aborted"
fi

step "rebuilding the functions and triggers and resetting the migration history"
psql "$DATABASE_URL" -q -v ON_ERROR_STOP=1 <<'SQL'
BEGIN;

DO $rebuild$
DECLARE r record;
BEGIN
    FOR r IN SELECT c.relname AS tbl, t.tgname AS name
               FROM pg_trigger t
               JOIN pg_class c ON c.oid = t.tgrelid
               JOIN pg_namespace n ON n.oid = c.relnamespace
              WHERE NOT t.tgisinternal AND n.nspname = current_schema()
    LOOP
        EXECUTE format('DROP TRIGGER %I ON %I', r.name, r.tbl);
    END LOOP;

    -- by identity, so overloads left behind by earlier migrations go too
    FOR r IN SELECT p.oid::regprocedure AS sig
               FROM pg_proc p
               JOIN pg_namespace n ON n.oid = p.pronamespace
              WHERE n.nspname = current_schema()
                AND p.prokind = 'f'
                AND NOT EXISTS (SELECT 1 FROM pg_depend d WHERE d.objid = p.oid AND d.deptype = 'e')
    LOOP
        EXECUTE format('DROP FUNCTION %s CASCADE', r.sig);
    END LOOP;
END
$rebuild$;

ALTER TABLE tenant DROP COLUMN IF EXISTS signal_bridge_url;
CREATE INDEX IF NOT EXISTS user_group_membership_user_uuid_idx ON user_group_membership (user_uuid, tenant_uuid);
CREATE INDEX IF NOT EXISTS user_openid_identity_user_uuid_idx ON user_openid_identity (user_uuid, tenant_uuid);

ALTER TABLE persistent_command DROP COLUMN internal, DROP COLUMN destination;
CREATE INDEX IF NOT EXISTS persistent_command_queue_idx ON persistent_command (component, created_at) WHERE state <> 'DonePersistentCommandState';

DROP TABLE IF EXISTS feedback;
ALTER TABLE config_project DROP COLUMN IF EXISTS feedback_enabled, DROP COLUMN IF EXISTS feedback_token,
    DROP COLUMN IF EXISTS feedback_owner, DROP COLUMN IF EXISTS feedback_repo;

ALTER TABLE document_template ADD COLUMN language varchar DEFAULT 'en' NOT NULL,
    ADD COLUMN pot_file_ready boolean DEFAULT false NOT NULL;
ALTER TABLE document ADD COLUMN language varchar;
ALTER TABLE project ADD COLUMN document_template_language varchar;

CREATE TABLE document_template_locale
(
    uuid                   uuid        NOT NULL,
    name                   varchar     NOT NULL,
    code                   varchar     NOT NULL,
    document_template_uuid uuid        NOT NULL,
    tenant_uuid            uuid        NOT NULL,
    created_at             timestamptz NOT NULL,
    updated_at             timestamptz NOT NULL,
    CONSTRAINT document_template_locale_pk PRIMARY KEY (uuid),
    CONSTRAINT document_template_locale_code_unique UNIQUE (document_template_uuid, code, tenant_uuid),
    CONSTRAINT document_template_locale_document_template_uuid_fk FOREIGN KEY (document_template_uuid) REFERENCES document_template (uuid) ON DELETE CASCADE,
    CONSTRAINT document_template_locale_tenant_uuid_fk FOREIGN KEY (tenant_uuid) REFERENCES tenant (uuid) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS project_cache
(
    project_uuid                    uuid        NOT NULL,
    questionnaire                   jsonb       NOT NULL,
    report                          jsonb       NOT NULL,
    versions                        jsonb       NOT NULL,
    questionnaire_source_updated_at timestamptz NOT NULL,
    versions_source_updated_at      timestamptz NOT NULL,
    tenant_uuid                     uuid        NOT NULL,
    created_at                      timestamptz NOT NULL,
    updated_at                      timestamptz NOT NULL,
    CONSTRAINT project_cache_pk PRIMARY KEY (project_uuid),
    CONSTRAINT project_cache_project_uuid_fk FOREIGN KEY (project_uuid) REFERENCES project (uuid) ON DELETE CASCADE,
    CONSTRAINT project_cache_tenant_uuid_fk FOREIGN KEY (tenant_uuid) REFERENCES tenant (uuid) ON DELETE CASCADE
);
CREATE INDEX IF NOT EXISTS project_cache_tenant_uuid_index ON project_cache (tenant_uuid);

DO $limit_fk$
BEGIN
    IF NOT EXISTS (SELECT 1 FROM pg_constraint WHERE conname = 'tenant_limit_bundle_uuid_fk') THEN
        DELETE FROM tenant_limit_bundle b WHERE NOT EXISTS (SELECT 1 FROM tenant t WHERE t.uuid = b.uuid);
        ALTER TABLE tenant_limit_bundle ADD CONSTRAINT tenant_limit_bundle_uuid_fk FOREIGN KEY (uuid) REFERENCES tenant (uuid) ON DELETE CASCADE;
    END IF;
END
$limit_fk$;

CREATE FUNCTION compare_version(version_1 character varying, version_2 character varying) RETURNS character varying
    LANGUAGE plpgsql
    AS $$ DECLARE     version_order varchar; BEGIN     SELECT CASE                WHEN major_version(version_1) = major_version(version_2)                    THEN CASE                             WHEN minor_version(version_1) = minor_version(version_2)                                 THEN CASE                                          WHEN patch_version(version_1) = patch_version(version_2) THEN 'EQ'                                          WHEN patch_version(version_1) < patch_version(version_2) THEN 'LT'                                          WHEN patch_version(version_1) > patch_version(version_2) THEN 'GT'                                 END                             WHEN minor_version(version_1) < minor_version(version_2) THEN 'LT'                             WHEN minor_version(version_1) > minor_version(version_2) THEN 'GT'                    END                WHEN major_version(version_1) < major_version(version_2) THEN 'LT'                WHEN major_version(version_1) > major_version(version_2) THEN 'GT'                END     INTO version_order;     RETURN version_order; END; $$;

CREATE FUNCTION create_persistent_command(component character varying, function character varying, body jsonb, tenant_uuid uuid) RETURNS integer
    LANGUAGE plpgsql
    AS $$ BEGIN     INSERT INTO persistent_command (uuid,                                     state,                                     component,                                     function,                                     body,                                     last_error_message,                                     attempts,                                     max_attempts,                                     tenant_uuid,                                     created_by,                                     created_at,                                     updated_at,                                     last_trace_uuid)     VALUES (gen_random_uuid(),             'NewPersistentCommandState',             component,             function,             body,             NULL,             0,             10,             tenant_uuid,             NULL,             now(),             now(),             NULL);     return 1; END; $$;

CREATE FUNCTION create_persistent_command_from_document_delete() RETURNS trigger
    LANGUAGE plpgsql
    AS $$ BEGIN     PERFORM create_persistent_command(             'document',             'deleteFromS3',             jsonb_build_object('uuid', OLD.uuid),             OLD.tenant_uuid);     RETURN OLD; END; $$;

CREATE FUNCTION create_persistent_command_from_document_template_asset_delete() RETURNS trigger
    LANGUAGE plpgsql
    AS $$ BEGIN     PERFORM create_persistent_command(             'document_template_asset',             'deleteFromS3',             jsonb_build_object('documentTemplateUuid', OLD.document_template_uuid, 'assetUuid', OLD.uuid),             OLD.tenant_uuid);     RETURN OLD; END; $$;

CREATE FUNCTION create_persistent_command_from_entity_uuid() RETURNS trigger
    LANGUAGE plpgsql
    AS $$ DECLARE     component varchar;     function  varchar; BEGIN     component := TG_ARGV[0];     function := TG_ARGV[1];      PERFORM create_persistent_command(             component,             function,             jsonb_build_object('uuid', OLD.uuid),             OLD.tenant_uuid);     RETURN OLD; END; $$;

CREATE FUNCTION create_persistent_command_from_project_file_delete() RETURNS trigger
    LANGUAGE plpgsql
    AS $$ BEGIN     PERFORM create_persistent_command(             'project_file',             'deleteFromS3',             jsonb_build_object('projectUuid', OLD.project_uuid, 'fileUuid', OLD.uuid),             OLD.tenant_uuid);     RETURN OLD; END; $$;

CREATE FUNCTION get_km_id(req_p_id character varying) RETURNS character varying
    LANGUAGE plpgsql
    AS $$ DECLARE     km_id varchar; BEGIN     SELECT split_part(req_p_id, ':', 2)     INTO km_id;     RETURN km_id;END; $$;

CREATE FUNCTION get_knowledge_model_editor_fork_of_package_id(config_organization config_organization, previous_pkg knowledge_model_package, knowledge_model_editor knowledge_model_editor) RETURNS character varying
    LANGUAGE plpgsql
    AS $$ DECLARE     fork_of_package_id varchar; BEGIN     SELECT CASE                WHEN knowledge_model_editor.previous_package_uuid IS NULL THEN NULL                WHEN previous_pkg.organization_id = config_organization.organization_id AND                     previous_pkg.km_id = knowledge_model_editor.km_id THEN previous_pkg.fork_of_package_id                WHEN True THEN concat(previous_pkg.organization_id, ':', previous_pkg.km_id, ':', previous_pkg.version) END as fork_of_package_id     INTO fork_of_package_id;     RETURN fork_of_package_id; END; $$;

CREATE FUNCTION get_knowledge_model_editor_state(editor knowledge_model_editor, knowledge_model_migration knowledge_model_migration, fork_of_package_id character varying, editor_tenant_uuid uuid) RETURNS character varying
    LANGUAGE plpgsql
    AS $$ DECLARE     state varchar; BEGIN     SELECT CASE                WHEN knowledge_model_migration.state ->> 'type' IS NOT NULL AND                     knowledge_model_migration.state ->> 'type' != 'CompletedKnowledgeModelMigrationState' THEN 'MigratingKnowledgeModelEditorState'                WHEN knowledge_model_migration.state ->> 'type' IS NOT NULL AND                     knowledge_model_migration.state ->> 'type' = 'CompletedKnowledgeModelMigrationState' THEN 'MigratedKnowledgeModelEditorState'                WHEN (SELECT COUNT(*) FROM knowledge_model_editor_event editor_event WHERE editor_event.tenant_uuid = editor.tenant_uuid AND editor_event.editor_uuid = editor.uuid) > 0 THEN 'EditedKnowledgeModelEditorState'                WHEN fork_of_package_id != get_newest_knowledge_model_package_coordinate(fork_of_package_id, editor.tenant_uuid, ARRAY['ReleasedKnowledgeModelPackagePhase', 'DeprecatedKnowledgeModelPackagePhase']) THEN 'OutdatedKnowledgeModelEditorState'                WHEN True THEN 'DefaultKnowledgeModelEditorState' END     INTO state;     RETURN state; END; $$;

CREATE FUNCTION get_newest_knowledge_model_package(req_organization_id character varying, req_km_id character varying, req_tenant_uuid uuid, req_phase character varying[]) RETURNS uuid
    LANGUAGE plpgsql
    AS $$ DECLARE     p_uuid uuid; BEGIN     SELECT uuid     INTO p_uuid     FROM knowledge_model_package     WHERE organization_id = req_organization_id       AND km_id = req_km_id       AND tenant_uuid = req_tenant_uuid       AND phase = ANY (req_phase)     ORDER BY (string_to_array(version, '.')::int[])[1] DESC,              (string_to_array(version, '.')::int[])[2] DESC,              (string_to_array(version, '.')::int[])[3] DESC     LIMIT 1;      RETURN p_uuid; END; $$;

CREATE FUNCTION get_newest_knowledge_model_package_coordinate(req_coordinate character varying, req_tenant_uuid uuid, req_phase character varying[]) RETURNS character varying
    LANGUAGE plpgsql
    AS $$ DECLARE     target_uuid       uuid;     result_coordinate varchar; BEGIN     IF req_coordinate IS NULL THEN         RETURN NULL;     END IF;      target_uuid := get_newest_knowledge_model_package(             get_organization_id(req_coordinate),             get_km_id(req_coordinate),             req_tenant_uuid,             req_phase                    );      IF target_uuid IS NOT NULL THEN         SELECT concat(organization_id, ':', km_id, ':', version)         INTO result_coordinate         FROM knowledge_model_package         WHERE uuid = target_uuid;     END IF;      RETURN result_coordinate; END; $$;

CREATE FUNCTION get_organization_id(req_p_id character varying) RETURNS character varying
    LANGUAGE plpgsql
    AS $$ DECLARE     organization_id varchar; BEGIN     SELECT split_part(req_p_id, ':', 1)     INTO organization_id;     RETURN organization_id; END; $$;

CREATE FUNCTION gravatar_hash(email character varying) RETURNS character varying
    LANGUAGE plpgsql
    AS $$ DECLARE     hash VARCHAR; BEGIN     SELECT md5(lower(trim(email)))     INTO hash;     RETURN hash; END; $$;

CREATE FUNCTION is_outdated(version_1 character varying, version_2 character varying) RETURNS boolean
    LANGUAGE plpgsql
    AS $$ DECLARE     outdated varchar; BEGIN     SELECT CASE                WHEN compare_version(version_1, version_2) = 'GT' THEN true                ELSE false                END     INTO outdated;     RETURN outdated; END; $$;

CREATE FUNCTION major_version(version character varying) RETURNS integer
    LANGUAGE plpgsql
    AS $$ DECLARE     major_version int; BEGIN     SELECT (string_to_array(version, '.')::int[])[1]     INTO major_version;     RETURN major_version; END; $$;

CREATE FUNCTION minor_version(version character varying) RETURNS integer
    LANGUAGE plpgsql
    AS $$ DECLARE     minor_version int; BEGIN     SELECT (string_to_array(version, '.')::int[])[2]     INTO minor_version;     RETURN minor_version; END; $$;

CREATE FUNCTION patch_version(version character varying) RETURNS integer
    LANGUAGE plpgsql
    AS $$ DECLARE     patch_version int; BEGIN     SELECT (string_to_array(version, '.')::int[])[3]     INTO patch_version;     RETURN patch_version; END; $$;

CREATE TRIGGER trigger_on_after_document_template_locale_delete AFTER DELETE ON document_template_locale FOR EACH ROW EXECUTE FUNCTION create_persistent_command_from_entity_uuid('document_template_locale', 'deleteFromS3');

CREATE TRIGGER trg_knowledge_model_locale_after_delete_s3 AFTER DELETE ON knowledge_model_locale FOR EACH ROW EXECUTE FUNCTION create_persistent_command_from_entity_uuid('knowledge_model_locale', 'deleteFromS3');

CREATE TRIGGER trg_locale_after_delete_s3 AFTER DELETE ON locale FOR EACH ROW EXECUTE FUNCTION create_persistent_command_from_entity_uuid('locale', 'deleteFromS3');

CREATE TRIGGER trigger_on_after_document_delete AFTER DELETE ON document FOR EACH ROW EXECUTE FUNCTION create_persistent_command_from_document_delete();

CREATE TRIGGER trigger_on_after_document_template_asset_delete AFTER DELETE ON document_template_asset FOR EACH ROW EXECUTE FUNCTION create_persistent_command_from_document_template_asset_delete();

CREATE TRIGGER trigger_on_after_project_file_delete AFTER DELETE ON project_file FOR EACH ROW EXECUTE FUNCTION create_persistent_command_from_project_file_delete();

INSERT INTO persistent_command (uuid, state, component, function, body, last_error_message, attempts, max_attempts, tenant_uuid, created_by, created_at, updated_at, last_trace_uuid)
SELECT gen_random_uuid(), 'NewPersistentCommandState', 'doc_worker', 'generatePotFile',
       jsonb_build_object('documentTemplateUuid', dt.uuid, 'organizationId', dt.organization_id, 'templateId', dt.template_id,
                          'version', dt.version, 'language', dt.language)::varchar,
       NULL, 0, 10, dt.tenant_uuid, NULL, now(), now(), NULL
FROM document_template dt
WHERE dt.phase <> 'DraftDocumentTemplatePhase'
  AND NOT EXISTS (SELECT 1 FROM persistent_command pc
                   WHERE pc.component = 'doc_worker' AND pc.function = 'generatePotFile' AND pc.body LIKE '%' || dt.uuid || '%');

DELETE FROM migration;
INSERT INTO migration (number, name, description, state, created_at)
VALUES (4035000, 'Init', 'Create the initial database schema', 'DONE', now());

COMMIT;
SQL

step "verifying"
prefixed=$(q -c "
  SELECT count(*) FROM (
    SELECT relname AS name FROM pg_class WHERE relnamespace = current_schema()::regnamespace
    UNION ALL SELECT proname FROM pg_proc WHERE pronamespace = current_schema()::regnamespace
    UNION ALL SELECT typname FROM pg_type WHERE typnamespace = current_schema()::regnamespace
    UNION ALL SELECT con.conname FROM pg_constraint con JOIN pg_class c ON c.oid = con.conrelid
               WHERE c.relnamespace = current_schema()::regnamespace
  ) o WHERE name LIKE 'w\_%';")
[ "$prefixed" = "0" ] || fail "$prefixed objects carry the w_ prefix 4.35 does not use"

bodies=$(q -c "
  SELECT coalesce(string_agg(proname, ', ' ORDER BY proname), '') FROM pg_proc
   WHERE pronamespace = current_schema()::regnamespace AND prosrc ~ '(^|[^A-Za-z0-9_])w_';")
[ -z "$bodies" ] || fail "these function bodies name a w_ object: $bodies"

leftover=$(q -c "
  SELECT coalesce(string_agg(name, ', ' ORDER BY name), '') FROM (
    SELECT tablename AS name FROM pg_tables
     WHERE schemaname = current_schema() AND tablename = 'feedback'
    UNION ALL SELECT table_name || '.' || column_name FROM information_schema.columns
     WHERE table_schema = current_schema() AND table_name = 'config_project' AND column_name LIKE 'feedback\\_%'
  ) o;")
[ -z "$leftover" ] || fail "4.35 has no questionnaire feedback, these are still there: $leftover"

triggers=$(q -c "SELECT count(*) FROM pg_trigger WHERE NOT tgisinternal;")
[ "$triggers" = "6" ] || fail "the 6 triggers 4.35 has were not all created, found: $triggers"

history=$(q -c "SELECT count(*) || ' ' || coalesce(max(number), 0) FROM migration;")
[ "$history" = "1 4035000" ] || fail "migration should hold exactly the init row, holds: $history"

echo "$(q -c "SELECT count(*) FROM pg_tables WHERE schemaname = current_schema();") tables under their plain names, $triggers triggers, migration history reset to the 4.35 init"
echo
echo "Done. Start Wizard Server 4.35 against this database."
