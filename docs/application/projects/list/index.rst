.. _project-list:

Project List
************

In the project list, we can see a list of all projects we have access to. Access can come from a project role, user-group membership, visibility settings or instance-wide project permissions. See :ref:`project sharing <sharing>`. The projects are filtered to those we are explicitly assigned to by default.

We can see project names, label :guilabel:`Template` if the project is a template, update badges, and icons indicating sharing settings:

- **Outdated KM** - the project uses a knowledge model with a newer version available
- **Outdated DT** - the project uses a document template with a newer version available

- **Lock icon** - private project sharing
- **People icon** - the project is shared with other users, hovering on the icon provides additional information
- **Globe icon** - anyone with a link can access the project

These icons describe project sharing. Instance-wide ALL Projects permissions can grant additional access.

.. todo::

   Screenshot: Project list and actions.

We can search for specific projects using the search field or filter them using additional filters:

- **Project Template** - if we want to see only :ref:`project templates<project-templates>` or regular projects
- **Project Tags** - show only the projects that have specific tags assigned
- **Knowledge Models** - show only the projects created from a specific knowledge model
- **Users** - filter only the projects with specific users assigned to them
- **User Groups** - show only the projects shared with specific user groups

.. NOTE::

    Note that some of the filters can be disabled based on the DSW settings or user role.


We can :ref:`create a new project<create-project>` by clicking the :guilabel:`Create` button.

By clicking the triple dots on each item in the list we can access some actions:

- **Open project** - will simply open the project
- **Create project from this template** - will create a new project from the selected project template (this is only available if the project is also a project template)
- **Clone** - creates a project with the source questionnaire, files, comments and named versions. Other explicit collaborators and the source sharing settings are retained. Generated documents are not copied
- **Migrate** - will start a :ref:`project migration<project-migration>`
- **Delete** - will delete the project (this action cannot be undone)

.. todo::

   Screenshot: Clone a project in DSW 5.0.
