.. _openid-settings:

OpenID
******

Using these settings we can add `OpenID <https://openid.net/>`__ configuration to allow logging into the DSW via external identity provider.

DSW supports Microsoft Azure, ORCID, as well as any other OpenID providers. Following are detailed description of the setups for these options.

.. NOTE::

    After setting a new OpenID service, we should directly test it and verify that the configuration works well. For that, we can simply open our DSW in a new anonymous window of the web browser.


Microsoft Azure Setup
=====================

1. Go to https://portal.azure.com/.
2. Go to ``App registrations``.
3. Click on ``New registration``.
4. Fill in a name.
5. Select ``Single tenant only - ...``.
6. Keep ``Redirect URI`` empty.
7. Click on ``Register``.
8. Copy and store ``Directory (tenant) ID`` and ``Application (client) ID``.
9. Click on ``Manage`` in the left menu → ``Certificates & Secrets``.
10. Click on ``New client secret``.
11. Fill description, set ``Expires`` and note it somewhere, then click on ``Add``.
12. Copy ``Value`` and store it somewhere. You will not able to view it again.

13. Go to OpenID in DSW: ``Admin Center`` → ``Settings`` → ``Organization OpenID`` → ``Create``.

14. Fill in a ``Name`` of the service. This name will be used to identify the service in the list of login options, so it should be something descriptive.

15. Open the ``Microsoft`` tab and fill in :
	- ``Application (client) ID``
	- ``Directory (tenant) ID``
	- ``Client Secret`` → ``<stored secret value>``

16. (optional) fill Icon (``fab fa-microsoft``, or some other from `Font Awesome <https://fontawesome.com/v6/search?o=r&m=free>`_), ``Background Color`` and ``Text Color``.

17. Click on ``Save``.

18. Go back to Microsoft Azure.
19. Click on ``Manage`` in the left menu → ``Authentication (Preview)``.
20. Click on ``Add Redirect URI``.
21. Click on ``Web``.
22. Copy ``Redirect URI`` and ``Front-channel logout URL`` from DSW.
23. **Do not** check any checkbox.
24. Click on ``Configure``.
25. Click on ``Manage`` in the left menu → ``API permissions``.
26. Click on ``Add a permission``.
27. Click on ``Microsoft Graph`` → ``Delegated permissions``.
28. Under ``OpenId permissions`` check ``email``, ``openid`` and ``profile``. Under ``User`` keep checked ``User.Read``.
29. Click on ``Add permissions``.

30. Click on ``Manage`` in the left menu → ``Token configuration``.
31. Click on ``Add optional claim``.
32. Select ``ID`` and check ``email``, ``family_name`` and ``given_name``.
33. Click on ``Add``.

34. Test your OpenID configuration in DSW (You might need to refresh the login page for the login button to appear).

.. .. figure:: openid/openid.png
..     :width: 700
    
..     Example configuration of OpenID Microsoft Azure service.


ORCID Setup
===========

ORCID requires a redirect URI before it allows us to save the application and obtain credentials. Because DSW generates the callback URL only after the OpenID configuration is saved, we first create the DSW configuration with temporary credentials and then return to ORCID.

1. Go to OpenID in DSW: ``Admin Center`` → ``Settings`` → ``Organization OpenID`` → ``Create``.
2. Fill in a ``Name`` of the service, for example ``ORCID``.
3. Open the ``Custom`` tab.
4. Fill in temporary values:
	- ``Client ID`` → ``placeholder``
	- ``Client Secret`` → ``placeholder``
	- ``URL`` → ``https://orcid.org``
