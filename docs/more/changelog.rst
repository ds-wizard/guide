Changelog
*********

..
    This is a workaround to random anchor links generation by Sphinx
    https://github.com/sphinx-doc/sphinx/issues/1961#issuecomment-1322281847

.. _frontend-backend:
.. _backend:
.. _tools:


.. _v3.24.1-backend:

3.24.1 (backend)
================

* *Release: 14 June 2023*

* **Bugfixes**
  
  * Fixed generating documents that contain more than one whitespace in the filename.

* **More:**

  * `API Changelog 3.24.0 ➔ 3.24.1 <https://api-docs.ds-wizard.org/changelogs/3.24.0-3.24.1.html>`__ 


.. _v3.24:

3.24
====

* *Release: 30 May 2023*

* **Features:**

  * List views (such as project list or knowledge model list) have been reworked so that only the results are reloaded instead of the whole page. Therefore, the search field should not loose focus when typing slowly.
  * Added warning before the user session expires.
  * Improved information on detail pages (such as knowledge model or document template).

* **Bugfixes:**
  
  * Fixed document generation when there were inconsistent replies after questionnaire migration.
  * Fixed icon alignment in questionnaire import.
  * Fixed color transition for menu icons.

* **Misc:**

  * All document templates from DSW Registry now use WeasyPrint instead of wkhtmltopdf for PDF formats.
  * It is recommended to migrate your existing PDF template to `WeasyPrint <https://github.com/ds-wizard/engine-tools/blob/develop/packages/dsw-document-worker/support/steps/weasyprint.md>`__ as wkhtmltopdf will be removed in the future.

* **More:**

  * `API Changelog 3.23.0 ➔ 3.24.0 <https://api-docs.ds-wizard.org/changelogs/3.23.0-3.24.0.html>`__


.. _v3.23.3-backend:

3.23.3 (backend)
================

* *Release: 14 June 2023*

* **Bugfixes**
  
  * Fixed generating documents that contain more than one whitespace in the filename.

* **More:**

  * `API Changelog 3.23.2 ➔ 3.23.3 <https://api-docs.ds-wizard.org/changelogs/3.23.2-3.23.3.html>`__ 


.. _v3.23.2-backend:

3.23.2 (backend)
================

* *Release: 25 May 2023*

* **Bugfixes:**

  * Fixed API key expiration to use the value set when creating it.

* **More:**

  * `API Changelog 3.23.1 ➔ 3.23.2 <https://api-docs.ds-wizard.org/changelogs/3.23.1-3.23.2.html>`__ 



.. _v3.23.1-backend:

3.23.1 (backend)
================

* *Release: 4 May 2023*

* **Bugfixes:**

  * Fixed loading RSA private key if set only in the ENV variable.

* **More:**

  * `API Changelog 3.23.0 ➔ 3.23.1 <https://api-docs.ds-wizard.org/changelogs/3.23.0-3.23.1.html>`__ 



.. _v3.23:

3.23
====

* *Release: 2 May 2023*

* **Features:**
  
  * Added the possibility to generate :ref:`API keys<api-keys>` to access the API instead of using username and password. The API keys also work when 2FA is enabled.
  * Added an overview of all :ref:`active sessions<active-sessions>`.
  * It is now possible to use HTML for :ref:`login info<login-info>`.
  * Added possibility for :ref:`sidebar login info<sidebar-login-info>` under the login box.
  * Welcome warning and info have been reworked to :ref:`announcements<announcements>` -- it is now possible to have an unlimited list of announcements of different levels and choose if they are visible on the dashboard and/or login screen.
  * Added sort by created to document template list.
  * Improved progress bar in project migration.
  * The warnings tab in the knowledge model editor is now automatically closed when the last one is resolved.
  * Improved form actions to make them more visible when forms change.
  
* **Bugfixes:**

  * Fixed project indication calculation after import or project migration.
  * Fixed double error message when deleting failed in list views.
  * Fixed buttons in email templates in Outlook.
  * Fixed phase in a questionnaire after project migration if the phase no longer exists.
  * Fixed dropdown menus in the sidebar when the page was scrolled.
  * Fixed knowledge model export from the knowledge model list.

* **Misc:**

  * Changed the path of configuration files (:ref:`see upgrade guidelines<upgrade-3-22-x-3-23-x>`).
  * Sped up processing and generating of documents.

* **More:**
  
  * `API Changelog 3.22.0 ➔ 3.23.0 <https://api-docs.ds-wizard.org/changelogs/3.22.0-3.23.0.html>`__ 



.. _v3.22.1-tools:

3.22.1 (tools)
==============

* *Release: 14 April 2023*

* **Bugfixes:**

  * Fixed sending mails when configuration is loaded from database.

* **More:**

  * `Jira issues 3.22.1-tools <https://ds-wizard.atlassian.net/browse/DSW-1900?jql=project%20%3D%20DSW%20AND%20fixVersion%20%3D%203.22.1-tools%20ORDER%20BY%20priority%20DESC>`__



.. _v3.22.3-backend:

3.22.3 (backend)
================

* *Release: 13 April 2023*

* **Bugfixes:**

  * Fixed the selected phase in projects when migrating from a knowledge model without phases to a knowledge model with phases.

* **More:**

  * `Jira issues 3.22.3-backend <https://ds-wizard.atlassian.net/browse/DSW-1893?jql=project%20%3D%20DSW%20AND%20fixVersion%20%3D%203.22.3-backend%20ORDER%20BY%20priority%20DESC>`__
  * `API Changelog 3.22.2 ➔ 3.22.3 <https://api-docs.ds-wizard.org/changelogs/3.22.2-3.22.3.html>`__ 



