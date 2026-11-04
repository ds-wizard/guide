Create a document template editor
*********************************

We can create an editor by opening :guilabel:`Document Templates` → :guilabel:`Editors` and clicking :guilabel:`Create`. This requires :guilabel:`Use Document Template Editor`.
Start from an existing template where appropriate, or prepare a new template with its name, identifier, version and source language.

The identifier and version are separate values.


The editor contains files and metadata. See :doc:`/application/document-templates/editors/detail/settings` for formats and compatibility, or use the :doc:`/more/development/document-templates/tdk` for local development.

.. figure:: /_static/screenshots/5.0/dt-editor-create.png
    :figclass: guide-screenshot
    :alt: Create a Document Template Editor in DSW 5.0
    :width: 596

    Create a Document Template Editor.

Starting from an existing template
==================================

Choose a template in :guilabel:`Based on` to copy its files and configuration into the new editor. We can then change those files, formats and metadata. The released template's :guilabel:`Create editor` action opens the corresponding creation form.

Deleting an editor does not prevent creating another from the released template. Choose a new version for the next release; an existing template identifier and version cannot be reused in the same DSW instance.
