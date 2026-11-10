.. _upgrade-guidelines:

Upgrade Guidelines
******************

Upgrading DSW
=============

Back up PostgreSQL, S3 storage and configuration. Test the upgrade on a restored copy, and read the version-specific steps below before changing images. Keep ``general.secret`` and ``general.rsaPrivateKey`` from the existing configuration; see :ref:`config-server` before rotating either key.

Using Docker
------------

Set compatible target-version image tags for the server, client, document worker and mailer in the Compose file. Stop the server and workers, then start the server first:

.. code-block:: shell

   docker compose stop server docworker mailer
   docker compose pull
   docker compose up -d server
   docker compose logs -f server

Wait for the database migrations to finish successfully, then start the remaining services:

.. code-block:: shell

   docker compose up -d

The service names follow the deployment example; use the names from your Compose file. Do not start workers after a failed migration. Upgrading from 4.34 to 4.35 requires the :ref:`database upgrade script <upgrade-4-35>` first.

Other setup (using Git)
-----------------------

Check out the target release in each component repository and rebuild it:

.. code-block:: shell

   git checkout vX.Y.Z

Use the same server-first startup order as above.

Upgrade process
===============

Apply the relevant version-specific steps in order. Stop the document worker and mailer before starting the upgraded server.

.. _upgrade-5-0:

4.35.X to 5.0.X
----------------

For an older instance, complete the :ref:`4.35 upgrade procedure <upgrade-4-35>` and its prerequisites first. Use matching 5.0-compatible components; the 4.x client cannot use the 5.0 API.

API and client addresses
~~~~~~~~~~~~~~~~~~~~~~~~

* Change the API base from ``/wizard-api`` to ``/api`` in the client's ``API_URL``, reverse proxy and API integrations. Preserve WebSocket upgrades on the API proxy. Bootstrap is now ``/api/bootstrap``, not ``/configs/bootstrap``.
* Serve the 5.0 client at the web root. Update ``general.clientUrl`` and remove any old redirect from ``/`` to ``/wizard``. Serve client assets from the new root, and update bookmarks and shared links. See :ref:`client-configuration`.
* **OpenID:** when moving from the standard ``/wizard`` deployment to the 5.0 web root, update the callback and logout URLs in the identity provider using the addresses displayed by DSW after upgrading. Keep an internal administrator login available while changing OpenID. Test sign-in and logout in a private browser window; see :ref:`openid-settings`.
* Review API scripts against the 5.0 reference, including endpoints, request fields and content identifiers; see :doc:`/more/development/api`. Changing only the API base is not sufficient.

Content and document templates
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

* **Before upgrading, resolve duplicate content IDs.** The combined identifier and version must be unique within the instance; otherwise the migration stops. For example, ``example:research-model:1.0.0`` becomes identifier ``example.research-model`` and version ``1.0.0``. Update identifiers in scripts, imports and custom configuration to the new format; references use ``id:version``.
* Upgrade installed document templates to versions compatible with context **19.0**. Update custom template code as described in :ref:`document-template-metamodel-versions`; changing only the declared version is not enough. Review allowed-model patterns and document-submission template/format settings.
* In the document worker's ``templates[].ids``, replace old prefixes such as ``dsw:`` with ``dsw.``. These prefixes match ``<id>:<version>``; a mismatch stops the template receiving its configured ``requests`` and ``secrets``.
* Replace ``experimental.maxDocumentSize`` / ``EXPERIMENTAL_MAX_DOCUMENT_SIZE`` with ``documents.maxSize`` / ``DOCUMENTS_MAX_SIZE``. The default is now **5 MB**; set the YAML value to ``null`` if no size limit is wanted.
* Remove ``documentContext.defaultAppTitleShort`` and ``documentContext.defaultIllustrationsColor`` and their corresponding environment variables. Use the current document context for custom branding; see :ref:`configuration-files`.
* Drain document-generation jobs before upgrading where possible. Jobs queued with the old context have to be regenerated after the upgrade.

Translations and configuration
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~

