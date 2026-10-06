#!/usr/bin/env bash
#
# Upgrades a Registry Server database from 4.34 to 4.35.
#
# Registry keeps every name it has; the schema changes are that the command queue drops the two
# routing columns 4.35 no longer uses, since a command is now routed by its component alone, and
# that document_template gains the two translation columns (language, pot_file_ready). What
# else changes is the migration history: the twenty production migrations are squashed into a single init migration
# numbered by version (4.35.0 -> 4035000). The server cannot make that switch on its own, because
# the init migration builds the schema from nothing and refuses to run on a database that already
# holds tables. This script applies those column changes and rewrites the bookkeeping table.
#
# Usage:
#   DATABASE_URL=postgresql://user:pass@host:5432/registry ./upgrade-registry-server-4.35.sh
#
#   DATABASE_URL   the database the server connects to; pass sslmode=... in it if you need TLS
#   CONFIRM        set to yes to skip the confirmation prompt (for unattended runs)
#
# Only the `migration` table and those few columns are touched, so a backup is cheap insurance
# rather than a hard requirement.

set -euo pipefail

DATABASE_URL=${DATABASE_URL:?set DATABASE_URL to the registry database}

fail() { echo "FAIL: $*" >&2; exit 1; }
step() { echo; echo "== $*"; }
q() { psql "$DATABASE_URL" -tAX -v ON_ERROR_STOP=1 "$@"; }

command -v psql > /dev/null || fail "psql not found in PATH"

step "checking the database"
q -c "SELECT 1;" > /dev/null || fail "cannot connect with DATABASE_URL"

for table in organization knowledge_model_package document_template locale migration; do
  present=$(q -c "SELECT count(*) FROM pg_tables WHERE schemaname = current_schema() AND tablename = '$table';")
  [ "$present" = "1" ] || fail "table '$table' is missing - this does not look like a Registry Server database"
done

applied=$(q -c "SELECT coalesce(max(number), 0) FROM migration;")
if [ "$applied" = "4035000" ]; then
  echo "the migration history is already at 4035000 - nothing to do"
  exit 0
fi
[ "$applied" -eq 20 ] || fail "the migration history is at $applied, not 20 - start Registry Server 4.34 once so it migrates the database to 4.34, then run this script"
[ "$applied" -ge 1 ] || fail "the migration history is empty - migrate to 4.34 first"
echo "4.34 database, migration history up to $applied, $(q -c "SELECT count(*) FROM pg_tables WHERE schemaname = current_schema();") tables"

if [ "${CONFIRM:-}" != "yes" ]; then
  echo
  echo "This replaces the contents of the 'migration' table with the single 4.35 init row and"
  echo "adjusts the persistent_command and document_template columns. Type 'yes' to continue."
  read -r answer
  [ "$answer" = "yes" ] || fail "aborted"
fi

step "resetting the migration history to the init migration"
psql "$DATABASE_URL" -q -v ON_ERROR_STOP=1 <<'SQL'
BEGIN;
ALTER TABLE document_template ADD COLUMN language varchar DEFAULT 'en' NOT NULL,
    ADD COLUMN pot_file_ready boolean DEFAULT false NOT NULL;
ALTER TABLE persistent_command DROP COLUMN internal, DROP COLUMN destination;
CREATE INDEX IF NOT EXISTS persistent_command_queue_idx ON persistent_command (component, created_at) WHERE state <> 'DonePersistentCommandState';

DELETE FROM migration;
INSERT INTO migration (number, name, description, state, created_at)
VALUES (4035000, 'Init', 'Create the initial database schema', 'DONE', now());
COMMIT;
SQL

step "verifying"
history=$(q -c "SELECT count(*) || ' ' || coalesce(max(number), 0) FROM migration;")
[ "$history" = "1 4035000" ] || fail "migration should hold exactly the init row, holds: $history"
echo "migration history reset to the 4.35 init"
echo
echo "Done. Start Registry Server 4.35 against this database."
