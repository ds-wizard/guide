Configuration
*************


.. _config-settings:

Settings
========

Most of the configuration is done through :ref:`Settings<settings>` (accessible by Administrator).

Configuration Files
===================

Configuration files are used for setting the server-side configuration. Since the 3.0 release, the configuration for server and document worker components has overlapped. Therefore, we can have a single configuration file for both.


.. _config-server:

Server Configuration
--------------------

For reference, see the `configuration <https://github.com/ds-wizard/dsw-deployment-example/blob/main/config/application.yml>`__ of the DSW Deployment example.

General
^^^^^^^

This configuration section is used only by **Server** and covers basic configuration of the application.

.. confval:: serverPort

   :type: Int
   :default: ``3000``

    Port that will be the web server listening on.

.. confval:: clientUrl

   :type: URI

    Address of client application (e.g. `https://localhost:8080 <https://localhost:8080>`__).

.. confval:: secret

   :type: String

    Secret string of 32 characters for encrypting configuration in the database.

.. confval:: rsaPrivateKey

    :type: String

    RSA private key for signing JWT tokens according to RS256 algorithm in PEM format (e.g. use ``ssh-keygen -t rsa -b 4096 -m PEM -f jwtRS256.key`` without passphrase and paste the contents to this configuration item).


.. WARNING::

    We should keep our ``secret`` and ``rsaPrivateKey`` secured! Changing ``secret`` will require re-configuration of secrets stored in the database, e.g., token for Registry.

If we need to change our ``secret``, we need also replace all values encrypted by the secret that is stored in the database as follows:

1. Note somewhere values from Settings: Client ID and Client Secret of OpenID configurations, Registry token, and GitHub token for Feedback functionality, etc. Adjust the settings that the values are not there (recommended; e.g., remove OpenID configuration), and save it.
2. Change the ``secret`` in the configuration file and restart the |project_name| server (re-create the container if using Docker).
3. Adjust the settings back to our previous values.
4. If we also use some “user properties” (for the Document Submission feature), let our users know to change the values in their profiles.

Database
^^^^^^^^

Information for connection to PostgreSQL database.

.. confval:: database.connectionString

   :type: String

    PostgreSQL database `connection string <https://www.postgresql.org/docs/current/libpq-connect.html#LIBPQ-CONNSTRING>`__ (typically: ``postgresql://{username}:{password}@{hostname}:{port}/{dbname}``, for example, ``postgresql://postgres:postgres@localhost:5432/postgres``).

S3
^^

Information for connection to S3 storage (used for document and document template assets).

.. confval:: s3.url

   :type: URI

    Endpoint of S3 storage, e.g., ``http://minio:9000``

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

    Bucket name used by |project_name|


.. WARNING::

    S3 service must be publicly accessible (so users can download documents and export templates or locales). Also, bucket must be created otherwise documents cannot be created and documet tempates / locales imported.


Mail
^^^^

This configuration section is used only by **Mailer**. It must be filled with SMTP connection information to allow sending emails (registration verification, password recovery, project invitation, etc.).


.. confval:: mail.enabled

   :type: String

    It should be set to ``true`` unless used for local testing only.

.. confval:: mail.name

   :type: String

    Name of the |project_name| instance that will be used as “senders name” in email headers.

.. confval:: mail.email

   :type: String

    Email address from which the emails will be sent.

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
^^^^^^^^^

This configuration section is used only by **Document Worker**. We can affect steps for templates that use external tools (``pandoc`` and ``wkhtmltopdf``). It is usually sufficient to keep the defaults. Each of them has configuration options:

.. confval:: executable

   :type: String

    Command or path to run the external tool.

.. confval:: args

   :type: String

    Command line arguments used to run the tool.

.. confval:: timeout

   :type: Int

    Optional for limiting time given to run the tool.


.. _integration-yml-file:

Integrations Configuration
--------------------------

Integrations in the |project_name| use external APIs. Sometimes, we might need some configured variables, such as API keys or endpoints. For example, integration with ID ``dbase`` might use the following configuration.

.. CODE-BLOCK:: yaml

    dbase:
        apiKey: topSecretDBaseApiKey
        apiUrl: https://api.dbase.example:10666
        someConfig: someValue4Integration

There can be multiple integrations configured in a single file. These can be used then when setting up the integration in the Editor as ``${apiKey}``, ``${apiUrl}``, etc. More about integrations can be found in separate :ref:`integration questions documentation<integration_questions>`.

.. NOTE::

     Different knowledge models may use different variable naming. Please read the information in README to find out what is required. We recommend authors to stick with ``apiKey`` and ``apiUrl`` variables as our convention.

Client Configuration
--------------------

If we are running the client app using “With Docker”, the all we need is to specify ``API_URL`` environment variable inside ``docker-compose.yml``. In case we want to run the client locally, we need to create a ``config.js`` file in the project root:

.. CODE-BLOCK:: javascript

    window.dsw = {
        apiUrl: 'http://localhost:3000'
    }

The client also provides a wide variety of style customizations using SASS variables or message localization. Then we can mount it as volumes in case Docker as well:

.. CODE-BLOCK:: yaml

    volumes:
        # mount SCSS file
        - /path/to/extra.scss:/src/scss/customizations/_extra.scss
        - /path/to/overrides.scss:/src/scss/customizations/_overrides.scss
        - /path/to/variables.scss:/src/scss/customizations/_variables.scss
        - /path/to/provisioning.json:/configuration/provisioning.json:ro
        # mount other assets, we can then refere them from scss using '/assets/...'
        - /path/to/assets:/usr/share/nginx/html/assets

* ``_extra.scss`` = This file is loaded before all other styles. We can use it, for example, to define new styles or import fonts.
* ``_overrides.scss`` = This file is loaded after all other styles. We can use it to override existing styles.
* ``_variables.scss`` = A lot of values related to styles are defined as variables. The easiest way to customize the style is to define new values for these variables using this file.

For more information about variables and assets, visit `Theming Bootstrap <https://getbootstrap.com/docs/5.3/customize/overview/>`__. The color of illustrations can be adjusted using ``$illustrations-color`` variable.

Document Templates
==================

We can freely customize and style templates of documents (DMPs). HTML and CSS knowledge is required, and for doing more complex templates that use some conditions, loops, or macros, knowledge of `Jinja templating language <https://jinja.palletsprojects.com/en/3.1.x/>`__ (pure Python implementation) is useful. For more information, please read :ref:`the following section<document-template-development>`.


Email Templates
===============

Similarly to document templates, we can customize templates for emails sent by the Wizard located in ``templates`` folder. It also uses `Jinja templating language <https://jinja.palletsprojects.com/en/3.1.x/>`__. And we can create HTML template, Plain Text template, add attachments, and add inline images (which can be used inside the HTML using `Content-ID <https://en.wikipedia.org/wiki/MIME#Related>`__ equal to the filename). We can learn more about the template structure and contents directly from `the mailer GitHub repository <https://github.com/ds-wizard/engine-tools/tree/develop/packages/dsw-mailer/templates>`__.

Including our own email templates while using dockerized Wizard is practically the same as for DMP templates. We can also bind whole ``templates`` folders. (or even ``templates`` if we want to change both):

.. CODE-BLOCK:: yaml

    mailer:
        image: datastewardshipwizard/mailer
        restart: always
        depends_on:
        - postgres
        - dsw-server
        volumes:
        - ./config/application.yml:/app/config/application.yml:ro
        - ./templates:/home/user/templates:ro
    # ... (continued)