.. _v3.22.2-backend:

3.22.2 (backend)
================

* *Release: 12 April 2023*

* **Bugfixes:**

  * Fixed an issue that sometimes caused suggesting the same knowledge model multiple times when creating a new project or knowledge model editor.

* **More:**

  * `Jira issues 3.22.2-backend <https://ds-wizard.atlassian.net/browse/DSW-1887?jql=project%20%3D%20DSW%20AND%20fixVersion%20%3D%203.22.2-backend%20ORDER%20BY%20priority%20DESC>`__
  * `API Changelog 3.22.1 ➔ 3.22.2 <https://api-docs.ds-wizard.org/changelogs/3.22.1-3.22.2.html>`__ 



.. _v3.22.1:

3.22.1 (frontend, backend)
==========================

* *Release: 11 April 2023*

* **Bugfixes:**

  * Fixed database migration of existing KM editors after 3.22 that could cause unexpected KM editor version or missing metadata (such as readme).
  * Fixed publish process in KM editor and Document Template Editor that could be confusing after 3.22 changes.
  * Fixed deleting KM editor when it is migrating.

* **More:**

  * `Jira issues 3.22.1-frontend <https://ds-wizard.atlassian.net/browse/DSW-1883?jql=project%20%3D%20DSW%20AND%20fixVersion%20%3D%203.22.1-frontend%20ORDER%20BY%20priority%20DESC>`__
  * `Jira issues 3.22.1-backend <https://ds-wizard.atlassian.net/browse/DSW-1883?jql=project%20%3D%20DSW%20AND%20fixVersion%20%3D%203.22.1-backend%20ORDER%20BY%20priority%20DESC>`__
  * `API Changelog 3.22.0 ➔ 3.22.1 <https://api-docs.ds-wizard.org/changelogs/3.22.0-3.22.1.html>`__ 



.. _v3.22:

3.22.0
======

* *Release: 4 April 2023*

* **Features:**

  * Added the possibility to set a knowledge model as deprecated so researchers cannot use it to create new projects.
  * Added :ref:`phase editor<km-editor-phases>` to KM Editor (similar to Tag editor).
  * Renamed :guilabel:`Template` tab to :guilabel:`Settings` in the document template editor to make it consistent with KM Editor or Project.
  * Added link to selected project in document template editor preview.
  * Position in the questionnaire is now remembered when switching tabs in the project (such as going to preview and back to the questionnaire).
  * Warnings tab in the project is now automatically closed when the last one is resolved.
  * Projects are no longer filtered by current user if the user is admin.
  * Improved accessibility of unanswered question indications and metrics (as well as adding an option to hide non-desirable questions).
  * Added information about a version of all components in the About modal.
  * Improved add button labels in various forms to make it easier to understand what they add.
  * Added support for DKIM signing for emails.
  * Added experimental `weasyprint step <https://github.com/ds-wizard/engine-tools/blob/develop/packages/dsw-document-worker/support/steps/weasyprint.md>`__ in document templates for better PDF documents generation. 
  * User details are now updated in the menu after editing your own profile.
  * Added link to the DSW Registry from locale detail.

* **Bugfixes:**

  * Fixed visible first chapter in KM Editor preview when deleted.
  * Fixed inconsistent update label for badge and action for KM migration.
  * Fixed failing to publish knowledge models due to wrong event squashing in some cases.
  * Fixed redirect to login when opening the project after the session has expired.
  * Fixed a visual bug in the project selection dropdown in the document template editor preview.
  * Fixed text overflow for long questions/answers in the project import view.
  * Fixed image previews in the document template editor.
  * Fixed downloading document template with DSW TDK.
  * Fixed dropdown menu separators in list views.

* **Misc:**

  * Added support for RO-Crates (`RO-Crate Importer <https://github.com/ds-wizard/dsw-ro-crate-importer>`__ and `RO-Crate Template <https://github.com/ds-wizard/ro-crate-template>`__)
  * Improved default English locale metadata.
  * Added support for arm64 builds for most of the Docker images.

* **More:**

  * `Jira issues 3.22.0 <https://ds-wizard.atlassian.net/browse/DSW-1730?jql=project%20%3D%20DSW%20AND%20fixVersion%20%3D%203.22.0%20ORDER%20BY%20priority%20DESC>`__
  * `API Changelog 3.21.0 ➔ 3.22.0 <https://api-docs.ds-wizard.org/changelogs/3.21.0-3.22.0.html>`__ 

3.21
====

* Release: 7 March 2023
* `Jira issues 3.21.0 <https://ds-wizard.atlassian.net/browse/DSW-1682?jql=project%20%3D%20DSW%20AND%20fixVersion%20%3D%203.21.0%20ORDER%20BY%20priority%20DESC>`__
* Key changes:
    * Two-factor authentication (2FA)
    * i18n support in document templates
    * RO-Crate import/export
    * Warnings on imports
    * Various optimizations and UI fixes



3.20
====

* Release: 7 February 2023
* `Jira issues 3.20.0 <https://ds-wizard.atlassian.net/browse/DSW-1658?jql=project%20%3D%20DSW%20AND%20fixVersion%20%3D%203.20.0%20ORDER%20BY%20priority%20DESC>`__
* Key changes:
    * Document template editor (`idea <https://ideas.ds-wizard.org/posts/10/document-template-editor>`__)
    * Mark document template as legacy
    * Various UI improvements and fixes
