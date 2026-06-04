Authentication
**************

The **Default Role** settings option allows us to define which role is assigned to new users (see :ref:`user roles<user-roles>` for details about permissions).


.. WARNING::
    
    It is recommended to set this to the lowest role possible, i.e. **Researchers**. Otherwise, new users will be able to change the content for all other users in the |project_name| instance.


Internal
========

For internal authentication, we can set:

- **Registration** - whether users can sign up on their own or not.
- **Non-Admin Login** - whether non-admin users can log in to the |project_name| instance or not.
- **Two-Factor Authentication** - whether users need to confirm their login with a one-time code sent to their email address or not.
- **Session Expiration** - how long the user session is valid before the user needs to log in again in hours.
- **User Email Link Expiration** - how long the email links (e.g., for password reset) are valid before they expire and cannot be used anymore in hours.

.. NOTE::

    In case we are using OpenID or creating user accounts manually, registrations should be disabled. It is recommended to also disable non-admin login.


For **Two-Factor Authentication** (2FA) we can also configure **Code Length** (how many character the code has) and **Expiration** period in seconds.
