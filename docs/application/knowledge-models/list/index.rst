.. _knowledge-model-list:

Knowledge Model Library
***********************

Open :guilabel:`Knowledge Models` → :guilabel:`List` to browse published knowledge models. Search by name or ID and open a model to review its versions, README and metadata.

**Manage Knowledge Models** controls library management. The actions shown depend on your permissions.

* :guilabel:`Open` opens the model's detail, as does clicking its name. The detail includes older versions.
* :guilabel:`Preview` shows the questionnaire created from the model without creating a project.
* :guilabel:`Export` downloads the selected version as a KM bundle; :guilabel:`Export .pot file` downloads its translation template.
* :guilabel:`Compare` compares the selected version with another version.
* :guilabel:`Create KM editor` prepares an editor for another version; :guilabel:`Fork KM` starts a separate model based on it.
* :guilabel:`Create project` opens the creation form with this model selected.
* :guilabel:`Set deprecated` and :guilabel:`Restore` affect the selected version. Other versions remain separate.
* :guilabel:`Set public` and :guilabel:`Set private` control access to the model without signing in.
* :guilabel:`Delete` opens the dependency review. The detail page can target a single version.

Use :doc:`/application/knowledge-models/list/import` to add bundles or registry versions. An update badge signals that a newer registry version is available; it does not migrate existing projects. Use :doc:`/application/projects/list/migration` for that.

.. figure:: /_static/screenshots/5.0/km-list.png
    :figclass: guide-screenshot
    :alt: Knowledge Model library in DSW 5.0
    :width: 760

    Knowledge Model library.

.. toctree::
   :maxdepth: 1

   Compare <compare>
   Detail <detail>
   Import <import>
   Preview <preview>

.. warning::

   Deleting a knowledge model can also delete its versions, dependent editors and projects, including the projects' documents and files. Review the listed dependencies before confirming. This deletion cannot be undone through the application.

Search and updates
==================

Search by name or identifier and sort the list by name or creation date. The list shows the latest version; open the detail for older ones. The actions available depend on the account's permissions.

An :guilabel:`update available` badge identifies a newer version in the connected Registry. Importing it does not migrate existing projects. Multiple KM files can be selected when importing from files.
