.. _authentication:

Authentication
**************

Open :guilabel:`Settings` → :guilabel:`Authentication` with :guilabel:`Manage Settings`.

* **Registration enabled** allows users to register with an email address and password. External providers have their own registration setting.
* **Non-admin login enabled** controls whether users other than administrators can sign in.
* **Session expiration** controls the lifetime of sign-in sessions.
* **User email link expiration** controls the lifetime of emailed account links.
* **Two-Factor Authentication** requires an emailed one-time code after the password. Configure its code length and expiration when enabled.

Keep a working administrator sign-in method when changing authentication. External identity providers are configured under :doc:`openid`.


.. figure:: /_static/screenshots/5.0/settings-authentication.png
    :figclass: guide-screenshot
    :alt: Authentication settings in DSW 5.0
    :width: 760

    Authentication settings.

Expiration and default role
===========================

Session expiration and user email-link expiration are specified in hours. The emailed two-factor code has its own **Code Length** and **Expiration**, with the latter specified in seconds.

Choose the default role for new users under :guilabel:`Settings` → :guilabel:`Roles`. Give new users only the permissions they need: a broad default role can expose other users' content or application settings. A role selected as the default cannot be deleted.

Disable internal registration when accounts should be created by administrators or through configured external providers. External providers have separate registration controls; review both when deciding how new accounts may be created.