* **Export custom translations before upgrading.** The migration deletes the old interface translations. Prepare separate application and email PO files from the new POT files, import the required languages, enable them and set the defaults. Users may need to select their interface language again. Old ZIP locale bundles cannot be imported through the new PO workflow; see :doc:`/application/administration/settings/translations/index`.
* Copy custom privacy and terms links into ``general.privacyUrl`` and ``general.termsOfServiceUrl`` **before upgrading**. Their old settings table is removed by the migration.
* Replace the server's ``cloud`` section with ``multiTenancy``. Rename ``CLOUD_ENABLED``, ``CLOUD_DOMAIN`` and ``CLOUD_PUBLIC_REGISTRATION_ENABLED`` to ``MULTI_TENANCY_ENABLED``, ``MULTI_TENANCY_DOMAIN`` and ``MULTI_TENANCY_PUBLIC_REGISTRATION_ENABLED``. A normal single-instance deployment uses ``multiTenancy.enabled: false``. Match this setting in the workers; they also accept the legacy ``cloud.enabled`` fallback. Use the configuration for each matching component version.
* Check the Registry connection under :doc:`DSW Registry settings </application/administration/settings/content/dsw-registry>` and test content and translation imports. The new Registry uses personal accounts and API keys. For an existing Registry account, use its password-reset flow to set a login password.
* Review custom client mounts: favicon files now live under ``/usr/share/nginx/html/assets/favicon``, and custom head content is mounted at ``/src/head-extra.html``. Update custom CSS for the new design-system variables and check both light and dark appearance; see :ref:`client-configuration`.
* Test installed plugins and custom mail layouts against the matching 5.0 versions. Update local training materials containing screenshots or UI-specific instructions.

Verification
~~~~~~~~~~~~

After upgrading, test internal and OpenID sign-in/logout, role permissions, project sharing, user groups, integrations, file downloads, document generation, translations, Registry imports and any configured submission service. Check an existing project and create a new one. For configured email delivery, test password recovery and project invitations too.

.. _upgrade-4-35:

4.34.X to 4.35.X
----------------

.. Warning::

   This upgrade is **not** automatic. Wizard Server 4.35 will not start on a 4.34 database until you run the upgrade script described below. If you just change the version and restart, the server stops with ``the init migration builds the schema from nothing and this database is not empty`` and leaves your database untouched.

What you need:

- Your installation is on **4.34.X** and has been started at least once on it. Coming from an older version? Upgrade to 4.34 first, start it, then continue here.
- Download :download:`upgrade-wizard-server-4.35.sh <migration-scripts/upgrade-wizard-server-4.35.sh>` and save it beside your Compose file before running the commands below.
- ``bash`` and ``psql``. If you use Docker, the official ``postgres`` container already has both.

Steps (Docker Compose, as in `dsw-deployment-example <https://github.com/ds-wizard/dsw-deployment-example>`__; adjust the service names, database name and credentials to yours):

1. **Back up the database.**

   .. code-block:: shell

      $ docker compose exec -T postgres pg_dump -U postgres -Fc engine-wizard > backup-4.34.dump

2. **Stop the server and the workers**, but leave ``postgres`` running.

   .. code-block:: shell

      $ docker compose stop server docworker mailer

3. **Run the upgrade script** inside the ``postgres`` container. It asks for confirmation; type ``yes``.

   .. code-block:: shell

      $ docker compose cp upgrade-wizard-server-4.35.sh postgres:/tmp/
      $ docker compose exec -e DATABASE_URL=postgresql://postgres:postgres@localhost:5432/engine-wizard \
          postgres bash /tmp/upgrade-wizard-server-4.35.sh

   It is done when the last line says ``Done. Start Wizard Server 4.35 against this database.``

4. **Switch to 4.35 and start the server first**, then everything else.

   .. code-block:: shell

      # in .env: DSW_VERSION=4.35
      $ docker compose pull
      $ docker compose up -d server
      $ docker compose logs server | grep Migration    # should say "no new migration to apply"
      $ docker compose up -d

Without Docker, run the script on any machine with ``bash`` and ``psql`` that can reach the database:

