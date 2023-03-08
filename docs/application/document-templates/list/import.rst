.. _doc-template-import:

Document Template Import
************************

We can import an existing document template by navigating to :doc:`./index` (:menuselection:`Document Templates`) in the main menu and then clicking on :guilabel:`Import` button on the list of document templates.

.. _doc-template-import-from-registry:

From DSW Registry
=================

If the DSW instance is connected to the `DSW Registry <https://registry.ds-wizard.org>`__, it is possible to import document templates from it by entering the **document template ID** of desired template (e.g. ``dsw:questionnaire-report:2.7.1``) and pressing the :guilabel:`Import` button.

.. NOTE::

    In case of document templates present in the `DSW Registry <https://registry.ds-wizard.org>`__, we will be notified about the available upgrades.


.. figure:: import/registry.png
    :width: 500
    
    Input for importing a document template from DSW Registry.


From file
=========

We can import a document template as a ZIP package. Such a package can be created as an export from DSW or using the Template Development Kit (see :ref:`document-template-development`).


.. figure:: import/file.png
    :width: 500
    
    Input for importing a document template using a ZIP package.
