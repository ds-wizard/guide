Import a Knowledge Model
************************

Open the knowledge model library and choose :guilabel:`Import`. You need the management permission for the target library.

From the Registry
=================

Where a Registry connection is available, select :guilabel:`From registry` and enter the desired reference in ``id:version`` form, for example ``example.research-model:1.0.0``. Replace the example with the identifier and version of an item available in the Registry, then import it.

.. figure:: /_static/screenshots/5.0/km-import-registry.png
    :figclass: guide-screenshot
    :alt: Import a Knowledge Model from registry in DSW 5.0
    :width: 520

    Import a Knowledge Model from registry.

From a file
===========

Select :guilabel:`From file` and choose a KM bundle exported from DSW or produced by compatible tools. Multiple files can be selected. Review any validation errors before using the imported content.

.. figure:: /_static/screenshots/5.0/km-import-file.png
    :figclass: guide-screenshot
    :alt: Import a Knowledge Model from file in DSW 5.0
    :width: 520

    Import a Knowledge Model from file.

Importing a new version does not change the knowledge model used by existing projects. Review project settings and use :doc:`/application/projects/list/migration` when changing a project's knowledge model.