.. code-block:: shell

   $ DATABASE_URL=postgresql://user:pass@host:5432/wizard bash ./upgrade-wizard-server-4.35.sh

If something goes wrong:

- ``the migration history is at N, not 69``: the database is not on 4.34. Start 4.34 once, then run the script again.
- An error before the transaction commits rolls back the SQL changes. Fix the cause (such as connection details or permissions) and run the script again.
- If the final verification fails after the transaction commits, the database has changed. Stop the upgrade, restore the backup, and investigate before trying again.
- 4.35 misbehaves after the upgrade: stop it, restore ``backup-4.34.dump`` and go back to 4.34.

Other changes:

- The questionnaire feedback feature (reporting issues to GitHub) was removed together with its data. Delete the ``feedback:`` section from ``application.yml``; nothing else in the configuration has to change.
- After the first start, the ``document-worker`` generates a translation file for every released document template, so it is busy for a while.


4.33.X to 4.34.X
----------------

- Finish or cancel unfinished project migrations before upgrading. The upgrade removes unfinished project migration data created by older versions.

4.32.X to 4.33.X
----------------

- Tools interacting with S3 (``mailer`` and ``document-worker``) now use the ``botocore`` library. Settings, such as custom certificates, need to be configured according to its documentation: https://docs.aws.amazon.com/boto3/latest/guide/configuration.html#using-environment-variables.

4.31.X to 4.32.X
----------------

- Review migrated roles after the upgrade. Check which permissions each role has, confirm the default role for new users, and verify any organization-specific access expectations such as project support, user management or content management.

4.30.X to 4.31.X
----------------

- Copy the ``clientId`` and ``clientSecret`` again from your :ref:`openid-settings` provider, as the values currently stored in the wizard are no longer valid. Then take the newly generated ``callbackUrl`` and ``logoutUrl`` from the wizard and configure them in your **OpenID** provider.

4.29.X to 4.30.X
----------------

*(nothing)*

4.28.X to 4.29.X
----------------

*(nothing)*

4.27.X to 4.28.X
----------------

- **Project Importers** were removed. They can be replaced by :ref:`configuration-plugins`.
- API endpoints in sections related to **Document Templates** and **Knowledge Models** were updated. The primary identifier was changed from ``ID`` to ``UUID``. Please check the API documentation for the new endpoints.
- Due to Document Template changes, it is necessary to migrate Document Templates in S3. You can use this script: https://github.com/ds-wizard/dsw-templates-migration-script.

4.26.X to 4.27.X
----------------

- API endpoints in the sections related to **Locales** were updated. The primary identifier was changed from ``ID`` to ``UUID``. Please check the API documentation for the new endpoints.
- Due to Locale changes, it is necessary to migrate Locales in S3. You can use this script: https://github.com/ds-wizard/dsw-locale-migration-script.

4.25.X to 4.26.X
----------------

- API Endpoints in the sections related to **Questionnaire** were renamed to **Project** to match the DSW UI. Please check the API documentation for the new endpoints.
- Due to changes in the API, it is necessary to rename ``questionnaire-files`` in S3 to ``project-files``.
- Document Template metamodel version is raised (from 17.0 to 17.1) due to new type of API Integration in KM and way of versioning document template metamodel, for details check :ref:`document-template-metamodel-versions`.

4.24.X to 4.25.X
----------------

- API Endpoints in the sections related to **Knowledge Model** and **Knowledge Model Editor** have been updated. Please check the API documentation for the new endpoints.
- All Document Submissions with no Submission service defined will be deleted during migration. This can happen if the Submission service used by the Document Submission was deleted or renamed.
- It is necessary to finish all Knowledge Model migrations, either by completing or deleting them, before upgrading. The upgrade will delete any ongoing migrations.

4.23.X to 4.24.X
----------------

*(nothing)*

4.22.X to 4.23.X
----------------

*(nothing)*

4.21.X to 4.22.X
----------------

