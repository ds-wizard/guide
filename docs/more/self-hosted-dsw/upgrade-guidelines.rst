Upgrade Guidelines
******************

Upgrading |project_name|
========================

.. Warning::

   Backup database and other important data (e.g., configuration) before upgrade!


Using Docker
------------

In case of using Docker, just use the tag in ``docker-compose.yml`` or pull the new Docker image and restart using down/up:

.. code-block:: shell

   $ docker pull datastewardshipwizard/wizard-server
   $ docker pull datastewardshipwizard/wizard-client
   $ docker pull datastewardshipwizard/document-worker
   $ docker pull datastewardshipwizard/mailer
   $ docker-compose down
   $ docker-compose up -d


Other setup (using Git)
-----------------------

All we need to do is download or checkout the new version from GitHub repositories and rebuild the application (according to the guidelines above):

.. code-block:: shell

   $ git checkout vX.Y.Z

Upgrade process
===============

Usually, nothing special is required for the upgrade. Internal structure changes are migrated automatically using DB migrations and Metamodel migrations *(since 1.8.0)*. See below the changes that need to be done by us *(since 1.10.0)*:


.. Warning::
   
   Make sure to stop ``document-worker`` and ``mailer`` before upgrading to the next version. Run ``wizard-server`` first, then run the workers. Otherwise the database migrations might not work correctly.

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
----------------

*(nothing)*

4.7.X to 4.8.X
----------------

*(nothing)*

4.6.X to 4.7.X
----------------

*(nothing)*

4.5.X to 4.6.X
----------------

*(nothing)*

4.4.X to 4.5.X
----------------

*(nothing)*

4.3.X to 4.4.X
----------------

*(nothing)*

4.2.X to 4.3.X
----------------

- The document template metamodel version is raised to 13.

4.1.X to 4.2.X
----------------

*(nothing)*

4.0.X to 4.1.X
--------------

- **(breaking)** DSW Integration Widget SDK for :ref:`development-integration-widget` and DSW Importer SDK for :ref:`development-importers` are now deprecated. `DSW Integration SDK <https://github.com/ds-wizard/dsw-integration-sdk>`__ should be used instead.
- The document template metamodel version is raised to 12.


3.28.X to 4.0.X
---------------

- **(breaking)** The client runs on the nested route ``/wizard``, and the server runs on the nested route ``/wizard-api``. These changes must be reflected in the deployment configuration (such as routing in a reverse proxy) and the ``clientUrl`` in the :ref:`config-server`.
- **(breaking)** :ref:`client-configuration` for a custom logo and theme no longer uses SASS and needs to be updated accordingly.
- **(breaking)** :ref:`api-keys` created in previous versions will no longer work.
- **(breaking)** The callback URL for :ref:`OpenID <auth-services>` (such as Google or Life Science Login) has changed due to the nested route, so it has to be set up, for example:
  
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

- If we are upgrading from the older version then 3.16.X we need to first upgrade to version 3.16.X.

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
----------------

- Standalone mailer component has been introduced. We need to adjust our deployment (e.g., `docker-compose.yml`) accordingly (see `deployment-example <https://github.com/ds-wizard/dsw-deployment-example>`__).

3.8.X to 3.9.X
----------------

*(nothing)*

3.7.X to 3.8.X
----------------

- All KM migrations must be finished (completed or deleted); otherwise, the upgrade of the backend (database) will fail with the corresponding message in the logs.

3.6.X to 3.7.X
----------------

*(nothing)*

3.5.X to 3.6.X
----------------

*(nothing)*

3.4.X to 3.5.X
----------------

- The template metamodel version has been updated (to v5). Updating all document templates is needed (annotations were added, so we can safely change version 4 to version 5 without breaking anything).
- All KM migrations must be finished (completed or deleted); otherwise, the upgrade of the backend (database) will fail with the corresponding message in the logs.

3.3.X to 3.4.X
----------------

*(nothing)*

3.2.X to 3.3.X
----------------

*(nothing)*

3.1.X to 3.2.X
--------------

- The template metamodel version has been updated (to v4). Updating all document templates is needed.
- All knowledge models have (after the automatic data migration) the default metrics and phases that can be changed in KM Editor.

3.0.X to 3.1.X
--------------

- As an administrator, we should either disable the "Project Templates" feature (Settings - Projects - Project Creation, select "Custom only") or prepare some project templates for our users to avoid confusion.

2.14.X to 3.0.X
----------------

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

- The document templates including the default ``questionnaire-report`` must be updated from `https://registry.ds-wizard.org/templates <Registry>`_.
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

- Document templates have been moved from FS to database. To simplify the transition for custom templates, we added to the Docker image a script that loads templates from FS to the database via |project_name| API. But there are several new information that we need to provide in ``template.json`` file: ``id`` (instead of ``uuid``), ``templateId``, ``organizationId``, ``version`` (semver), ``license``, ``readme`` (Markdown). The ``id`` should be in format ``organizationId:templateId:version``. Please note that this applies only for custom templates, default template can be removed from FS as it is added to the database automatically. The script must be enabled by setting envvar ``ENABLE_TEMPLATE_LOAD `` to ``1`` and ``SERVICE_TOKEN`` according to the configuration.
- Cron is no longer needed for the feedback synchronization (environment variables in ``docker-compose.yml``) as |project_name| schedules synchronization internally.

