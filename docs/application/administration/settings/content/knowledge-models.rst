Knowledge Models Settings
*************************

.. _settings-km-public:

Public Knowledge Models
=======================

If we want to let users to see and browse certain Knowledge Models (specifically, visit the :ref:`KM detail<km-detail>` and the :ref:`KM preview<km-preview>`) even if not logged in, we can enable **Public Knowledge Models**. Then, we need to specify **Allowed Packages**, e.g. which ranges of versions of a certain knowledge model will be publicly available. A blank value serves as *any value*, for example, if we fill the **Organization ID** and **Knowledge Model ID** but leave **Min Version** and **Max Version**, it will result in all version of that knowledge model to be public.

Integration Config
==================

The integrations specified in Knowledge Models can use configuration values (typically secrets such as API keys or tokens) from YAML configuration specified in :ref:`integration.yml file<integration-yml-file>` or the content specified here under **Integration Config**. The value here can be for example:

.. CODE-BLOCK:: yaml

    dbase:
        apiKey: topSecretDBaseApiKey
        apiUrl: https://api.dbase.example:10666

.. NOTE::

    This configuration value is encrypted in the database.
