Document Template Library
*************************

Open :guilabel:`Document Templates` → :guilabel:`List` to browse published templates. Search or filter the list and open a template to see its versions, README, supported formats and knowledge model compatibility.

Use **Manage Document Templates** for library management. Available actions depend on your permissions.

* :guilabel:`Import` adds a template bundle; see :doc:`/application/document-templates/list/import`.
* :guilabel:`Export` downloads a published version as a ZIP bundle.
* :guilabel:`Create editor` starts a draft for further changes.
* Deprecating a version makes it unavailable for new selections. Other installed versions remain separate.
* :guilabel:`Delete` removes a version or the template's versions, according to the selected action. Review the dependent documents and projects before confirming; see :doc:`/application/document-templates/list/detail`.

A template marked :guilabel:`unsupported metamodel` needs a compatible version. Publishing an old template without porting its code does not make it compatible with context 19.0.

An :guilabel:`update available` badge shows that a newer version is available in the Registry. We can import that version to update the installed template.

.. figure:: /_static/screenshots/5.0/dt-list.png
    :figclass: guide-screenshot
    :alt: Document Template library in DSW 5.0
    :width: 760

    Document Template library.

.. toctree::
   :maxdepth: 1

   Detail <detail>
   Import <import>