* Hotfixes:
    * 3.20.1 (frontend), 8 February 2023, `Jira <https://ds-wizard.atlassian.net/browse/DSW-1690?jql=project%20%3D%20DSW%20AND%20fixVersion%20%3D%203.20.1-frontend%20ORDER%20BY%20priority%20DESC>`__
    * 3.20.1 (tools), 9 February 2023, `Jira <https://ds-wizard.atlassian.net/browse/DSW-1706?jql=project%20%3D%20DSW%20AND%20fixVersion%20%3D%203.20.1-tools%20ORDER%20BY%20priority%20DESC>`__
    * 3.20.2 (frontend), 10 February 2023, `Jira <https://ds-wizard.atlassian.net/browse/DSW-1714?jql=project%20%3D%20DSW%20AND%20fixVersion%20%3D%203.20.2-frontend%20ORDER%20BY%20priority%20DESC>`__
    * 3.20.2 (tools), 10 February 2023, `Jira <https://ds-wizard.atlassian.net/browse/DSW-1711?jql=project%20%3D%20DSW%20AND%20fixVersion%20%3D%203.20.2-tools%20ORDER%20BY%20priority%20DESC>`__


3.19
====

* Release: 3 January 2023
* `Jira issues 3.19.0 <https://ds-wizard.atlassian.net/browse/DSW-1580?jql=project%20%3D%20DSW%20AND%20fixVersion%20%3D%203.19.0%20ORDER%20BY%20priority%20DESC>`__
* Key changes:
    * Indications computation
    * Minor UI improvements and fixes
* Hotfixes:
    * 3.19.1 (backend), 3 January 2023, `Jira <https://ds-wizard.atlassian.net/browse/DSW-1632?jql=project%20%3D%20DSW%20AND%20fixVersion%20%3D%203.19.1-backend%20ORDER%20BY%20priority%20DESC>`__
    * 3.19.1 (frontend), 6 January 2023, `Jira <https://ds-wizard.atlassian.net/browse/DSW-1642?jql=project%20%3D%20DSW%20AND%20fixVersion%20%3D%203.19.1-frontend%20ORDER%20BY%20priority%20DESC>`__
    * 3.19.2 (backend), 12 January 2023, `Jira <https://ds-wizard.atlassian.net/browse/DSW-1645?jql=project%20%3D%20DSW%20AND%20fixVersion%20%3D%203.19.2-backend%20ORDER%20BY%20priority%20DESC>`__
    * 3.19.1 (tools), 15 January 2023, `Jira <https://ds-wizard.atlassian.net/browse/DSW-1655?jql=project%20%3D%20DSW%20AND%20fixVersion%20%3D%203.19.1-tools%20ORDER%20BY%20priority%20DESC>`__
    * 3.19.2 (tools), 17 January 2023, `Jira <https://ds-wizard.atlassian.net/browse/DSW-1660?jql=project%20%3D%20DSW%20AND%20fixVersion%20%3D%203.19.2-tools%20ORDER%20BY%20priority%20DESC>`__
    * 3.19.3 (backend), 17 January 2023, `Jira <https://ds-wizard.atlassian.net/browse/DSW-1664?jql=project%20%3D%20DSW%20AND%20fixVersion%20%3D%203.19.3-backend%20ORDER%20BY%20priority%20DESC>`__


3.18
====

* Release: 29 November 2022
* `Jira issues 3.18.0 <https://ds-wizard.atlassian.net/browse/DSW-1560?jql=project%20%3D%20DSW%20AND%20fixVersion%20%3D%203.18.0%20ORDER%20BY%20priority%20DESC>`__
* Key changes:
    * Localizations (`idea <https://ideas.ds-wizard.org/posts/23/translate-into-other-languages>`__)
    * Filter file extensions when importing KM or template
    * Logout user when 401 received from API on dashboard
* Hotfixes:
    * 3.18.1 (frontend), 1 December 2022, `Jira <https://ds-wizard.atlassian.net/browse/DSW-1585?jql=project%20%3D%20DSW%20AND%20fixVersion%20%3D%203.18.1-fronted%20ORDER%20BY%20priority%20DESC>`__
    * 3.18.1 (backend), 1 December 2022, `Jira <https://ds-wizard.atlassian.net/browse/DSW-1587?jql=project%20%3D%20DSW%20AND%20fixVersion%20%3D%203.18.1-backend%20ORDER%20BY%20priority%20DESC>`__
    * 3.18.2 (frontend), 1 December 2022, `Jira <https://ds-wizard.atlassian.net/browse/DSW-1591?jql=project%20%3D%20DSW%20AND%20fixVersion%20%3D%203.18.2-frontend%20ORDER%20BY%20priority%20DESC>`__
    * 3.18.2 (backend), 1 December 2022, `Jira <https://ds-wizard.atlassian.net/browse/DSW-1591?jql=project%20%3D%20DSW%20AND%20fixVersion%20%3D%203.18.2-backend%20ORDER%20BY%20priority%20DESC>`__
    * 3.18.3 (backend), 2 December 2022, `Jira <https://ds-wizard.atlassian.net/browse/DSW-1606?jql=project%20%3D%20DSW%20AND%20fixVersion%20%3D%203.18.3-backend%20ORDER%20BY%20priority%20DESC>`__
    * 3.18.3 (frontend), 15 December 2022, `Jira <https://ds-wizard.atlassian.net/browse/DSW-1597?jql=project%20%3D%20DSW%20AND%20fixVersion%20%3D%203.18.3-frontend%20ORDER%20BY%20priority%20DESC>`__
    * 3.18.4 (backend), 16 December 2022, `Jira <https://ds-wizard.atlassian.net/browse/DSW-1608?jql=project%20%3D%20DSW%20AND%20fixVersion%20%3D%203.18.4-backend%20ORDER%20BY%20priority%20DESC>`__


