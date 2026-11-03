.. _knowledge-model-secrets:

Knowledge model secrets
***********************

Secrets store values such as API keys used by integrations, without including them in question text or saved answers.
Managing them requires :guilabel:`Manage Knowledge Models`.

Create or replace a secret
==========================

Open :guilabel:`Knowledge Models` → :guilabel:`Secrets`, choose a name and enter the value needed by the integration.
DSW does not return existing secret values to the browser. To change a value, supply a replacement; leaving a value unchanged is different from replacing it with an empty value.

Refer to :doc:`/more/development/integration-questions/integration-api` when configuring how an integration uses a secret.

.. todo::

   Screenshot: Knowledge Model secrets in DSW 5.0.
