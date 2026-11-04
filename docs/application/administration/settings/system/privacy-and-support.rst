Support
*******

The Support settings define the contact links shown in :guilabel:`Report issue`. Configure them so users know where to report problems with the service.

Configure the contact links
===========================

#. Open :guilabel:`Settings` → :guilabel:`Support` with :guilabel:`Manage Settings`.
#. Enter the **Support Email** users should contact.
#. Set **Support Site Name** and **Support Site URL** for the support website or issue tracker.
#. Choose a **Support Site Icon** using a Font Awesome icon class, such as ``fas fa-life-ring``.
#. Save the changes. Open :guilabel:`Report issue` from the profile menu and check that both contact links lead to the intended destinations.

Unset values use the instance defaults shown as placeholders in the form. The support website opens in a new tab; the email link opens the user's email application.

.. figure:: /_static/screenshots/5.0/settings-support.png
    :figclass: guide-screenshot
    :alt: Support settings in DSW 5.0
    :width: 760

    Support settings.

For the user-facing procedure, see :doc:`/more/miscellaneous/help`.

Custom privacy-policy and terms links are configured by the deployment administrator using ``general.privacyUrl`` and ``general.termsOfServiceUrl``; see :doc:`/more/self-hosted-dsw/configuration/configuration`.
