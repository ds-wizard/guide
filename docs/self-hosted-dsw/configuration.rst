*************
Configuration
*************


.. _config-settings:

Settings
========

Most of the configuration is done through :ref:`Settings<settings>` (accessible by Administrator).

Configuration Files
===================

Configuration files are used for setting the server-side configuration. Since 3.0 release, the configuration for server and document worker components overlap. Therefore, you can have a single configuration file for both.


.. _config-server:

Server Configuration
--------------------

For reference, see `configuration <https://github.com/ds-wizard/dsw-deployment-example/blob/main/dsw.yml>`__ of the DSW Deployment example.

General
^^^^^^^

This configuration section is used only by **Server** and covers basic configuration of the application.

.. confval:: serverPort

   :type: Int
   :default: ``3000``

    Port that will be the web server listening on.

.. confval:: secret

   :type: String

    Secret string of 32 characters for encrypting configuration in database and JWT tokens.

.. confval:: clientUrl

   :type: URI

    Address of client application (e.g. `https://localhost:8080 <https://localhost:8080>`__).

.. WARNING::

    Keep your ``secret`` secured! Changing ``secret`` will require re-configuration of secrets stored in the database, e.g., token for Registry.

If you need to change your ``secret``, you need also replace all values encrypted by secret that are stored in the database as follows:

1. Note somewhere values from Settings: Client ID and Client Secret of OpenID configurations, Registry token, and GitHub token for Feedback functionality, etc. Adjust the settings that the values are not there (recommended; e.g. remove OpenID configuration), and save it.
2. Change ``secret`` in the configuration file and restart DSW server (re-create the container if using Docker).
3. Adjust the settings back to your previous values.
4. If you use also some "user properties" (for Document Submission feature), let your users know to change the values in their profiles.

Database
^^^^^^^^

Information for connection to PostgreSQL database.