3.17
====

* Release: 1 November 2022
* `Jira issues 3.17.0 <https://ds-wizard.atlassian.net/browse/DSW-1463?jql=project%20%3D%20DSW%20AND%20fixVersion%20%3D%203.16.0%20ORDER%20BY%20priority%20DESC>`__
* Key changes:
    * Consistency checks before publishing KM (`idea <https://ideas.ds-wizard.org/posts/77/check-some-consistency-before-publishing-new-km>`__)
    * Filter projects by KM (`idea <https://ideas.ds-wizard.org/posts/87/filter-projects-by-km>`__)
    * Support for ZIP/TAR archives and Excel exports
    * Use of gettext for client localizations
    * Support for OpenID logout functionality
* Hotfixes:
    * 3.17.1 (frontend), 14 November 2022, `Jira <https://ds-wizard.atlassian.net/browse/DSW-1573?jql=project%20%3D%20DSW%20AND%20fixVersion%20%3D%203.17.1-frontend%20ORDER%20BY%20priority%20DESC>`__


3.16
====

* Release: 4 October 2022
* `Jira issues 3.16.0 <https://ds-wizard.atlassian.net/browse/DSW-1434?jql=project%20%3D%20DSW%20AND%20fixVersion%20%3D%203.15.0%20ORDER%20BY%20priority%20DESC>`__
* Key changes:
    * Import for replies from other questionnaires (`idea <https://ideas.ds-wizard.org/posts/5/import-answers-to-questionnaires>`__)
    * Collapsible and movable items in list questions
    * Main menu grouping
    * Speed optimizations and refactoring
* Hotfixes:
    * 3.16.1 (backend), 27 October 2022, `Jira <https://ds-wizard.atlassian.net/browse/DSW-1522?jql=project%20%3D%20DSW%20AND%20fixVersion%20%3D%203.16.1-backend%20ORDER%20BY%20priority%20DESC>`__
    * 3.16.2 (backend), 12 October 2022, `Jira <https://ds-wizard.atlassian.net/browse/DSW-1530?jql=project%20%3D%20DSW%20AND%20fixVersion%20%3D%203.16.2-backend%20ORDER%20BY%20priority%20DESC>`__
    * 3.16.3 (backend), 6 October 2022, `Jira <https://ds-wizard.atlassian.net/browse/DSW-1548?jql=project%20%3D%20DSW%20AND%20fixVersion%20%3D%203.16.3-backend%20ORDER%20BY%20priority%20DESC>`__

3.15
====

* Release: 5 September 2022
* `Jira issues 3.15.0 <https://ds-wizard.atlassian.net/browse/DSW-1434?jql=project%20%3D%20DSW%20AND%20fixVersion%20%3D%203.15.0%20ORDER%20BY%20priority%20DESC>`__
* Key changes:
    * Project loading optimization
    * Python components refactoring
    * Several other fixes and refactoring
* Hotfixes:
    * 3.15.1 (tools), 7 September 2022, `Jira <https://ds-wizard.atlassian.net/browse/DSW-1479?jql=project%20%3D%20DSW%20AND%20fixVersion%20%3D%203.15.1-tools%20ORDER%20BY%20priority%20DESC>`__
    * 3.15.1 (frontend), 7 September 2022, `Jira <https://ds-wizard.atlassian.net/browse/DSW-1481?jql=project%20%3D%20DSW%20AND%20fixVersion%20%3D%203.15.1-frontend%20ORDER%20BY%20priority%20DESC>`__
    * 3.15.2 (tools), 7 September 2022, `Jira <https://ds-wizard.atlassian.net/browse/DSW-1484?jql=project%20%3D%20DSW%20AND%20fixVersion%20%3D%203.15.2-tools%20ORDER%20BY%20priority%20DESC>`__
    * 3.15.2 (frontend), 14 September 2022, `Jira <https://ds-wizard.atlassian.net/browse/DSW-1495?jql=project%20%3D%20DSW%20AND%20fixVersion%20%3D%203.15.2-frontend%20ORDER%20BY%20priority%20DESC>`__
    * 3.15.1 (backend), 14 September 2022, `Jira <https://ds-wizard.atlassian.net/browse/DSW-1495?jql=project%20%3D%20DSW%20AND%20fixVersion%20%3D%203.15.1-backend%20ORDER%20BY%20priority%20DESC>`__
    * 3.15.3 (tools), 17 September 2022, `Jira <https://ds-wizard.atlassian.net/browse/DSW-1499?jql=project%20%3D%20DSW%20AND%20fixVersion%20%3D%203.15.3-tools%20ORDER%20BY%20priority%20DESC>`__


3.14
====

* Release: 2 August 2022
* `Jira issues 3.14.0 <https://ds-wizard.atlassian.net/browse/DSW-1406?jql=project%20%3D%20DSW%20AND%20fixVersion%20%3D%203.14.0%20ORDER%20BY%20priority%20DESC>`__
* Key changes:
    * Migrate to Bootstrap 5
    * Improve authentication for downloads
    * Python components refactoring
