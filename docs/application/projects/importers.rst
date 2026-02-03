..  _importers:

Importers
*********

.. WARNING::

    Project importers are discontinued and will be removed in future releases. Importers are now implemented as plugins, more information on configuration can be found here: :ref:`plugins configuration<configuration-plugins>`.
    
    We can also develop new plugins, more information on development can be found here: :ref:`plugins development<development-plugins>`.


We can use project importers to import data from different |project_name| instances or even different applications to |project_name|. Each has a set of supported knowledge models defined. This is because each knowledge model has a different structure and the importer needs to understand it so it can import the answers to the correct questions.

.. NOTE::

    Only data stewards or admins can access project importers.


If we navigate to :guilabel:`Projects → Importers`, we can see the list of all available importers. We can enable or disable them by clicking on the triple dots icon and choosing the appropriate action.

.. figure:: importers/importers.png
    
    List of project importers where we can enable or disable them.


More information about how to develop project importers is available on the :ref:`project importers development<development-importers>` page.
