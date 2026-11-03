.. _api-keys:

API keys
********

API keys allow scripts and integrations to use DSW with our account's permissions. We can create or revoke keys in :guilabel:`User Settings` → :guilabel:`API Keys`.
When creating a key, we enter a name and choose when it expires. We need to save the generated key securely. Integrations use it as a Bearer token.

A key does not bypass role permissions or project sharing.
Revoke a key when its integration is retired or its value may have been exposed.

Use :doc:`/more/development/api` for API addresses and authentication. For changes to existing integrations, see :doc:`/more/self-hosted-dsw/upgrade-guidelines`.

.. todo::

   Screenshot: Create an API key in DSW 5.0.

.. todo::

   Screenshot: API keys in DSW 5.0.
