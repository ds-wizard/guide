Import a Knowledge Model
************************

Open the knowledge model library and choose :guilabel:`Import`. You need the management permission for the target library.

From the Registry
=================

Where a Registry connection is available, select :guilabel:`From registry` and enter the desired reference in ``id:version`` form, for example ``example.research-model:1.0.0``. This is an illustrative identifier, not a bundled item.
Use the Registry to find an available item and version, then import it.

.. todo::

   Screenshot: Import a Knowledge Model from registry in DSW 5.0.

From a file
===========

Select :guilabel:`From file` and choose a KM bundle exported from DSW or produced by compatible tools. Multiple files can be selected. Review any validation errors before using the imported content.

.. todo::

   Screenshot: Import a Knowledge Model from file in DSW 5.0.

Importing a new version does not update the model or template selected in existing projects. Review project settings and use :doc:`/application/projects/list/migration` when changing a project's knowledge model.
