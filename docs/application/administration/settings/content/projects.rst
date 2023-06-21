Projects Settings
*****************

Project Visibility
==================

If we want to let users select visibility of their projects within the |project_name| instance, we can enable **Project Visibility** feature. If it is disabled, the new projects will have the **Default Project Visibility** which is used when creating a new project:

*  **Private** = the project is visible only to the users with explicit access to the project.
* **Visible - View** = the project is visible in view-only mode to all logged-in users, i.e. all users will be able to see the project in their :ref:`projects list<project-list>` and access it (but not edit or comment anything unless they are invited with different permissions).
* **Visible - Comment** = the project is visible in comment mode to all logged-in users, i.e. all users will be able to see the project in their :ref:`projects list<project-list>`, access it and comment it (but not edit anything unless they are invited with different permissions).
* **Visible - Edit** = the project is visible in edit mode to all logged-in users, i.e. all users will be able to see the project in their :ref:`projects list<project-list>`, access it, comment it, and also edit it (e.g. answer questions or editor notes).


Project Sharing
===============

If we want to let users select sharing option of their projects within the |project_name| instance, we can enable **Project Sharing** feature. If it is disabled, the new projects will have the **Default Project Sharing** which is used when creating a new project:

*  **Restricted** = only logged-in users can access the project depending on the project visibility (no public access for anonymous users).
* **View with the link** = anyone with the link to the project may open it in view mode and browse it.
* **Comment with the link** = anyone with the link to the project may open it in comment mode, i.e. browse it and comment on questions.
* **Edit with the link** = anyone with the link to the project may open it in edit mode, i.e. browse it, comment on questions, and also edit it (e.g. answer questions or editor notes).

Anonymous Projects
==================

If we have enabled :ref:`Public Knowledge Models<settings-km-public>`, we can also allow anonymous users to create projects where they will be able to fill questionnaires by enabling **Anonymous Projects**. These anonymous project then work as any other projects with public link set to edit permissions. However, if a logged-in user accesses such a project, then such a user may claim the ownership by clicking :guilabel:`Add to my projects` button. Anonymous users cannot create new documents, for that they must register and open the project as a logged-in user.


Feedback
========

In case we want to allow users to provide feedback specific to questions directly from :ref:`questionnaires<project-questionnaire>`, we can enable **Feedback** and configure a GitHub repository which will be used as an issue tracker. We should have a bot/service account created with access to the GitHub repository and obtain `Personal Access Token <https://help.github.com/en/github/authenticating-to-github/creating-a-personal-access-token-for-the-command-line>`_. This account will be used to create the GitHub issues in the repository. Then, we need to simply fill **GitHub Repository Owner**, **GitHub Repository Name**, and the **Access Token**.

.. NOTE::

    The **Access Token** value is encrypted in the database.


Project Tagging
===============

If enabled, users will be able to tag their projects (using so-called **Project Tags**) and then use those tags to filter the :ref:`projects list<project-list>`. The users will be always able to write their own tags but we can provide a list of pre-defined **Default Project Tags** (one per line).
