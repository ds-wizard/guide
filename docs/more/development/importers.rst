.. _development-importers:

Project Importers Development
*****************************

.. WARNING::

    Project importers are an experimental feature.

Project importers are can be used to import the data from an external resource to |project_name| questionnaire. The importer creates the replies based on the data, therefore it needs to know the structure of the knowledge model it is compatible with.

We can implement a project importer using `DSW Integration SDK <https://github.com/ds-wizard/dsw-integration-sdk>`_. It is a JavaScript library we can import and use its API for the communication with |project_name|. The installation and usage is described in the SDK readme.

Example Importers
=================

There are some importers already implemented. They are a good resource to see how to use the SDK:


- `DSW Replies Importer <https://github.com/ds-wizard/dsw-replies-importer>`_
- `DSW maDMP Importer <https://github.com/ds-wizard/dsw-madmp-importer>`_