2.3.X to 2.4.X
--------------

- To unify configuration, document-worker now supports and prefers YAML configuration files.
- Local/custom ``template.json`` files must be updated (renamed ``allowedKMs`` to ``allowedPackages``, and several new attributes: ``description`` for template and ``shortName`` + ``color`` for each format).

2.2.X to 2.3.X
--------------

*(nothing)*

2.1.X to 2.2.X
--------------

- Configuration of client and several features is now moved from ``application.yml`` file to in-app :ref:`config-settings`; therefore, it must be reconfigured during upgrade process. Additional ``secret`` must be configured in ``application.yml`` for encryption and JWT tokens (*JWT.secret* section has been removed), see :ref:`config-server` configuration. It is recommended to first add *general.secret* (32 chars secret), start |project_name|, migrate options from ``application.yml`` to :ref:`config-settings` and then optionally clean up ``application.yml`` file.
- User fields ``name`` and ``surname`` has been renamed to ``firstName`` and ``lastName`` - it needs be updated if used in **custom** mail or document templates.
- Recommended version of MongoDB is updated to 4.2.3.

2.0.X to 2.1.X
--------------

- There is a significant change related to new *Document Worker* that handles generation of documents from templates and filled questionnaires. We need to run RabbitMQ and document-worker with correct configuration according to server, see :ref:`installation-docker` and :doc:`configuration` for details.

1.10.X to 2.0.X
---------------

- Changing the major version actually does not mean any problem in migration, it has been made due to significant internal changes (restructuring, new repositories, etc.)
- If we are using Docker for running |project_name|, we need to change it according to new documentation of :ref:`installation-docker` and :doc:`configuration`.
- Crontab image is no longer needed.
- A DMP template configuration file must contain list of ``allowedKMs`` (see the default *root* template).

1.9.X to 1.10.X
---------------

- Custom DMP templates needs to be upgraded to a new structure (see the default *root* template).


Compatibility
=============

.. Important::

   |project_name| components (server, client, document worker, mailer, registry) should always use the matching version (compatibility is assured)!


The |project_name| is compatible with all recent versions of web browsers Chrome, Opera, Firefox, and Edge. We do not recommend the use of Internet Explorer. 

The following table shows the compatibility of the |project_name| with the metamodel versions of Knowledge models, Document Templates, Project Importers, and the Registry.

