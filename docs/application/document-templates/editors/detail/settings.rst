Document template settings
**************************

Edit the template's name, description, identifier, version, source language, license and README in the settings.
The source language describes the template's translatable content; output translations are managed for the released template.


General metadata
================

* **Name**: a descriptive name for the document template.
* **Description**: a short explanation shown when users select a template.
* **Template ID** and **Version**: identify this template release; keep the identifier and version separate.
* **Language**: source language of translatable template text. Add output translations to the published template.
* **License**: the license under which the template may be used and shared.
* **Readme**: usage instructions, acknowledgements, references and a changelog.


.. figure:: /_static/screenshots/5.0/dt-settings.png
    :figclass: guide-screenshot
    :alt: Document Template settings in DSW 5.0
    :width: 760

    Document Template settings.

Knowledge model compatibility
=============================

Compatibility patterns use a knowledge model identifier and optional minimum/maximum versions. A null or empty identifier matches any model; a missing bound leaves that side of the version range unrestricted.
The organization ID is no longer a separate filter. Review migrated organization-only patterns, because removing that constraint can broaden the accepted models.

.. figure:: /_static/screenshots/5.0/dt-allowed.png
    :figclass: guide-screenshot
    :alt: Allowed Knowledge Models in DSW 5.0
    :width: 664

    Allowed Knowledge Models.

For example, the identifier ``dsw.root``, minimum version ``2.4.0`` and an empty maximum version match ``dsw.root`` versions ``2.4.0``, ``2.4.4`` and ``2.5.0``. They do not match ``dsw.root`` version ``2.3.0`` or a different model such as ``acme.base-km``. Bounds are inclusive. Leaving a field empty removes that constraint.

Formats
========

Each output format has a name, icon and ordered generation steps. A step has its implementation name and its options.
Choose the steps required to generate or convert that format, then test it with actual answers, translations and uploaded files where relevant.

The metadata uses document-template metamodel 19.0. Port custom code as described in :ref:`document-template-metamodel-versions`; changing only the metamodel number does not update an old template's field accesses.

.. figure:: /_static/screenshots/5.0/dt-formats.png
    :figclass: guide-screenshot
    :alt: Document Template formats in DSW 5.0
    :width: 664

    Document Template formats.

.. figure:: /_static/screenshots/5.0/dt-format-steps.png
    :figclass: guide-screenshot
    :alt: Jinja rendering step with its template and file output options
    :width: 604

    Document format steps and options.

Configure a format
==================

Use :guilabel:`Add` to create a format, then enter its **Name** and **Icon**. Users select the format when generating or previewing a document. A template can offer several formats.

Each format contains ordered steps. For a Jinja step, use the name ``jinja`` and set ``template``, ``content-type`` and ``extension`` in its options. Conversion steps such as ``pandoc`` or ``weasyprint`` can follow it. The steps and their options are described in :doc:`/more/development/document-templates/specification`.
