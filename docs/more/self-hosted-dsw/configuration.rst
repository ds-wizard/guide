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

.. _client-configuration:

Client Configuration
--------------------

If we are running the client app using “With Docker”, the all we need is to specify ``API_URL`` environment variable inside ``docker-compose.yml``. In case we want to run the client locally, we need to create a ``config.js`` file in the project root:

.. CODE-BLOCK:: javascript

    window.dsw = {
        apiUrl: 'http://localhost:3000'
    }

Custom Logo
^^^^^^^^^^^

We can use our own custom logo by mounting it to the client container. The logo must be square and in SVG format.

.. CODE-BLOCK:: yaml

    dsw-client:
        volumes:
        - /path/to/logo.svg:/usr/share/nginx/html/wizard/img/logo.svg

Favicon
^^^^^^^

If we changed the logo, we might also want to change the favicon. First, we need to generate the necessary files using, for example, this `Favicon Generator <https://realfavicongenerator.net/>`__. The wizard uses the following files:

- android-chrome-192x192.png
- android-chrome-512x512.png
- apple-touch-icon.png
- browserconfig.xml
- favicon-16x16.png
- favicon-32x32.png
- favicon.ico
- mstile-144x144.png
- mstile-150x150.png
- mstile-310x150.png
- mstile-310x310.png
- mstile-70x70.png
- safari-pinned-tab.svg
- site.webmanifest

They are all in the ``/usr/share/nginx/html/wizard/img/favicon`` folder, so we can mount our generated favicon files from the generator there, or we can mount the whole folder:

.. CODE-BLOCK:: yaml

    dsw-client:
        volumes:
        - /path/to/favicon:/usr/share/nginx/html/wizard/img/favicon

Style Customizations
^^^^^^^^^^^^^^^^^^^^

We can mount a file called `head-extra.html` to the wizard client image to attach extra code to the ``<head>`` tag. This can be used to override some styles or CSS variables. For example, to change a color theme, we only need to override a few Bootstrap variables:

.. CODE-BLOCK:: html

    <style>
        --bs-bg-primary-color: rgb(255, 255, 255);
        --bs-btn-primary-active-bg: rgb(18, 128, 106);
        --bs-btn-primary-color: rgb(255, 255, 255);
        --bs-btn-primary-active-color: rgb(255, 255, 255);
        --bs-btn-primary-disabled-color: rgb(255, 255, 255);
        --bs-btn-primary-hover-bg: rgb(19, 136, 113);
        --bs-btn-primary-hover-color: rgb(255, 255, 255);
        --bs-focus-ring-color: 57, 174, 151;
        --bs-input-focus-border-color: rgb(139, 208, 194);
        --bs-link-color: rgb(22, 160, 133);
        --bs-link-color-rgb: 22, 160, 133;
        --bs-link-hover-color: rgb(18, 128, 106);
        --bs-link-hover-color-rgb: 18, 128, 106;
        --bs-primary: rgb(22, 160, 133);
        --bs-primary-bg: rgb(232, 246, 243);
        --bs-primary-bg2: rgb(208, 236, 231);
        --bs-primary-rgb: 22, 160, 133;
        --illustrations-color: rgb(241, 196, 15);
    </style>

For more information about what variables can be overridden, see the `CSS variables in Bootstrap documentation <https://getbootstrap.com/docs/5.3/customize/css-variables/>`__.

Once we have the file ready, we need to mount it into the container:

.. CODE-BLOCK:: yaml

    dsw-client:
        volumes:
        - /path/to/head-extra.html:/src/head-extra.html


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
