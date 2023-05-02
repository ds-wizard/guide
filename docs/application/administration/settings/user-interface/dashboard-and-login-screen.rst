Dashboard & Login Screen Settings
*********************************

The dashboard settings allows us to adjust what users will see after they log in, i.e. on the application initial page called the dashboard. 

Dashboard Style
===============

We can select the **Dashboard Style** whether the user should see a standard **welcome** screen which just greets the user in the application, or a **role-based** dashboard which contains widgets based on current user's role (see :ref:`user-roles`):

* **Researcher**

  * **Recent Projects Widget** contains a list of recent projects of the user for a quick navigation.

  * **Create Project Widget** lets the user quickly start a new project.

* **Data Steward**

  * **Create KM / Project Template Widgets** let the user to quickly start a new knowledge model editor or project template.

  * **Outdated KM / Document Templates Widgets** allow to quickly see outdated packages and document templates in case the DSW Registry connection is configured.

  * **Import KM / Document Template Widgets** allow to proceed easily to import of a knowledge model or a document template in case the DSW Registry connection is configured.

* **Administrator**

  * **Outdated KM / Document Templates Widgets** allow to quickly see outdated packages and document templates in case the DSW Registry connection is configured.

  * **Usage Widget** summarises the usage just as is also possible to see in the :doc:`../info/usage`.

  * **Configure Organization Widget** quickly navigates to :doc:`../system/organization` if it is not yet done.

  * **Configure Look and Feel Widget** quickly navigates to :doc:`../user-interface/look-and-feel` to adjust style of the DSW instance.

  * **Connect DSW Registry Widget** quickly navigates to :doc:`../content/dsw-registry` to configure the connection (if not yet been done).

  * **Add OpenID Widget** quickly navigates to :doc:`../system/authentication` to configure the identity provider services (if not yet been done).


.. _login-info:

Login Info
==========

It is possible to write a message that users will see before logging in the DSW instance, using HTML or Markdown. The Login info is placed in the center of the login screen. We can use it to explain users in what cases they can/should use our DSW instance, how they should log in (e.g. if we have more :ref:`authentication services<auth-services>` configured), or if there is any news regarding our DSW instance.

.. _sidebar-login-info:

Sidebar Login Info
==================

It is also possible to write another message that users will see on the login screen. The Sidebar Login info is placed underneath the login form. We can also use HTML or Markdown as in the Login Info.


.. _announcements:

Announcements
=============

Another option to adjust the dashboard and/or the login screen is to add Announcements. Announcements are displayed above the main content in the login screen. In dashboard, they are also displayed above the main content for both **welcome** and **role-based** dashboard style. There are three levels of Announcements:

* **Info** - light blue color for sending informations to the users.
* **Warning** - yellow to warn the users about something.
* **Critical** - red to signalize the Announcement is critical and it needs attention.

The content of the Announcement can be edited using Markdown. There are also two additional switches which determine, where the Announcement is displayed. The Announcement can be set up to be displayed either on the dashboard after users log in or on the login screen before the users log in. It is also possible to display the same Announcement in both places. Number of Announcements is not limited.