5. Leave ``Parameters`` empty.
6. (optional) fill Icon (``fab fa-orcid``), ``Background Color`` (``#A6CE39``), and ``Text Color``.
7. Click on ``Save``.
8. Copy ``Callback URL`` from DSW. It will look similar to ``https://example.fair-wizard.com/admin/open-id/<uuid>/callback``.

9. Go to https://orcid.org/signin and sign in to ORCID.
10. Open ``Developer Tools`` from the account menu.
11. If this is the first application, register for ORCID Public API credentials.
12. Fill in the application details:
	- ``Name`` → name of the DSW instance or organization.
	- ``Application URL`` → public URL of the DSW instance.
	- ``Application Description`` → short description of the DSW instance.
	- ``Redirect URI`` → paste the ``Callback URL`` copied from DSW.
13. Save the application and generate credentials.
14. Copy ``Client ID`` and ``Client Secret``.

15. Go back to the ORCID OpenID configuration in DSW.
16. Replace temporary credentials:
	- ``Client ID`` → ORCID ``Client ID``
	- ``Client Secret`` → ORCID ``Client Secret``
	- ``URL`` → keep ``https://orcid.org``
17. Click on ``Save``.
18. Test your OpenID configuration in DSW (You might need to refresh the login page for the login button to appear).

.. NOTE::

    ORCID uses the term ``Redirect URI`` for the DSW ``Callback URL``. The DSW ``Logout URL`` does not need to be entered in ORCID Public API credentials.

.. NOTE::

    For ORCID sandbox testing, use https://sandbox.orcid.org/ for ORCID registration and use ``https://sandbox.orcid.org`` as the DSW ``URL``.


Custom Setup
============

1. Go to OpenID in DSW: ``Admin Center`` → ``Settings`` → ``Organization OpenID`` → ``Create``.
2. Fill in a ``Name`` of the service. This name will be used to identify the service in the list of login options, so it should be something descriptive.
3. Open the ``Custom`` tab.
4. Prepare the OpenID endpoint ``URL``. This is usually the issuer URL of the provider. If the provider gives us a URL ending with ``/.well-known/openid-configuration``, use only the part before this suffix.
5. Prepare the client application on the side of the OpenID provider:
	- If the provider allows creating the client without redirect URLs, create it and obtain ``Client ID`` and ``Client Secret``.
	- If the provider requires redirect URLs before it creates credentials, use temporary values in DSW first, for example ``placeholder`` for ``Client ID`` and ``Client Secret``. Fill in the real OpenID endpoint ``URL`` and click on ``Save``. Then copy the generated ``Callback URL`` from DSW and use it in the provider.
6. In the OpenID provider, configure redirect URLs:
	- Use DSW ``Callback URL`` as the provider redirect URI, callback URL, reply URL, or sign-in redirect URI.
	- If the provider supports logout URLs, use DSW ``Logout URL`` as the provider logout URL.
7. Configure the client in the OpenID provider:
	- Allow the ``authorization_code`` flow, if this is configurable.
	- Configure the client to have the following scopes or claims: ``openid``, ``profile``, ``email``.
	- Configure the client to provide the following details in ID tokens: ``email``, ``given_name``, ``family_name``.
8. Go back to DSW and fill in the real ``Client ID``, ``Client Secret``, and ``URL`` from the OpenID provider.
9. Leave ``Parameters`` empty unless the provider documentation requires an additional parameter.
10. (optional) fill Icon (some from `Font Awesome <https://fontawesome.com/v6/search?o=r&m=free>`_), ``Background Color`` and ``Text Color``.
11. Click on ``Save``.
12. Test your OpenID configuration in DSW (You might need to refresh the login page for the login button to appear).


Advanced Configuration
======================

In the ``Advanced`` dropdown of the OpenID configuration, we can set up additional options.

- **Registration enabled** - if enabled, users will be able to register a new DSW account using this OpenID service. If disabled, only existing DSW OpenID accounts can log in.
- **Scopes** - scopes requested from the OpenID provider.
	- **Email** - some services (such as ORCID) do not provide an email address. By disabling this option, we can enable email completion upon the user's first login. This means that if the OpenID provider does not return an email address, the user will be prompted to enter it manually after the first login. DSW requires an email address to send password reset instructions and other notifications, so it is required for the user account.
	- **Profile** - if the provider does not return profile information, the user will be prompted to enter their first and last name manually after the first login.