- Document template metamodel version is raised (from 16 to 17.0) due to new type of API Integration in KM and way of versioning document template metamodel, for details check :ref:`document-template-metamodel-versions`.
- It is necessary to delete any user properties belonging to :ref:`Document Submission <document-submission-settings>` that no longer exist in the system. Otherwise, the migration will fail. This can be done either through the UI or directly in the database.
- It is recommended to migrate API integrations to the new version as soon as possible. The legacy API integration will be removed in the future.

4.20.X to 4.21.X
----------------

Before updating check following, otherwise the migration will fail:

- All authentication services have unique IDs
- All submission services have unique IDs
- Document templates and their versions used by submission services are present in the instance

4.19.X to 4.20.X
----------------

*(nothing)*

4.18.X to 4.19.X
----------------

*(nothing)*

4.17.X to 4.18.X
----------------

- Updating will remove all existing locales. They need to be backed up and re-imported after the update.

4.16.X to 4.17.X
----------------

*(nothing)*

4.15.X to 4.16.X
----------------

*(nothing)*

4.14.X to 4.15.X
----------------

*(nothing)*

4.13.X to 4.14.X
----------------

*(nothing)*

4.12.X to 4.13.X
----------------

- Document template metamodel version is raised (from 15 to 16) as Value Question has now added Validations (no breaking changes), for details check :ref:`document-template-metamodel-versions`.

4.11.X to 4.12.X
----------------

- Document template metamodel version is raised (from 14 to 15) as File Question has been added (no breaking changes), for details check :ref:`document-template-metamodel-versions`.

4.10.X to 4.11.X
----------------

*(nothing)*

4.9.X to 4.10.X
---------------

- Document template metamodel version is raised (from 13 to 14) and requires updates in document templates, for details check :ref:`document-template-metamodel-versions`.


4.8.X to 4.9.X
--------------

*(nothing)*

4.7.X to 4.8.X
--------------

*(nothing)*

4.6.X to 4.7.X
--------------

*(nothing)*

4.5.X to 4.6.X
--------------

*(nothing)*

4.4.X to 4.5.X
--------------

*(nothing)*

4.3.X to 4.4.X
--------------

*(nothing)*

4.2.X to 4.3.X
--------------

- The document template metamodel version is raised to 13.

4.1.X to 4.2.X
--------------

*(nothing)*

4.0.X to 4.1.X
--------------

- **(breaking)** DSW Integration Widget SDK and DSW Importer SDK for importers are now deprecated. `DSW Integration SDK <https://github.com/ds-wizard/dsw-integration-sdk>`__ should be used instead.
- The document template metamodel version is raised to 12.


3.28.X to 4.0.X
---------------

- **(breaking)** The client runs on the nested route ``/wizard``, and the server runs on the nested route ``/wizard-api``. These changes must be reflected in the deployment configuration (such as routing in a reverse proxy) and the ``clientUrl`` in the :ref:`config-server`.
- **(breaking)** :ref:`client-configuration` for a custom logo and theme no longer uses SASS and needs to be updated accordingly.
- **(breaking)** :ref:`api-keys` created in previous versions will no longer work.
- **(breaking)** The callback URL for OpenID Auth Services (such as Google or Life Science Login) has changed due to the nested route, so it has to be set up, for example:

  - Before: ``https://researchers.ds-wizard.org/auth/google/callback``
  - After: ``https://researchers.ds-wizard.org/wizard/auth/google/callback``

3.27.X to 3.28.X
----------------

*(nothing)*

3.26.X to 3.27.X
----------------

*(nothing)*

3.25.X to 3.26.X
----------------

*(nothing)*


3.24.X to 3.25.X
----------------

*(nothing)*


3.23.X to 3.24.X
----------------

*(nothing)*


.. _upgrade-3-22-x-3-23-x:

3.22.X to 3.23.X
----------------

- **(breaking)** The JWT signing has been changed to RS256 and you need to add ``rsaPrivateKey`` in configuration file (see :ref:`config-server`).
- **(breaking)** The location of configuration files has been changed and unified across components, check the deployment example for details. The main configuration file is located in ``/app/config/application.yml`` path which can be adjusted  ``APPLICATION_CONFIG_PATH``.


3.21.X to 3.22.X
----------------

*(nothing)*

3.20.X to 3.21.X
----------------

