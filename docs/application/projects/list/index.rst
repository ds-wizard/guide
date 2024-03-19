.. _project-list:

Project List
************

In the project list, we can see a list of all projects we have access to. Those are the projects where we were assigned to with any role or that are visible by all other logged-in users in the :ref:`project sharing settings<sharing>`. The projects are filtered to those we are explicitely assigned to by default.

.. figure:: index/project-list.png
    
    Project list with filters.


We can search for specific projects using the search field or filter them using additonal filters:

- **Project Template** - if we want to see only :ref:`project templates<project-templates>` or regular projects
- **Project Tags** - show only the projects that has specific tags assigned
- **Knowledge Models** - show only the projects created from a specific knowledge model
- **Users** - filter only the projects with specifc users assigned to them

.. NOTE::

    Note that some of the filters can be disabled based on the |project_name| instance settings or user role.


We can :ref:`create a new project<create-project>` by clicking the :guilabel:`Create` button.


By clicking the triple dots on each of the item in the list we can access some actions:

- **Open project** - will simply open the project
- **Create project from this template** - will create a new project from the selected project template (this is only available if the project is also a project template)
- **Clone** - will create the exact copy of the project
- **Create migration** - will start a :ref:`project migration<project-migration>`
- **Delete** - will delete the project (this action cannot be undone)

If there is an ongoing :ref:`project migration<project-migration>`, there are different actions:

- **Continue migration** - to come back to the ongoing project migration
- **Cancel migration** - to cancel the ongoing project migration


.. raw:: html
    
    <h2>Table of Contents</h2>

.. toctree::
    :maxdepth: 2

    Create<create>
    Detail<detail/index>
    Migration<migration>
    Templates<templates>
