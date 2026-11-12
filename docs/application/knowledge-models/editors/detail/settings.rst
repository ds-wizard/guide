Knowledge model settings
************************

The settings describe the model's name, identifier, version, source language and other editable metadata.
Choose a stable identifier for the model and a new semantic version for a new release. The former organization ID is no longer a separate part of the identifier.

Keep the identifier when releasing a new version of the same model. Use a different identifier for a separate model or fork, and review the parent model before publishing.
Use :doc:`/application/knowledge-models/editors/detail/publish` to create the released version used by projects.


Metadata fields
===============

* **Name**: a short, descriptive name for the knowledge model.
* **Description**: a brief explanation that helps users select the correct model for a project.
* **Knowledge Model ID**: the model's stable identifier. The published identifier and version are separate values in 5.0.
* **Version**: the version that will be published from this editor.
* **Language**: the source language of the model; it is the default questionnaire language and the source for translations.
* **License**: how others may use and share the model. Use an identifier from the `SPDX License List <https://spdx.org/licenses/>`_ where appropriate.
* **Readme**: longer instructions, acknowledgements and a changelog. Markdown formatting is supported.

The name, description and version help users choose a model. Keep them meaningful to the people creating projects.
For a version ``major.minor.patch``, use a major change for breaking structural changes, a minor change for compatible additions, and a patch for corrections such as typos. See `Semantic Versioning <https://semver.org/>`_.

Danger Zone
===========

:guilabel:`Delete editor` discards the unpublished work in this editor. Published versions of the knowledge model remain in the library. Deleted editor changes cannot be recovered through the editor.


.. figure:: /_static/screenshots/5.0/km-settings.png
    :figclass: guide-screenshot
    :alt: Knowledge Model Editor settings in DSW 5.0
    :width: 760

    Knowledge Model Editor settings.
