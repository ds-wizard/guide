..  _configuration-files:

Configuration Files
*******************

Configuration files are used for setting the server-side configuration. Several components can read the same YAML file, but each component has its own configuration schema. Use the configuration shipped with the matching 5.0 component versions.


.. _config-server:

Server Configuration
====================

For reference, see the `configuration <https://github.com/ds-wizard/dsw-deployment-example/blob/main/config/application.yml>`__ of the DSW Deployment example.

General
-------

This configuration section is used only by **Server** and covers basic configuration of the application.

.. NOTE::

    The 5.0 client is served at the web root. Set ``general.clientUrl`` to its public address; do not append the old ``/wizard`` path unless your deployment explicitly supports that path.

.. confval:: general.serverPort

   :type: Int
   :default: ``3000``

    Port that will be the web server listening on.

.. confval:: general.clientUrl

   :type: URI

    Public address of the client application, for example ``https://dsw.example.org``.

.. confval:: general.secret

   :type: String

    Secret string of 32 characters for encrypting configuration in the database.

.. confval:: general.rsaPrivateKey

    :type: String

    RSA private key for signing JWT tokens according to RS256 algorithm in PEM format (e.g. use ``ssh-keygen -t rsa -b 4096 -m PEM -f jwtRS256.key`` without passphrase and paste the contents to this configuration item).


.. WARNING::

    We should keep our ``secret`` and ``rsaPrivateKey`` secured! Changing ``secret`` will require re-configuration of secrets stored in the database, e.g., Registry API key.

Keep ``general.secret`` stable and include it in protected configuration backups. Changing it makes existing encrypted values unreadable unless they are re-encrypted or entered again.

Before rotating it, arrange secure recovery of OpenID client secrets, the Registry API key, knowledge model secrets and encrypted document-submission properties. Plan how those values will be restored with the administrator. Recreating an OpenID provider creates new callback and logout addresses that must be registered with the identity provider.

If rotation is necessary:

#. Back up the database and configuration. Securely retain the old secret and recover the original values of encrypted settings while it still works. A masked value in a form is not a recoverable copy.
#. Arrange administrative access that does not depend on the OpenID settings being changed. Remove affected configured secrets before changing the encryption key, or use a separately verified re-encryption procedure.
#. Change ``general.secret`` and restart the server (re-create its container when using Docker).
#. Re-enter the recovered settings with the new secret and test each affected integration. If a provider was recreated, register its new callback and logout addresses.
#. Ask users of encrypted document-submission properties to enter their values again in their profile settings, then test submission.

Do not rotate the key until the recovery values and a working administrative sign-in method are available.

Public links and hosting
------------------------

.. confval:: general.privacyUrl

   :type: URI

   Optional public privacy-policy destination.

.. confval:: general.termsOfServiceUrl

   :type: URI

   Optional public terms-of-service destination.

.. confval:: multiTenancy.enabled

   :type: Boolean
   :default: ``false``

   Enables multi-tenant hosting in the server. Keep it disabled for a normal single-instance deployment. The document worker and mailer read their separate ``cloud.enabled`` option; keep that disabled for the same deployment.

Database
--------

Information for connection to PostgreSQL database.

