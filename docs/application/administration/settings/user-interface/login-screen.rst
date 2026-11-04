Login Screen
************

The Login Screen settings control information and announcements shown before people sign in.
Use :guilabel:`Login Info` for text next to the sign-in form and :guilabel:`Sidebar Login Info` for text underneath it. Both support Markdown. Announcements on this page are visible before sign-in, so include only information suitable for everyone visiting the instance.

Dashboard announcements and custom menu links are configured separately under :doc:`/application/administration/settings/user-interface/dashboard-and-login-screen`.

.. figure:: /_static/screenshots/5.0/settings-login-screen.png
    :figclass: guide-screenshot
    :alt: Login Screen settings in DSW 5.0
    :width: 760

    Login Screen settings.

.. figure:: /_static/screenshots/5.0/login-announcement.png
    :figclass: guide-screenshot
    :alt: Login screen announcement settings in DSW 5.0
    :width: 616

    Login screen announcement settings.

Login information
=================

Use **Login Info** to explain who the instance is for, how people should sign in, or which external identity provider they should choose. **Sidebar Login Info** adds a separate message beneath the sign-in form. Both fields support Markdown.

Login announcements
===================

Use :guilabel:`Add announcement`, choose **Info**, **Warning** or **Critical**, and enter the Markdown content. Announcements appear above the login screen's main content. To display the same message after sign-in, also add it in Dashboard & Menu.

.. figure:: /_static/screenshots/5.0/login-example.png
    :figclass: guide-screenshot
    :alt: DSW login screen showing the saved login information and announcement
    :width: 760

    Login screen with example information and announcement.
