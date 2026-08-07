.. _dsw-registry-settings:

DSW Registry
************

In these settings, we can configure a connection to DSW Registry that will allow importing various content (knowledge models, document templates, and locales) to our DSW instance.

Upon enabling the DSW Registry option, we are prompted to enter a **Token**. It can be obtained either by direct registration in the `DSW Registry <https://registry.ds-wizard.org>`__ or by clicking the :guilabel:`Sign up` button. After clicking the button, we will need to enter details about the organization (prefilled from :doc:`../system/organization`) and the email address to which the confirmation will be sent (prefilled with the email of the current user). Then, after clicking a link in the confirmation email, the token will be prefilled automatically. After the token has been filled in either way, we can :guilabel:`Save` the settings.

After successfully setting the DSW Registry, we will see the option to import from it for :ref:`knowledge models<km-import>`, :ref:`document templates<doc-template-import>`, and :ref:`locales<locale-import>`.

.. NOTE::

    The **Token** value is encrypted in the database.