.. confval:: database.connectionString

   :type: String

    PostgreSQL database `connection string <https://www.postgresql.org/docs/current/libpq-connect.html#LIBPQ-CONNSTRING>`__ (typically: ``postgresql://{username}:{password}@{hostname}:{port}/{dbname}``, for example, ``postgresql://postgres:postgres@localhost:5432/postgres``).

S3
--

Information for connection to S3-compatible object storage, such as `Garage <https://garagehq.deuxfleurs.fr/>`__ (used for documents, document template assets, files, and locales).

.. confval:: s3.url

   :type: URI

    Endpoint of S3-compatible storage, e.g., ``http://host.docker.internal:9000`` in the local Garage deployment example.

    The value must be reachable both by DSW services and by users' browsers. DSW uses this URL when creating links for document downloads, document previews, template exports, locale exports, and other stored files. For production, use a public HTTPS URL through your reverse proxy or equivalent infrastructure. For local Docker Compose testing, the Garage example publishes the S3 API on the host and uses ``host.docker.internal`` so containers and the browser can reach the same endpoint.

.. confval:: s3.username

    :noindex:
    :type: String

    Username (or ``Access Key ID``) for authentication

.. confval:: s3.password

   :type: String

    Password (or ``Secret Access Key``) for authentication

.. confval:: s3.bucket

   :type: String
   :default: ``engine-wizard``

    Bucket name used by DSW

.. confval:: s3.region

   :type: String

    S3 region used by the storage client. For the Garage deployment example, use ``garage``. For AWS S3, use the AWS region of the bucket.


.. WARNING::

    The value of ``s3.url`` must be accessible by users' browsers. If it points only to an internal Docker hostname, users may see timeouts, broken document previews, or failed downloads. The configured bucket must also exist; otherwise documents cannot be created and document templates or locales cannot be imported.


.. NOTE::

    The `DSW Deployment Example <https://github.com/ds-wizard/dsw-deployment-example>`__ uses Garage and includes ``create-bucket.sh`` for the one-time local bootstrap. It assigns the single-node Garage layout, creates the ``engine-wizard`` bucket, imports the configured S3 key, and grants bucket permissions.


Mail
----

This configuration section is used only by **Mailer**. It must be filled with SMTP connection information to allow sending emails (registration verification, password recovery, project invitation, etc.).

.. confval:: mail.enabled

   :type: Boolean

    It should be set to ``true`` unless used for local testing only.

.. confval:: mail.name

   :type: String

    Name of the DSW instance that will be used as “senders name” in email headers.

.. confval:: mail.email

   :type: String

    Email address from which the emails will be sent.

.. confval:: mail.provider

   :type: String
   :default: ``smtp``

    Possible values are currently: ``smtp`` and ``amazonses``. Then based on the provider, the corresponding configuration section must be filled.

.. confval:: mail.smtp.host

   :type: String

    Hostname or IP address of SMTP server.

.. confval:: mail.smtp.port

   :type: Int

    Port that is used for SMTP on the server (usually ``25`` for plain, ``465`` for SSL, or ``587`` for STARTTLS).

.. confval:: mail.smtp.security

    :type: String
    :default: ``plain``

     Security of the SMTP connection. Possible values are: ``plain``, ``ssl``, and ``tls``.

.. confval:: mail.smtp.username

   :type: String

    Username for the SMTP connection. (If no username/password is given, it is assumed that no authentication is needed.)

.. confval:: mail.smtp.password

    :type: String

     Password for the SMTP connection. (If no username/password is given, it is assumed that no authentication is needed.)

.. confval:: mail.smtp.timeout

   :type: Float
   :default: ``5``

    Optional timeout for SMTP connection in seconds.

.. confval:: mail.amazonSes.region

   :type: String

    AWS region for Amazon Simple Email Service (SES).

.. confval:: mail.amazonSes.accessKeyId

    :type: String

     Access Key ID for AWS.

.. confval:: mail.amazonSes.secretAccessKey

    :type: String

     Secret Access Key for AWS.


While the following SMTP configuration still works, it is discouraged to use as **deprecated**:

.. confval:: mail.host

   :type: String

    Hostname or IP address of SMTP server.

.. confval:: mail.port

   :type: Int

    Port that is used for SMTP on the server (usually ``25`` for plain or ``465`` for SSL).

.. confval:: mail.ssl

   :type: Boolean
   :default: ``false``

    If SMTP connection is encrypted via SSL (we highly recommend this).

.. confval:: mail.security

   :type: String
   :default: ``plain``

    Security of the SMTP connection. Possible values are: ``plain``, ``ssl`` and ``tls``. (``ssl`` is used if ``mail.ssl`` is ``true``.)

.. confval:: mail.authEnabled

   :type: Boolean

    If authentication using username and password should be used for SMTP.

.. confval:: mail.username

   :type: String

    Username for the SMTP connection.

.. confval:: mail.password

   :type: String

    Password for the SMTP connection.

Externals
---------

This configuration section is used only by **Document Worker**. We can affect steps for templates that use external tools (``pandoc``). It is usually sufficient to keep the defaults. Each of them has configuration options:

.. confval:: executable

   :type: String

    Command or path to run the external tool.

.. confval:: args

   :type: String

    Command line arguments used to run the tool.

.. confval:: timeout

   :type: Int

    Optional for limiting time given to run the tool.

Document rendering
^^^^^^^^^^^^^^^^^^

Generated documents use context 19.0, supplied by the server. Configure the application's branding through :doc:`/application/administration/settings/user-interface/look-and-feel`. Custom templates should read the current :doc:`document context </more/development/document-templates/document-context>` rather than relying on old worker ``documentContext`` fields.

.. _integration-yml-file:

Integrations Configuration
==========================

API integrations can use secrets for credentials and endpoints. We can manage them under :doc:`Knowledge Model Secrets </application/knowledge-models/secrets>` or provide server-wide fallback values in the integration configuration file.

The server reads the file configured by ``general.integrationConfig``, or ``INTEGRATION_CONFIG_PATH`` when set. Put fallback values in its top-level ``secrets`` map:

.. code-block:: yaml

    secrets:
        dbaseApiKey: example-only-not-a-real-key
        dbaseApiUrl: https://api.example.invalid

Reference these values in the integration's request configuration using ``{{ secrets.dbaseApiKey }}`` and ``{{ secrets.dbaseApiUrl }}``. Values saved in Knowledge Model Secrets take precedence over file values with the same name.

Question-specific parameters use ``{{ variables.name }}``; see :ref:`integration-questions`. The older per-integration YAML sections and ``${name}`` placeholders do not configure the current API integration requests. Update older integration configurations to the current secret references.


.. _client-configuration:

Client Configuration
====================

For the Docker client, set ``API_URL`` to the backend's API base, normally ``https://dsw.example.org/api``. The client writes this value into ``config.js`` on startup.

For frontend development, create ``apps/dsw/static/config.js`` in the frontend repository:

.. code-block:: javascript

   window.app = {
       apiUrl: 'http://localhost:3000/api'
   }

The production client is served at the web root. Proxy ``/api`` to the backend and preserve WebSocket upgrades. Set ``general.clientUrl`` on the server to the matching public client address.

Branding and favicon
--------------------

Use :doc:`Look & Feel </application/administration/settings/user-interface/look-and-feel>` for the title, logo and primary color.

The client image serves its static files from ``/usr/share/nginx/html``. The favicon files are under ``assets/favicon``. If replacing them through a volume, mount the files into that directory rather than the old ``/wizard/img/favicon`` path.

Custom head content
-------------------

A file mounted at ``/src/head-extra.html`` is inserted before ``</head>`` when the client starts. Use this for deployment-specific head content. For example:

.. code-block:: yaml

   client:
     volumes:
       - ./head-extra.html:/src/head-extra.html:ro

The 5.0 interface uses its own design-system variables; old Bootstrap ``--bs-*`` overrides do not describe the current theme. Prefer the application's branding settings for standard changes. Check custom CSS in both light and dark appearance after each interface update.
