Document Template Detail
************************

We can check a document template detail by clicking on a desired template in the :doc:`/application/document-templates/list/index` (or selecting :guilabel:`View detail` from the right dropdown). The detail shows basic information about the template such as its name, ID, version, license, metamodel version, creation date, or supported document formats.

The main part of the detail is the README of the template that should contain basic information and changelog for the template. In the right panel under the basic information, we can navigate to other versions of the document template, navigate to the `DSW Registry <https://registry.ds-wizard.org/>`__ (if the template is present there), or check compatible knowledge model with the template.

In the top bar, we can :guilabel:`Export` the template as a ZIP package or :guilabel:`Delete` this version of the template. We can also quickly navigate to :doc:`/application/document-templates/editors/create` by clicking :guilabel:`Create editor`; it will prepare editor creation for a new version of this document template.

We can also choose :guilabel:`Set deprecated`, which makes this version unavailable for new selections. This only applies to the latest version of the document template. If there is an older version, that will still be available.

If we are not seeing the latest version of the template, a warning message is shown in the top. Similarly, we will see a notification that update is available if there is a newer version in the `DSW Registry <https://registry.ds-wizard.org/>`__ (if configured).

.. _document-template-locales:

Document Template Locales
=========================

A document template has a source language and can have locales for additional languages. The :guilabel:`Locales` tab lists each imported locale by name and language code.

When the template is prepared for translations, use :guilabel:`Export .pot file` from its actions menu to obtain the source strings, translate them into a PO file, and use :guilabel:`Import` on the :guilabel:`Locales` tab to provide the locale name and PO file. Available actions also allow downloading or deleting an imported locale, subject to permissions.

The template's source language is shown in its detail panel. A locale becomes available when selecting a :ref:`default document language<default-document-template>` for a project or creating a document with that template.


.. todo::

   Screenshot: Document Template details in DSW 5.0.

Deleting a template in use
==========================

A template can be deleted even when it has generated documents. Deletion removes those documents and clears the selected template in affected projects; the projects remain.
Review all affected content before confirming. Deletion is refused if the acting user cannot view every dependency.

.. todo::

   Screenshot: Delete Document Template with dependent projects in DSW 5.0.