- **(breaking)** The ``wizard-client`` container now exposes a different port (as all images are now root-less): 8080 instance of 80.
- **(breaking)** The S3 service must be now publicly available, thus the S3 URL configured via :ref:`config-server` must be reachable by users to support download of documents or document preview.

3.19.X to 3.20.X
----------------

- The document template metamodel version is raised to **11**. All templates must be updated (changes are only minor in template.json files, see Template Development section for more information).

3.18.X to 3.19.X
----------------

*(nothing)*

3.17.X to 3.18.X
----------------

*(nothing)*

3.16.X to 3.17.X
----------------

- If we are upgrading from the older version than 3.16.X we need to first upgrade to version 3.16.X.

3.15.X to 3.16.X
----------------

*(nothing)*

3.14.X to 3.15.X
----------------

*(nothing)*

3.13.X to 3.14.1
----------------

*(nothing)*

3.13.X to 3.14.X
----------------

*(nothing)*

3.12.X to 3.13.X
----------------

*(nothing)*

3.11.X to 3.12.X
----------------

*(nothing)*

3.10.X to 3.11.X
----------------

- (optional) We can now use integration.yaml configuration in Settings instead of the file store on FS and mounted to the Docker container.

3.9.X to 3.10.X
---------------

- Standalone mailer component has been introduced. We need to adjust our deployment (e.g., `docker-compose.yml`) accordingly (see `deployment-example <https://github.com/ds-wizard/dsw-deployment-example>`__).

3.8.X to 3.9.X
--------------

*(nothing)*

3.7.X to 3.8.X
--------------

- All KM migrations must be finished (completed or deleted); otherwise, the upgrade of the backend (database) will fail with the corresponding message in the logs.

3.6.X to 3.7.X
--------------

*(nothing)*

3.5.X to 3.6.X
--------------

*(nothing)*

3.4.X to 3.5.X
--------------

- The template metamodel version has been updated (to v5). Updating all document templates is needed (annotations were added, so we can safely change version 4 to version 5 without breaking anything).
- All KM migrations must be finished (completed or deleted); otherwise, the upgrade of the backend (database) will fail with the corresponding message in the logs.

3.3.X to 3.4.X
--------------

*(nothing)*

3.2.X to 3.3.X
--------------

*(nothing)*

3.1.X to 3.2.X
--------------

- The template metamodel version has been updated (to v4). Updating all document templates is needed.
- All knowledge models have (after the automatic data migration) the default metrics and phases that can be changed in KM Editor.

3.0.X to 3.1.X
--------------

- As an administrator, we should either disable the "Project Templates" feature (Settings - Projects - Project Creation, select "Custom only") or prepare some project templates for our users to avoid confusion.

2.14.X to 3.0.X
---------------

- All data must be migrated as we switched from MongoDB and RabbitMQ to PostgreSQL and S3. To support data migration, we provide `dsw2to3 tool <https://github.com/ds-wizard/dsw2to3>`_ with step-by-step instructions.

2.13.X to 2.14.X
----------------

*(nothing)*

2.12.X to 2.13.X
----------------

*(nothing)*

2.11.X to 2.12.X
----------------

- The metamodel for templates has been upgraded, and accessing the reply values is changed due to additional metadata about each reply, see :ref:`document-context`. But if we are using filters such as ``reply_str_value``, it gets the reply object with value correctly. Moreover, for working with integration reply, the type values are renamed ``IntegrationValue`` -> ``IntegrationType`` and ``PlainValue`` -> ``PlainType`` for consistency.

2.10.X to 2.11.X
----------------

- If we are using the ``questionnaire-report`` template, it is recommended to upgrade it to version 1.2.0 (from `Registry <https://registry.ds-wizard.org/templates/dsw:questionnaire-report:1.2.0>`_ or `GitHub Release <https://github.com/ds-wizard/questionnaire-report-template/releases/tag/v1.2.0>`_) so it displays also new Multi-Choice questions. Otherwise the choices won't appear in the exported document if there are any.

2.9.X to 2.10.X
---------------

*(nothing)*

2.8.X to 2.9.X
--------------