.. confval:: database.connectionString

   :type: String

    PostgreSQL database `connection string <https://www.postgresql.org/docs/current/libpq-connect.html#LIBPQ-CONNSTRING>`__ (typically: ``postgresql://{username}:{password}@{hostname}:{port}/{dbname}``, for example, ``postgresql://postgres:postgres@localhost:5432/postgres``).

S3
^^

Information for connection to S3 storage (used for document and template asset files).

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

    Bucket name used by DSW

Mail
^^^^

This configuration section is used only by **Server**. It must be filled with SMTP connection information to allow sending emails (registration verification, password recovery, project invitation, etc.).


.. confval:: mail.enabled

   :type: String

    It should be set to ``true`` unless used for local testing only.

.. confval:: mail.name

   :type: String

    Name of the DS Wizard instance that will be used as “senders name” in email headers.

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

This configuration section is used only by **Document Worker**. You can affect steps for templates that use external tools (``pandoc`` and ``wkhtmltopdf``). It is usually sufficient to keep the defaults. Each of them has configuration options:

.. confval:: executable

   :type: String

    Command or path to run the external tool.

.. confval:: args

   :type: String

    Command line arguments used to run the tool.

.. confval:: timeout

   :type: Int

    Optional for limiting time given to run the tool.

Integrations Configuration
--------------------------

Integrations in the DS Wizard are using external APIs and you might need some configured variables such as API keys or endpoints. For example, integration with ID ``dbase`` might use following configuration.

.. CODE-BLOCK:: yaml

    dbase:
        apiKey: topSecretDBaseApiKey
        apiUrl: https://api.dbase.example:10666
        someConfig: someValue4Integration

There can be multiple integrations configured in single file. These can be used then when setting up the integration in the Editor as ``${apiKey}``, ``${apiUrl}``, etc. More about integrations can be found in separate integrations documentation.

.. NOTE::

     Different knowledge models may use different variable naming, please read the information in README to find out what is required. We recommend authors to stick with ``apiKey`` and ``apiUrl`` variables as our convention.

Client Configuration
--------------------

If you are running the client app using “With Docker”, the all you need is to specify ``API_URL`` environment variable inside ``docker-compose.yml``. In case you want to run the client locally, you need to create a ``config.js`` file in the project root:

.. CODE-BLOCK:: javascript

    window.dsw = {
        apiUrl: 'http://localhost:3000'
    }

Client also provides wide variety of style customizations using SASS variables or message localization. Then you can mount it as volumes in case Docker as well:

.. CODE-BLOCK:: yaml

    volumes:
        # mount SCSS file
        - /path/to/extra.scss:/src/scss/customizations/_extra.scss
        - /path/to/overrides.scss:/src/scss/customizations/_overrides.scss
        - /path/to/variables.scss:/src/scss/customizations/_variables.scss
        - /path/to/provisioning.json:/configuration/provisioning.json:ro
        # mount other assets, you can then refere them from scss using '/assets/...'
        - /path/to/assets:/usr/share/nginx/html/assets

* ``_extra.scss`` = This file is loaded before all other styles. You can use it, for example, to define new styles or import fonts.
* ``_overrides.scss`` = This file is loaded after all other styles. You can use it to override existing styles.
* ``_variables.scss`` = A lot of values related to styles are defined as variables. The easiest way to customize the style is to define new values for these variables using this file.

For more information about variables and assets, visit `Theming Bootstrap <https://getbootstrap.com/docs/4.0/getting-started/theming/>`__. The color of illustrations can be adjusted using ``$illustrations-color`` variable.

Document Templates
==================

You can freely customize and style templates of documents (DMPs). HTML and CSS knowledge is required and for doing more complex templates that use some conditions, loops, or macros, knowledge of `Jinja templating language <https://jinja.palletsprojects.com/en/3.1.x/>`__ (pure Python implementation) is useful.

.. TODO:

    Add link

    For further information, read Template Development.

Email Templates
===============

Similarly to document templates, you can customize templates for emails sent by the Wizard located in ``templates/mail`` folder. It also uses `Jinja templating language <https://jinja.palletsprojects.com/en/3.1.x/>`__. And you can create HTML template, Plain Text template, add attachments, and add inline images (which can be used inside the HTML using `Content-ID <https://en.wikipedia.org/wiki/MIME#Related>`__ equal to the filename).

Templates Structure
-------------------

The structure is following:

* ``templates/mail/_common`` = layout, styles, common files
* ``templates/mail/_common/attachments`` = attachments for all emails
* ``templates/mail/_common/images`` = inline images for all emails
* ``templates/mail/<name>`` = templates specific for this email type, should contain message.html.j2 and message.txt.j2 files (or at least one of them, `mail servers prefer both variants <https://litmus.com/blog/reach-more-people-and-improve-your-spam-score-why-multi-part-email-is-important>`__)
* ``templates/mail/<name>/attachments`` = attachments specific for email type
* ``templates/mail/<name>/images`` = inline images specific for email type

All attachments are loaded from the template-specific and common folders and included to email with detected `MIME type <https://en.wikipedia.org/wiki/Media_type>`__. It similarly works for inline images but those are not displayed as attachments just as `related part <https://en.wikipedia.org/wiki/MIME#Related>`__ to HTML part (if present). We highly recommend to use ASCII-only names without whitespaces and with standard extensions. Also, sending minimum amount of data via email is suggested.

Templates variables
-------------------

All templates are provided also with variables:

.. TODO:

    links to old documentation?

* ``appTitle`` = from the configuration ``appTitle``
* ``clientAddress`` = from the configuration ``clientUrl``
* ``mailName`` = from the configuration ``name``
* ``user`` = user (subject of an email), structure with attributes accessible via . (dot, e.g. ``user.name``)

Email types
-----------

Currently, there are following types of mail:

.. TODO:

    links to old documentation?

* ``registrationConfirmation`` = email sent to user after registration to verify email address, contains ``activationLink`` variable
* ``registrationCreatedAnalytics`` = email sent to address specified in the configuration about registration of a new user (see Analytics config)
* ``resetPassword`` = email sent to user when requests resetting a password, contains ``resetLink`` variable

Docker deployment
-----------------

Including own email templates while using dockerized Wizard is practically the same as for DMP templates. You can also bind whole ``templates/mail`` folder (or even ``templates`` if want to change both):

.. CODE-BLOCK:: yaml

    mailer:
        image: datastewardshipwizard/mailer
        restart: always
    volumes:
        - /dsw/application.yml:/app/config.yml:ro
        - /dsw/templates/mail:/app/templates:ro
    # ... (continued)
