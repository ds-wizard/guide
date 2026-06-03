Authentication
**************

The **Default Role** settings option allows us to define which role is assigned to new users (see :ref:`user roles<user-roles>` for details about permissions).


.. WARNING::
    
    It is recommended to set this to the lowest role possible, i.e. **Researchers**. Otherwise, new users will be able to change the content for all other users in the |project_name| instance.


Internal
========

For internal authentication, we can set whether the **Registration** is enabled or not. If enabled, any user who can visit the |project_name| instance may sign up (and obtain the default role).

.. NOTE::

    In case we are using OpenID or creating user accounts manually, registrations should be disabled.


Another option is whether the **Two-Factor Authentication** (2FA) is enabled. If enabled, once users try to log in using credentials, they receive an email message with one-time code to confirm the login. Moreover, we can configure **Code Length** (how many character the code has) and **Expiration** period in seconds.

We can also set up **Session Expiration** and **User Email Link Expiration** in hours. The first one defines how long the user session is valid before the user needs to log in again. The second one defines how long the email links (e.g., for password reset) are valid before they expire and cannot be used anymore.
