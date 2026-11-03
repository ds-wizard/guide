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


.. todo::

   Screenshot: Authentication settings and two-factor options.