* Hotfixes:
    * 3.14.1 (backend), 4 August 2022, `Jira <https://ds-wizard.atlassian.net/browse/DSW-1442?jql=project%20%3D%20DSW%20AND%20fixVersion%20%3D%203.14.1-backend%20ORDER%20BY%20priority%20DESC>`__
    * 3.14.1 (tools), 4 August 2022, `Jira <https://ds-wizard.atlassian.net/browse/DSW-1442?jql=project%20%3D%20DSW%20AND%20fixVersion%20%3D%203.14.1-backend%20ORDER%20BY%20priority%20DESC>`__


3.13
====

* Release: 28 June 2022
* `Jira issues 3.13.0 <https://ds-wizard.atlassian.net/browse/DSW-1387?jql=project%20%3D%20DSW%20AND%20fixVersion%20%3D%203.13.0%20ORDER%20BY%20priority%20DESC>`__
* Key changes:
    * Prevent user leave unsaved changes
    * Improved exceptions monitoring


3.12
====

* Release: 31 May 2022
* `Jira issues 3.12.0 <https://ds-wizard.atlassian.net/browse/DSW-555?jql=project%20%3D%20DSW%20AND%20fixVersion%20%3D%203.12.0%20ORDER%20BY%20priority%20DESC>`__
* Key changes:
    * New types of value questions
    * KM events optimizations
    * Several bugfixes and UI/UX improvements
* Hotfixes:
    * 3.12.1 (backend), 5 June 2022, `Jira <https://ds-wizard.atlassian.net/browse/DSW-1391?jql=project%20%3D%20DSW%20AND%20fixVersion%20%3D%203.12.1-backend%20ORDER%20BY%20priority%20DESC>`__
    * 3.12.1 (document-worker), 13 June 2022, `Jira <https://ds-wizard.atlassian.net/browse/DSW-1393?jql=project%20%3D%20DSW%20AND%20fixVersion%20%3D%203.12.1-docworker%20ORDER%20BY%20priority%20DESC>`__


3.11
====

* Release: 3 May 2022
* `Jira issues 3.11.0 <https://ds-wizard.atlassian.net/browse/DSW-1332?jql=project%20%3D%20DSW%20AND%20fixVersion%20%3D%203.11.0%20ORDER%20BY%20priority%20DESC>`__
* Key changes:
    * Apply all action for KM migrations
    * Improved efficiency of document worker
    * Auto-upgrade default document templates in project
    * Several bugfixes and UI improvements

3.10
====

* Release: 5 April 2022
* `Jira issues 3.10.0 <https://ds-wizard.atlassian.net/browse/DSW-1264?jql=project%20%3D%20DSW%20AND%20fixVersion%20%3D%203.10.0%20ORDER%20BY%20priority%20DESC>`__
* Key changes:
    * Mailer
    * Integration widget
    * Opening Markdown links in new tab/window
    * Several bugfixes and UI improvements
* Hotfixes:
    * 3.10.1 (frontend), 6 April 2022, `Jira <https://ds-wizard.atlassian.net/browse/DSW-1340?jql=project%20%3D%20DSW%20AND%20fixVersion%20%3D%203.10.1-frontend%20ORDER%20BY%20priority%20DESC>`__
    * 3.10.2 (frontend), 17 April 2022, `Jira <https://ds-wizard.atlassian.net/browse/DSW-1354?jql=project%20%3D%20DSW%20AND%20fixVersion%20%3D%203.10.2-frontend%20ORDER%20BY%20priority%20DESC>`__
    * 3.10.1 (backend), 17 April 2022, `Jira <https://ds-wizard.atlassian.net/browse/DSW-1354?jql=project%20%3D%20DSW%20AND%20fixVersion%20%3D%203.10.1-backend%20ORDER%20BY%20priority%20DESC>`__

3.9
===

* Release: 1 March 2022
* `Jira issues 3.9.0 <https://ds-wizard.atlassian.net/browse/DSW-1264?jql=project%20%3D%20DSW%20AND%20fixVersion%20%3D%203.9.0%20ORDER%20BY%20priority%20DESC>`__
* Key changes:
    * Basic password requirements
    * KM Editor: list of questions used with integration
    * Improved project migration
    * Usage statistics for administrators
    * Several bugfixes and UI improvements
* Hotfixes:
    * 3.9.1 (wizard-server), 8 March 2022, `Jira <https://ds-wizard.atlassian.net/browse/DSW-1327?jql=project%20%3D%20DSW%20AND%20fixVersion%20%3D%203.9.1-backend%20ORDER%20BY%20priority%20DESC>`__

3.8
===

* Release: 1 February 2022
* `Jira issues 3.8.0 <https://ds-wizard.atlassian.net/browse/DSW-1260?jql=project%20%3D%20DSW%20AND%20fixVersion%20%3D%203.8.0%20ORDER%20BY%20priority%20DESC>`__
* Key changes:
    * Online collaboration in KM Editor
* Hotfixes:
    * 3.8.1 (wizard-client), 1 February 2022, `Jira <https://ds-wizard.atlassian.net/browse/DSW-1290?jql=project%20%3D%20DSW%20AND%20fixVersion%20%3D%203.8.1-frontend%20ORDER%20BY%20priority%20DESC>`__
    * 3.8.1 (registry-server), 2 February 2022, `Jira <https://ds-wizard.atlassian.net/browse/DSW-1308?jql=project%20%3D%20DSW%20AND%20fixVersion%20%3D%203.8.1-backend%20ORDER%20BY%20priority%20DESC>`__
    * 3.8.2 (wizard-server), 14 February 2022, `Jira <https://ds-wizard.atlassian.net/browse/DSW-1276?jql=project%20%3D%20DSW%20AND%20fixVersion%20%3D%203.8.2-backend%20ORDER%20BY%20priority%20DESC>`__

