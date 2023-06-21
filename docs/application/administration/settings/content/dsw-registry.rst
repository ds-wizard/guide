.. _dsw-registry-settings:

DSW Registry Settings
*********************

In this settings, we can configure a connection to DSW Registry that will allow import of various content (Knowledge Models, Document Templates, and Locales) to our |project_name| instance.

Upon enabling the DSW Registry option, we are prompted to enter a **Token**. It can be obtained either by direct registration in the `DSW Registry<https://registry.ds-wizard.org>` or through clicking :guilabel:`Sign up` button. After clicking the button, we will need to enter details about organization (it is prefilled from :doc:`../system/organization`) and email address to which the confirmation will be sent (prefilled by email of the current user). Then, after clicking a link in the confirmation email, the token will be prefilled automatically. After having the token filled in either way, we can :guilabel:`Save` the settings.

After successfully setting the DSW Registry, we will see option to import from it for :ref:`Knowledge Models<km-import>`, :ref:`Document Templates<doc-template-import>`, and :ref:`Locales<locale-import>`.

.. NOTE::

    The **Token** value is encrypted in the database.
