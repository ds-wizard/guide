Integration via API
*******************

The API lets other systems read and update DSW data. Open :guilabel:`About` from the profile menu for the instance's :guilabel:`API URL` and :guilabel:`API Docs`. The API reference describes the available operations and request bodies.

Authentication and permissions
==============================

Create an API key in :doc:`/application/profile/settings/api-keys`. Send it in the ``Authorization: Bearer`` header. An API key acts with its user's permissions; project sharing also controls access.

The API base for 5.0 is normally ``https://<instance>/api``. Review existing integrations against the 5.0 API reference: a changed base URL alone does not update renamed endpoints or request fields.

Example
========

.. code-block:: python

   import os
   import requests

   response = requests.get(
       os.environ['DSW_API_URL'].rstrip('/') + '/users/current',
       headers={'Authorization': 'Bearer ' + os.environ['DSW_API_KEY']},
       timeout=30,
   )
   response.raise_for_status()
   print(response.json()['email'])

Keep API keys outside source control. Revoke keys that are no longer needed.

For upgrade changes affecting integrations, see :doc:`/more/self-hosted-dsw/upgrade-guidelines`.