3.7
===

* Release: 4 January 2022
* `Jira issues 3.7.0 <https://ds-wizard.atlassian.net/browse/DSW-1241?jql=project%20%3D%20DSW%20AND%20fixVersion%20%3D%203.7.0%20ORDER%20BY%20priority%20DESC>`__
* Key changes:
    * Projects tagging and filtering

3.6
===

* Release: 7 December 2021
* `Jira issues 3.6.0 <https://ds-wizard.atlassian.net/browse/DSW-1224?jql=project%20%3D%20DSW%20AND%20fixVersion%20%3D%203.6.0%20ORDER%20BY%20priority%20DESC>`__
* Key changes:
    * Enhancing integration question options (item template)
* Hotfixes:
    * 3.6.1 (document-worker), 9 December 2021, `Jira <https://ds-wizard.atlassian.net/browse/DSW-1247?jql=project%20%3D%20DSW%20AND%20fixVersion%20%3D%203.6.1%20ORDER%20BY%20priority%20DESC>`__

3.5
===

* Release: 2 November 2021
* `Jira issues 3.5.0 <https://ds-wizard.atlassian.net/browse/DSW-1201?jql=project%20%3D%20DSW%20AND%20fixVersion%20%3D%203.5.0%20ORDER%20BY%20priority%20DESC>`__
* Key changes:
    * Additional metadata for KM entities
    * Improved document submissions
    * Admin operations

3.4
===

* Release: 5 October 2021
* `Jira issues 3.4.0 <https://ds-wizard.atlassian.net/browse/DSW-1174?jql=project%20%3D%20DSW%20AND%20fixVersion%20%3D%203.4.0%20ORDER%20BY%20priority%20DESC>`__
* Key changes:
    * Comments in projects
    * New Jinja filters for document context handling

3.3
===

* Release: 8 September 2021
* `Jira issues 3.3.0 <https://ds-wizard.atlassian.net/browse/DSW-1105?jql=project%20%3D%20DSW%20AND%20fixVersion%20%3D%203.3.0%20ORDER%20BY%20priority%20DESC>`__
* Key changes:
    * Improved default document template
    * Improved template development experience
    * Enhanced Search API
    * Several fixes

3.2
===

* Release: 3 August 2021
* `Jira issues 3.2.0 <https://ds-wizard.atlassian.net/browse/DSW-402?jql=project%20%3D%20DSW%20AND%20fixVersion%20%3D%203.2.0%20ORDER%20BY%20priority%20DESC>`__
* Key changes:
    * Custom metrics (in KM)
    * Custom phases (in KM)
    * Several optimizations
* Hotfixes:
    * 3.2.1 (registry-server), 6 August 2021, `Jira <https://ds-wizard.atlassian.net/browse/DSW-1151?jql=project%20%3D%20DSW%20AND%20fixVersion%20%3D%203.2.1%20ORDER%20BY%20priority%20DESC>`__
    * 3.2.2 (wizard-server), 20 August 2021, `Jira <https://ds-wizard.atlassian.net/browse/DSW-1164?jql=project%20%3D%20DSW%20AND%20fixVersion%20%3D%203.2.2%20ORDER%20BY%20priority%20DESC>`__

3.1
===

* Release: 25 June 2021
* `Jira issues 3.1.0 <https://ds-wizard.atlassian.net/browse/DSW-1091?jql=project%20%3D%20DSW%20AND%20fixVersion%20%3D%203.1.0%20ORDER%20BY%20priority%20DESC>`__
* Key changes:
    * Project templates
    * Minor UI improvements

3.0
===

* Release: 1 June 2021
* `Jira issues 3.0.0 <https://ds-wizard.atlassian.net/browse/DSW-1054?jql=project%20%3D%20DSW%20AND%20fixVersion%20%3D%203.0.0%20ORDER%20BY%20priority%20DESC>`__
* Key changes:
    * Migration from MongoDB and RabbitMQ to PostgreSQL and S3
    * Deep links feature

2.14
====

* Release: 4 May 2021
* `Jira issues 2.14.0 <https://ds-wizard.atlassian.net/browse/DSW-1027?jql=project%20%3D%20DSW%20AND%20fixVersion%20%3D%202.14.0%20ORDER%20BY%20priority%20DESC>`__
* Key changes:
    * Submitting forms using Enter key
    * Shortcuts for KM Editor and Forking KM
    * Clarified public link for project in UI

2.13
====

* End of development: 31 March 2021
* Release: 7 April 2021
* `Jira issues 2.13.0 <https://ds-wizard.atlassian.net/browse/DSW-1025?jql=project%20%3D%20DSW%20AND%20fixVersion%20%3D%202.13.0%20ORDER%20BY%20priority%20DESC>`__
* Key changes:
    * Auto-reconnect in questionnaires (websockets)
    * Fix text inputs in questionnaires when using Grammarly in browser
    * Added actions directly to list views of knowledge models and templates

2.12
====

* End of development: 2 March 2021
* Release: 12 March 2021
* `Jira issues 2.12.0 <https://ds-wizard.atlassian.net/browse/DSW-995?jql=project%20%3D%20DSW%20AND%20fixVersion%20%3D%202.12.0%20ORDER%20BY%20priority%20DESC>`__
* Key changes:
    * Questionnaire versioning (Version History)

2.11
====

