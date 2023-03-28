.. _knowledge-model-list:

Knowledge Model List
********************

As **data stewards** and **admins**, we can manage the knowledge models that are in our DSW instance. Then, **researchers** are using and browsing the knowledge models. We can access the list of knowledge model from the main menu via :guilabel:`Knowledge Model`. The list can be filtered and sorted by name or creation date.

For each knowledge model (KM), we can see the latest version in the list. If we want to read more about a specific KM or see the older versions, we need to access the :doc:`./detail` by clicking the name of KM or clicking :guilabel:`Open` from the right item menu (three dots). There are also other options for each item:

- :guilabel:`Preview` to see how :doc:`../../projects/index` generated using this KM would look like.
- :guilabel:`Export` for exporting the latest version of the KM as a file.
- :guilabel:`Create KM editor` is a shortcut for :doc:`../editors/create` for creating a new version.
- :guilabel:`Fork KM` is again a shortcut for :doc:`../editors/create` for to create a fork (some more specific KM based on this one).
- :guilabel:`Create project` is a shortcut to :doc:`../../projects/list/create` with this KM.
- :guilabel:`Set deprecated` or :guilabel:`Restore` for setting a KM deprecated when we no longer want the **researchers** to use it.
- :guilabel:`Delete` for all versions of the KM (possible only if is not used in any projects or linked in other KMs and editors).

.. NOTE::

    The options in the item menu are based on the role of a current user, e.g. a **researcher** cannot create KM editor.

For **data stewards** and **admins**, *update available* may appear if there is a newer version of the knowledge model in the `DSW Registry <https://registry.ds-wizard.org>`__ (and if configured).

Finally, there is an option to :doc:`./import` by click the :guilabel:`Import` button in the top right part of the screen.

.. figure:: index/list.png
    
    List of all knowledge models with actions.

.. raw:: html
    
    <h2>Table of Contents</h2>


.. toctree::
    :maxdepth: 2

    Import<import>
    Detail<detail>
    Preview<preview>
    