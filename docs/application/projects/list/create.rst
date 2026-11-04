.. _create-project:

.. _from-project-template:

.. _create-project-custom:

Create a project
****************

We can create a new project by opening :guilabel:`Projects` in the main menu and clicking :guilabel:`Create`. This requires the :guilabel:`Create Projects` permission. Depending on the instance settings, we can create a project from a project template, a knowledge model, or both.

From a project template
=======================

Project templates are prepared projects with pre-selected knowledge models and settings. They can also contain pre-filled answers, comments and TODOs. To create a project from a template, we need to enter a **name** and select a **project template**.

.. figure:: /_static/screenshots/5.0/project-create-template.png
    :figclass: guide-screenshot
    :alt: Project create template in DSW 5.0
    :width: 520

    Project create template.

From a knowledge model
======================

To create a project from a knowledge model, we need to enter a **name** and select a **knowledge model**. The selector shows its ID and version to help distinguish similarly named models.
If the knowledge model has question tags, we can include all questions or filter them by tag. If it has translations, we can also choose the questionnaire language.
We can then choose a document template in the :doc:`project settings </application/projects/list/detail/settings>`.

.. figure:: /_static/screenshots/5.0/project-create-custom.png
    :figclass: guide-screenshot
    :alt: Project create custom in DSW 5.0
    :width: 520

    Project create custom.

The knowledge model's source language is selected by default. Alternative languages are offered when translations are available. A project created directly from a knowledge model starts without pre-filled questionnaire replies; choose its document template and other defaults in the project settings.

Where available, the dashboard's create-project shortcut opens the same creation workflow.