*(nothing)*

2.7.X to 2.8.X
--------------

*(nothing)*

2.6.X to 2.7.X
--------------

*(nothing)*

2.5.X to 2.6.X
--------------

- The document templates including the default ``questionnaire-report`` must be updated from the `DSW Registry <https://registry.ds-wizard.org/templates>`_.
- Upgraded template metamodel version 2 requires manual migration of custom templates:

  - `questionnaireRepliesMap` (map path:Reply) is no longer present in the context
  - `questionnaireReplies` is now map with path:ReplyValue, provided filters (such as ``reply_str_value``) are adjusted but wherever we used ``reply.value.value`` it should be ``reply.value`` with this change.
  - Reply for item question is no longer an integer (number of answers) but a list of UUIDs representing the answers instead of integers. We added ``reply_items`` to extract the list from a ReplyValue.

- Since 2.6.0, we are using `WebSockets <https://en.wikipedia.org/wiki/WebSocket>`_ (for live collaboration). If we are using a proxy, we need to configure it accordingly. For example, in case of Nginx:

.. code-block:: nginx

   server {
      # ...

      location / {
         # ...

         # required for websockets
         proxy_http_version 1.1;
         proxy_set_header Upgrade $http_upgrade;
         proxy_set_header Connection "upgrade";
         proxy_read_timeout 86400;
         proxy_send_timeout 86400;
      }
   }


2.4.X to 2.5.X
--------------

- Document templates have been moved from FS to database. To simplify the transition for custom templates, we added to the Docker image a script that loads templates from FS to the database via DSW API. But there are several new information that we need to provide in ``template.json`` file: ``id`` (instead of ``uuid``), ``templateId``, ``organizationId``, ``version`` (semver), ``license``, ``readme`` (Markdown). The ``id`` should be in format ``organizationId:templateId:version``. Please note that this applies only for custom templates, default template can be removed from FS as it is added to the database automatically. The script must be enabled by setting envvar ``ENABLE_TEMPLATE_LOAD`` to ``1`` and ``SERVICE_TOKEN`` according to the configuration.
- Cron is no longer needed for the feedback synchronization (environment variables in ``docker-compose.yml``) as DSW schedules synchronization internally.

2.3.X to 2.4.X
--------------

- To unify configuration, document-worker now supports and prefers YAML configuration files.
- Local/custom ``template.json`` files must be updated (renamed ``allowedKMs`` to ``allowedPackages``, and several new attributes: ``description`` for template and ``shortName`` + ``color`` for each format).

2.2.X to 2.3.X
--------------

*(nothing)*

2.1.X to 2.2.X
--------------

- Configuration of client and several features is now moved from ``application.yml`` file to in-app settings. therefore, it must be reconfigured during upgrade process. Additional ``secret`` must be configured in ``application.yml`` for encryption and JWT tokens (*JWT.secret* section has been removed), see :ref:`config-server` configuration. It is recommended to first add *general.secret* (32 chars secret), start DSW, migrate options from ``application.yml`` in-app settings and then optionally clean up ``application.yml`` file.
- User fields ``name`` and ``surname`` has been renamed to ``firstName`` and ``lastName`` - it needs be updated if used in **custom** mail or document templates.
- Recommended version of MongoDB is updated to 4.2.3.

2.0.X to 2.1.X
--------------

- There is a significant change related to new *Document Worker* that handles generation of documents from templates and filled questionnaires. We need to run RabbitMQ and document-worker with correct configuration according to server, see :ref:`installation-docker` and :doc:`./configuration/configuration` for details.

1.10.X to 2.0.X
---------------

- Changing the major version actually does not mean any problem in migration, it has been made due to significant internal changes (restructuring, new repositories, etc.)
- If we are using Docker for running DSW, we need to change it according to new documentation of :ref:`installation-docker` and :doc:`./configuration/configuration`.
- Crontab image is no longer needed.
- A DMP template configuration file must contain list of ``allowedKMs`` (see the default *root* template).

1.9.X to 1.10.X
---------------

- Custom DMP templates needs to be upgraded to a new structure (see the default *root* template).