* End of development: February 2021
* Release: February 2021
* `Jira issues 2.11.0 <https://ds-wizard.atlassian.net/browse/DSW-397?jql=project%20%3D%20DSW%20AND%20fixVersion%20%3D%202.11.0%20ORDER%20BY%20priority%20DESC>`__
* Key changes:
    * Add multiple choice question
    * Show tags in the questionnaire

2.10
====

* End of development: January 2021
* Release: January 2021
* `Jira issues 2.10.0 <https://ds-wizard.atlassian.net/browse/DSW-988?jql=project%20%3D%20DSW%20AND%20fixVersion%20%3D%202.10.0%20ORDER%20BY%20priority%20DESC>`__
* Key changes:
* Possibility to add specific users to the questionnaire as collaborators

2.9
===

* End of development: 30 November 2020
* Release: 9 December 2020
* `Jira issues 2.9.0 <https://ds-wizard.atlassian.net/browse/DSW-943?jql=project%20%3D%20DSW%20AND%20fixVersion%20%3D%202.9.0%20ORDER%20BY%20priority%20DESC>`__
* Key changes:
    * Refactored error messages
    * Several bugfixes

2.8
===

* End of development: 27 October 2020
* Release: 3 November 2020
* `Jira issues 2.8.0 <https://ds-wizard.atlassian.net/browse/DSW-1?jql=project%20%3D%20DSW%20AND%20fixVersion%20%3D%202.8.0%20ORDER%20BY%20priority%20DESC>`__
* Key changes:
    * Pagination & sorting in table views
    * Introduced DSW Template Development Kit
    * Minor UX improvements
* Hotfixes:
    * 2.8.1 (wizard-server), 24 November 2020, `Jira issues 2.8.1 <https://ds-wizard.atlassian.net/browse/DSW-980?jql=project%20%3D%20DSW%20AND%20fixVersion%20%3D%202.8.1%20ORDER%20BY%20priority%20DESC>`__

2.7
===

* End of development: 29 September 2020
* Release: 5 October 2020
* `Jira issues 2.7.0 <https://ds-wizard.atlassian.net/browse/DSW-915?jql=project%20%3D%20DSW%20AND%20fixVersion%20%3D%202.7.0%20ORDER%20BY%20priority%20DESC>`__
* Key changes:
    * Improved caching for speed optimization
    * Reworked questionnaire detail

2.6
===

* End of development: 5 September 2020
* Release: 9 September 2020
* `Jira issues 2.6.0 <https://ds-wizard.atlassian.net/browse/DSW-904?jql=project%20%3D%20DSW%20AND%20fixVersion%20%3D%202.6.0%20ORDER%20BY%20priority%20DESC>`__
* Key changes:
    * Added questionnaire live collaboration
    * Introduced Projects to relate questionnaire, TODOs, documents, and settings
    * Several UI/UX improvements
    * Improved design of email templates

2.5
===

* End of development: 24 June 2020
* Release: 8 July 2020
* `Jira issues 2.5.0 <https://ds-wizard.atlassian.net/browse/DSW-882?jql=project%20%3D%20DSW%20AND%20fixVersion%20%3D%202.5.0%20ORDER%20BY%20priority%20DESC>`__
* Key changes:
    * Added templates management
    * Several UI/UX improvements
    * Introduced backend workers for scheduled/async tasks
    * Added option to disable questionnaire summary report

2.4
===

* End of development: 27 May 2020
* Release: 3 June 2020
* `Jira issues 2.4.0 <https://ds-wizard.atlassian.net/browse/DSW-719?jql=project%20%3D%20DSW%20AND%20fixVersion%20%3D%202.4.0%20ORDER%20BY%20priority%20DESC>`__
* Key changes:
    * Added RDF support step in document worker
    * Improved default naming of new documents
    * Minor UI/UX improvements
    * Several bugfixes

2.3
===

* End of development: 29 April 2020
* Release: 6 May 2020
* `Jira issues 2.3.0 <https://ds-wizard.atlassian.net/browse/DSW-727?jql=project%20%3D%20DSW%20AND%20fixVersion%20%3D%202.3.0%20ORDER%20BY%20priority%20DESC>`__
* Key changes:
    * Enhanced backend logging for ELK
    * Added document submission
    * Improved integration with Registry for simpler Sign Up
    * Added user avatars
    * Several bugfixes and optimizations

2.2
===

* End of development: 25 March 2020
* Release: 1 April 2020
* `Jira issues 2.2.0 <https://ds-wizard.atlassian.net/browse/DSW-667?jql=project%20%3D%20DSW%20AND%20fixVersion%20%3D%202.2.0%20ORDER%20BY%20priority%20DESC>`__
* Key changes:
    * Added support for OpenID
    * Added affiliations in user profiles
    * Introduced settings to change configurations directly in DSW interface
    * Added API documentation using Swagger
    * UI/UX improvements
    * Several bugfixes and optimizations

2.1
===

* End of development: 25 February 2020
* Release: 3 March 2020
* `Jira issues 2.1.0 <https://ds-wizard.atlassian.net/browse/DSW-613?jql=project%20%3D%20DSW%20AND%20fixVersion%20%3D%202.1.0%20ORDER%20BY%20priority%20DESC>`__
* Key changes:
    * Introduced document worker for better scalability
    * Migrated backend to new framework
    * Added dropdown actions to list views
    * Several bugfixes

2.0
===

