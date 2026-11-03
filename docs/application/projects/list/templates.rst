.. _project-templates:

Project Templates
*****************

.. NOTE::

    Project owners with :ref:`Manage Project Templates <roles>` can mark a project as a template. Starting a new project also requires :guilabel:`Create Projects`.

When creating a new project, we need to choose a knowledge model and optionally select some question tags. After the project is created, we should also choose a :ref:`default document template<default-document-template>` and format to enable :ref:`preview<preview>`. It can be overwhelming for new researchers to set up everything when they are new to all this.

A project template is a prepared project. It can contain a knowledge model and question tags, a default document template, answers, TODOs, comments and editor notes. Users choose it when :ref:`creating a project <create-project>`.

The new project copies the questionnaire content, files, comments and named versions. It has a new owner and uses the instance's default visibility and sharing settings. Generated documents are not copied.

Unlike :doc:`cloning a project </application/projects/list/index>`, creating from a template does not retain the template's collaborators. Review the new project's :doc:`sharing settings </application/projects/list/detail/sharing>` before inviting others.

When we want to turn a project into a project template, we need to go to the :ref:`project settings<project-settings>` and check the :guilabel:`Project Template` checkbox.


.. figure:: /_static/screenshots/5.0/project-template.png
    :figclass: guide-screenshot
    :alt: Project template in DSW 5.0
    :width: 724

    Project template.

Sharing the Project Templates
=============================

.. WARNING::

    Project templates follow the same rules for sharing as regular projects. Therefore, to make it available for other users, we need to set up proper :ref:`sharing settings<sharing>`.

We can either share them with specific users only, or we can simply make the project template **visible to other signed-in users** with **view** access only (as we do not want them to change it).


External Resources
==================

- `Project Templates in DSW <https://fair-wizard.com/blog/project-templates-in-fair-wizard>`_