+------------------+--------------+-----------------------------+----------------------------+-----------+
| Wizard           | KM Metamodel | Document Template Metamodel | Project Importer Metamodel | Registry  |
+==================+==============+=============================+============================+===========+
| 3.24.0           |           13 |                          11 |                          1 |    3.24.0 |
+------------------+--------------+-----------------------------+----------------------------+-----------+
| 3.23.0           |           13 |                          11 |                          1 |    3.23.0 |
+------------------+--------------+-----------------------------+----------------------------+-----------+
| 3.22.0           |           13 |                          11 |                          1 |    3.22.0 |
+------------------+--------------+-----------------------------+----------------------------+-----------+
| 3.21.0           |           13 |                          11 |                          1 |    3.21.0 |
+------------------+--------------+-----------------------------+----------------------------+-----------+
| 3.20.0           |           13 |                          11 |                          1 |    3.20.0 |
+------------------+--------------+-----------------------------+----------------------------+-----------+
| 3.19.0           |           13 |                          10 |                          1 |    3.19.0 |
+------------------+--------------+-----------------------------+----------------------------+-----------+
| 3.18.0           |           13 |                          10 |                          1 |    3.18.0 |
+------------------+--------------+-----------------------------+----------------------------+-----------+
| 3.17.0           |           13 |                          10 |                          1 |    3.17.0 |
+------------------+--------------+-----------------------------+----------------------------+-----------+
| 3.16.0           |           13 |                          10 |                          1 |    3.16.0 |
+------------------+--------------+-----------------------------+----------------------------+-----------+
| 3.15.0           |           13 |                          10 |                          1 |    3.15.0 |
+------------------+--------------+-----------------------------+----------------------------+-----------+
| 3.14.0           |           13 |                          10 |                         -- |    3.14.0 |
+------------------+--------------+-----------------------------+----------------------------+-----------+
| 3.13.0           |           13 |                          10 |                         -- |    3.13.0 |
+------------------+--------------+-----------------------------+----------------------------+-----------+
| 3.12.0           |           13 |                          10 |                         -- |    3.12.0 |
+------------------+--------------+-----------------------------+----------------------------+-----------+
| 3.11.0           |           12 |                           9 |                         -- |    3.11.0 |
+------------------+--------------+-----------------------------+----------------------------+-----------+
| 3.10.0           |           12 |                           9 |                         -- |    3.10.0 |
+------------------+--------------+-----------------------------+----------------------------+-----------+
| 3.9.0            |           11 |                           8 |                         -- |     3.9.0 |
+------------------+--------------+-----------------------------+----------------------------+-----------+
| 3.8.0            |           11 |                           8 |                         -- |     3.8.0 |
+------------------+--------------+-----------------------------+----------------------------+-----------+
| 3.7.0            |           10 |                           7 |                         -- |     3.7.0 |
+------------------+--------------+-----------------------------+----------------------------+-----------+
| 3.6.0            |           10 |                           6 |                         -- |     3.6.0 |
+------------------+--------------+-----------------------------+----------------------------+-----------+
| 3.5.0            |            9 |                           5 |                         -- |     3.5.0 |
+------------------+--------------+-----------------------------+----------------------------+-----------+
| 3.4.0            |            8 |                           4 |                         -- |     3.4.0 |
+------------------+--------------+-----------------------------+----------------------------+-----------+
| 3.3.0            |            8 |                           4 |                         -- |     3.3.0 |
+------------------+--------------+-----------------------------+----------------------------+-----------+
| 3.2.0            |            8 |                           4 |                         -- |     3.2.0 |
+------------------+--------------+-----------------------------+----------------------------+-----------+
| 3.1.0            |            7 |                           3 |                         -- |     3.1.0 |
+------------------+--------------+-----------------------------+----------------------------+-----------+
| 3.0.0            |            7 |                           3 |                         -- |     3.0.0 |
+------------------+--------------+-----------------------------+----------------------------+-----------+
| 2.14.0           |            7 |                           3 |                         -- |    2.14.0 |
+------------------+--------------+-----------------------------+----------------------------+-----------+
| 2.13.0           |            7 |                           3 |                         -- |    2.13.0 |
+------------------+--------------+-----------------------------+----------------------------+-----------+
| 2.12.0           |            6 |                           3 |                         -- |    2.12.0 |
+------------------+--------------+-----------------------------+----------------------------+-----------+
| 2.11.0           |            5 |                           2 |                         -- |    2.11.0 |
+------------------+--------------+-----------------------------+----------------------------+-----------+
| 2.10.0           |            5 |                           2 |                         -- |    2.10.0 |
+------------------+--------------+-----------------------------+----------------------------+-----------+
| 2.9.0            |            5 |                           2 |                         -- |     2.9.0 |
+------------------+--------------+-----------------------------+----------------------------+-----------+
| 2.8.0            |            5 |                           2 |                         -- |     2.8.0 |
+------------------+--------------+-----------------------------+----------------------------+-----------+
| 2.7.0            |            5 |                           2 |                         -- |     2.7.0 |
+------------------+--------------+-----------------------------+----------------------------+-----------+
| 2.6.0            |            5 |                           2 |                         -- |     2.6.0 |
+------------------+--------------+-----------------------------+----------------------------+-----------+
| 2.5.0            |            5 |                           1 |                         -- |     2.5.0 |
+------------------+--------------+-----------------------------+----------------------------+-----------+
| 2.4.0            |            5 |                          -- |                         -- |     2.4.0 |
+------------------+--------------+-----------------------------+----------------------------+-----------+
| 2.3.0            |            5 |                          -- |                         -- |     2.3.0 |
+------------------+--------------+-----------------------------+----------------------------+-----------+
| 2.2.0            |            5 |                          -- |                         -- |     2.2.0 |
+------------------+--------------+-----------------------------+----------------------------+-----------+
| 2.1.0            |            5 |                          -- |                         -- |     2.1.0 |
+------------------+--------------+-----------------------------+----------------------------+-----------+
| 2.0.0            |            5 |                          -- |                         -- |     2.0.0 |
+------------------+--------------+-----------------------------+----------------------------+-----------+
| 1.10.0           |            4 |                          -- |                         -- |     1.2.0 |
+------------------+--------------+-----------------------------+----------------------------+-----------+
| 1.9.0            |            3 |                          -- |                         -- |     1.1.0 |
+------------------+--------------+-----------------------------+----------------------------+-----------+
| 1.8.0            |            3 |                          -- |                         -- |     1.0.0 |
+------------------+--------------+-----------------------------+----------------------------+-----------+
| 1.7.0            |            2 |                          -- |                         -- |        -- |
+------------------+--------------+-----------------------------+----------------------------+-----------+
| 1.6.0            |            1 |                          -- |                         -- |        -- |
+------------------+--------------+-----------------------------+----------------------------+-----------+
| 1.5.0            |           -- |                          -- |                         -- |        -- |
+------------------+--------------+-----------------------------+----------------------------+-----------+
| 1.4.0            |           -- |                          -- |                         -- |        -- |
+------------------+--------------+-----------------------------+----------------------------+-----------+
| 1.3.0            |           -- |                          -- |                         -- |        -- |
+------------------+--------------+-----------------------------+----------------------------+-----------+
| 1.2.0            |           -- |                          -- |                         -- |        -- |
+------------------+--------------+-----------------------------+----------------------------+-----------+
| 1.1.0            |           -- |                          -- |                         -- |        -- |
+------------------+--------------+-----------------------------+----------------------------+-----------+
| 1.0.0            |           -- |                          -- |                         -- |        -- |
+------------------+--------------+-----------------------------+----------------------------+-----------+