* End of development: 14 January 2020
* Release: 14 January 2020
* `Jira issues 2.0.0 <https://ds-wizard.atlassian.net/browse/DSW-127?jql=project%20%3D%20DSW%20AND%20fixVersion%20%3D%202.0.0%20ORDER%20BY%20priority%20DESC>`__
* Key changes:
    * Added move functionality for knowledge models
    * Added possibility to assign template to KMs
    * Added questionnaire cloning
    * Added expand/collapse all in KM Editor
    * Internal refactoring and structure enhancements
    * Several bugfixes

1.10
====

* End of development: 27 August 2019
* Release: 3 September 2019
* `Jira issues 1.10.0 <https://ds-wizard.atlassian.net/browse/DSW-405?jql=project%20%3D%20DSW%20AND%20fixVersion%20%3D%20DSW-1.10.0%20ORDER%20BY%20priority%20DESC>`__
* Hotfixes:
    * 1.10.1 (wizard-client), 18 September 2019, `Jira issues 1.10.1 <https://ds-wizard.atlassian.net/browse/DSW-544?jql=project%20%3D%20DSW%20AND%20fixVersion%20%3D%20DSW-1.10.1%20ORDER%20BY%20priority%20DESC>`__

1.9
===

* End of development: 23 June 2019
* Release: 30 June 2019
* `Jira issues 1.9.0 <https://ds-wizard.atlassian.net/browse/DSW-99?jql=project%20%3D%20DSW%20AND%20fixVersion%20%3D%20DSW-1.9.0%20ORDER%20BY%20priority%20DESC>`__
* Hotfixes:
    * 1.9.1 (wizard-server), 7 August 2019, `Jira issues 1.9.1 <https://ds-wizard.atlassian.net/browse/DSW-495?jql=project%20%3D%20DSW%20AND%20fixVersion%20%3D%20DSW-1.9.1%20ORDER%20BY%20priority%20DESC>`__
    * 1.9.2 (wizard-server), 13 August 2019, `Jira issues 1.9.2 <https://ds-wizard.atlassian.net/browse/DSW-497?jql=project%20%3D%20DSW%20AND%20fixVersion%20%3D%20DSW-1.9.2%20ORDER%20BY%20priority%20DESC>`__

1.8
===

* End of development: 11 June 2019
* Release: 13 June 2019
* `Jira issues 1.8.0 <https://ds-wizard.atlassian.net/browse/DSW-344?jql=project%20%3D%20DSW%20AND%20fixVersion%20%3D%20DSW-1.8.0%20ORDER%20BY%20priority%20DESC>`__
* Hotfixes:
    * 1.8.1 (wizard-client), 13 June 2019, `Jira issues 1.8.1 <https://ds-wizard.atlassian.net/browse/DSW-394?jql=project%20%3D%20DSW%20AND%20fixVersion%20%3D%20DSW-1.8.1%20ORDER%20BY%20priority%20DESC>`__

1.7
===

* End of development: 15 May 2019
* Release: 16 May 2019
* `Jira issues 1.7.0 <https://ds-wizard.atlassian.net/browse/DSW-353?jql=project%20%3D%20DSW%20AND%20fixVersion%20%3D%20DSW-1.7.0%20ORDER%20BY%20priority%20DESC>`__

1.6
===

* End of development: 30 April 2019
* Release: 7 May 2019
* `Jira issues 1.6.0 <https://ds-wizard.atlassian.net/browse/DSW-250?jql=project%20%3D%20DSW%20AND%20fixVersion%20%3D%20DSW-1.6.0%20ORDER%20BY%20priority%20DESC>`__

1.5
===

* End of development: 2 April 2019
* Release: 9 April 2019
* `Jira issues 1.5.0 <https://ds-wizard.atlassian.net/browse/DSW-123?jql=project%20%3D%20DSW%20AND%20fixVersion%20%3D%20DSW-1.5.0%20ORDER%20BY%20priority%20DESC>`__

1.4
===

* End of development: 3 March 2019
* Release: 10 March 2019
* `Jira issues 1.4.0 <https://ds-wizard.atlassian.net/browse/DSW-207?jql=project%20%3D%20DSW%20AND%20fixVersion%20%3D%20DSW-1.4.0%20ORDER%20BY%20priority%20DESC>`__

1.3
===

* End of development: 3 February 2019
* Release: 10 February 2019
* `Jira issues 1.3.0 <https://ds-wizard.atlassian.net/browse/DSW-172?jql=project%20%3D%20DSW%20AND%20fixVersion%20%3D%20DSW-1.3.0%20ORDER%20BY%20priority%20DESC>`__

1.2
===

* End of development: 6 January 2019
* Release: 13 January 2019
* `Jira issues 1.2.0 <https://ds-wizard.atlassian.net/browse/DSW-156?jql=project%20%3D%20DSW%20AND%20fixVersion%20%3D%20DSW-1.2.0%20ORDER%20BY%20priority%20DESC>`__
* Hotfixes:
    * 1.2.1 (wizard-server), 14 January 2019, `Jira issue 1.2.1 <https://ds-wizard.atlassian.net/browse/DSW-183?jql=project%20%3D%20DSW%20AND%20fixVersion%20%3D%20DSW-1.2.1%20ORDER%20BY%20priority%20DESC>`__

1.1
===

* End of development: 9 December 2018
* Release: 16 December 2018
* `Jira issues 1.1.0 <https://ds-wizard.atlassian.net/browse/DSW-85?jql=project%20%3D%20DSW%20AND%20fixVersion%20%3D%20DSW-1.1.0%20ORDER%20BY%20priority%20DESC>`__

1.0
===

* End of development: 24 October 2018
* Release: 30 October 2018
