Locales
*******

After navigating to :guilabel:`Locales` (under :guilabel:`Administration`), we can browse and manage a list of locales in the DSW instance. Similarly to knowledge models and document templates, each locale has its unique identifier and version. Moreover, each locale has a language code specified. In the list we see the latest version and can quickly navigate to :doc:`./detail` (which includes also older versions) by clicking the locale name or selecting :guilabel:`View detail` from the right item menu of the desired row.

There is always the **Engligh** locale (``wizard:default:1.0.0``) which is embedded and cannot be deleted. For others, we can use :guilabel:`Export` and :guilabel:`Delete` options from the right item menu.

Another option is to switch other locale to be the default one using :guilabel:`Set default` action. The default locale will be used in case no available locale tgat matching user's preferences (explicit or implicit from the web browser). We can :guilabel:`Disable` or :guilabel:`Enable` locales except the default one (which must be enabled).

If there is a locale with newer version available in the `DSW Registry <https://registry.ds-wizard.org>`__ (and if configured), *update available* clickable badge may appear. Finally, we can use :guilabel:`Import` to :doc:`./import` and :guilabel:`Create` to :doc:`./create`.


.. NOTE ::

    We support community of DSW translators by managing the repository `ds-wizard/wizard-client-locales <https://github.com/ds-wizard/wizard-client-locales>`__ and service for translating using web browser `localize.ds-wizard.org <https://localize.ds-wizard.org>`__.


.. figure:: index/list.png
    
    List of locales.


----


.. raw:: html
    
    <h2>Table of Contents</h2>


.. toctree::
    :maxdepth: 2

    Import<import>
    Create<create>
    Detail<detail>