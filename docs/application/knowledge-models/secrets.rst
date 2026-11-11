.. _knowledge-model-secrets:

Knowledge model secrets
***********************

Secrets store values such as API keys used by integrations, without including them in question text or saved answers.
Managing them requires :guilabel:`Manage Knowledge Models`.

Create or replace a secret
==========================

Open :guilabel:`Knowledge Models` → :guilabel:`Secrets`, choose a name and enter the value needed by the integration.
DSW does not return existing secret values to the browser. To change a secret, enter its replacement value and save. Leaving the value unchanged and replacing it with an empty value are different operations.

Refer to :doc:`/more/development/integration-questions/integration-api` when configuring how an integration uses a secret.

.. figure:: /_static/screenshots/5.0/km-secrets.png
    :figclass: guide-screenshot
    :alt: Knowledge Model secrets in DSW 5.0
    :width: 760

    Knowledge Model secrets.

Use a secret in an integration
==============================

We can also open the secrets list through :guilabel:`Configure secrets` in the integration editor. Give the secret a name, for example ``apiUrl``, enter its value and save it.

Back in the integration configuration, use the copy button next to a secret's name. It copies a Jinja reference such as ``{{ secrets.apiUrl }}`` for use in a request URL or headers. Variables have their own copy buttons and use ``{{ variables.name }}``. This keeps the stored value out of the knowledge model itself.
