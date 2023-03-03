.. _km-preview:

Knowledge Model Preview
***********************

The preview feature for knowledge models allows us to check the content, i.e. how the questionnaire looks like. It can be used to navigate just through the top-level questions. However, with a know UUID of the question, we can create a direct link to a certain question:

.. CODE::

    https://researchers.ds-wizard.org/knowledge-models/dsw:root:2.4.4/preview?questionUuid=0b12fb8c-ee0f-40c0-9c53-b6826b786a0c

For a nested question, all needed question above in the tree will be automatically prefilled. The KM preview may be also available to non-logged-in users, if configured by administrators in :doc:`../../administration/settings/content/knowledge-models`.

A user can directly create a new project from the KM preview. Again, this can be available also for non-logged-in users if anonymous projects are enabled by administrations in :doc:`../../administration/settings/content/projects`.
