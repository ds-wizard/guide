.. _openid-settings:

OpenID
******

OpenID Connect lets users sign in with an external identity provider. Configure providers in the :guilabel:`Settings` → :guilabel:`OpenID` with :guilabel:`Manage Settings`.

.. todo::

   Screenshot: OpenID providers in DSW 5.0.

Prepare the provider
====================

Register DSW as a client with the identity provider, or obtain an existing client registration from the identity administrator. We need its client identifier, client secret and the provider information described below.

Keep a working administrative sign-in method while configuring or changing a provider. Separate instances need their own registered callback and logout URLs.

Create the configuration
========================

#. Choose :guilabel:`Create` and enter a **Name** that users will recognize on the sign-in screen.
#. Select :guilabel:`Microsoft` or :guilabel:`Custom` and complete the fields below.
#. Review :guilabel:`Advanced configuration` and the sign-in button's appearance.
#. Click :guilabel:`Create`, then register the addresses shown in the saved configuration with the identity provider.

Microsoft
---------

Copy these values from the Microsoft application registration:

* **Application (client) ID**: the application's identifier.
* **Client Secret Value**: the secret value used by DSW to authenticate the client.
* **Directory (tenant) ID**: the UUID of the Microsoft directory.

DSW builds the Microsoft provider address from the directory ID. In the saved configuration, the callback is labeled :guilabel:`Redirect URI` and the logout address is :guilabel:`Front-channel logout URL`.

Custom provider
---------------

Enter the **Client ID**, **Client Secret** and the provider's OpenID Connect issuer **URL**. DSW uses that URL to discover the provider's OpenID configuration.

Use **Parameters** for additional name/value pairs required by the provider in the authorization request. Obtain the issuer URL and any required parameters from the identity administrator or the provider's OpenID Connect documentation.

In the saved configuration, the addresses are labeled :guilabel:`Callback URL` and :guilabel:`Logout URL`.

Registration and scopes
-----------------------

Under :guilabel:`Advanced configuration`:

* **Registration enabled** allows new users to register through this provider. Turn it off when the provider should only be used with existing accounts.
* **Email** requests the user's email information.
* **Profile** requests profile information such as the user's name.

DSW always requests the OpenID scope. If the provider does not supply the information needed to create an account, the user may be asked to complete registration.

Set the button's **Icon**, **Background Color** and **Text Color**. Use **Button Preview** to check its appearance and readability.

.. todo::

   Screenshot: Create OpenID configuration in DSW 5.0.

Register the callback and logout addresses
==========================================

Open the saved configuration and copy its callback or Redirect URI into the provider's allowed redirect URIs. Use the exact value shown by the instance:

.. code-block:: text

   https://<instance>/open-id/<provider-uuid>/callback

Copy the displayed logout address into the corresponding provider setting where required. The callback and logout addresses serve different purposes; each belongs in its corresponding field at the identity provider.

Test the connection
===================

#. Open the instance in a separate browser session and select the provider's sign-in button.
#. Complete authentication at the identity provider and return to DSW.
#. Check that the intended account is opened and that its profile details are correct. Test registration separately if it is enabled.
#. Test signing out and signing in again.

Existing users can link an identity through :doc:`/application/profile/settings/connected-accounts` while signed in to their DSW account.

If sign-in fails
================

Check the exact registered callback address, client identifier and secret, and whether the provider allows the test account to use the client. For a Custom provider, also check the issuer URL and required parameters.

If authentication succeeds but DSW refuses access, check registration settings and account status. Retry an expired sign-in attempt from the sign-in page. Use :doc:`/more/miscellaneous/help` when reporting the error.

Updating an existing provider
=============================

Open the provider's name in the list, update the fields and save. When changing a client secret, update the corresponding value in DSW and test the connection.

If the upgrade changes the deployed addresses, update the identity provider's callback and logout registrations to the addresses shown by the upgraded instance. See :doc:`/more/self-hosted-dsw/upgrade-guidelines` for the related migration steps.
