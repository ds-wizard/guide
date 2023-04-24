.. _integration_questions:

Integration Questions
*********************

DSW can be integrated with other services using so called :ref:`integration question<integration-question>`. The answer to that type of question does not contain only the answer itself but also a link to that external resource (which can be done, for example, using a persistent identifier). Therefore, these answers help clearly understand what the researchers use and promotes interoperability.

Examples of such integrations that are used within `Common DSW Knowledge Model <https://registry.ds-wizard.org/knowledge-models/dsw:root:latest>`_ is `FAIRsharing <https://fairsharing.org>`_ or `ROR <https://ror.org>`_.

There are two ways of how we can connect DSW to these services:

- **API** - using an API provided by the external service to search for the results
- **Widget** - using a specialized widget implemented for the connection with the DSW

.. raw:: html
    
    <h2>Table of Contents</h2>


.. toctree::
    :maxdepth: 1

    API<integration-api>
    Widget<integration-widget>
