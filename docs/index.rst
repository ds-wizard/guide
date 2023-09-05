|project_name| User Guide
*************************

The |project_name_full| is a tool that helps researchers and data stewards create data management plans (DMPs) easily, efficiently, and in a FAIR manner.

Data stewards can easily capture the knowledge, including required project data and decisions in knowledge models that are then turned into per-project questionnaires to be filled by researchers. The questionnaires guide researchers through the process using recommendations, FAIR metrics indications, and only showing relevant questions based on previous answers.

Once the questionnaire is completed, a DMP can be easily generated using a selected template and output format. The document is then stored in |project_name| for easy access and future reference. This is especially helpful because many funding agencies now require a DMP for their application process.

But the benefits of using |project_name| go beyond just creating a DMP. Researchers also learn how to handle data correctly, make it FAIR, maintain it throughout the project, and curate it long-term. This intelligent, guided, and efficient approach to composing DMPs is useful for ELIXIR nodes, research institutions, and individual researchers alike.

.. youtube:: gcSPG_dyVUQ
    :width: 100%
    :align: center


Structure of the Guide
======================

The guide sections are organized into three categories:

- **About** contains an introduction to the Data Stewardship Wizard and its content to gain quick insight into how it works at a high level.
- **Application** is structured the same way as |project_name|'s main menu to quickly find the relevant sections about how to use a specific part of the application.
- **More** contains all additional information related to |project_name|, such as development roadmap, how to develop own content, or how to run own instance.

Here are some recommended sections where to start based on the role:

.. list-table::
    :widths: 33 33 33
    :header-rows: 1

    * - Researcher
      - Data Steward
      - Admin
    * - Introduction
      - Introduction
      - Introduction
    * - :ref:`overview`
      - :ref:`overview`
      - :ref:`overview`
    * - :ref:`project`
      - :ref:`knowledge-model`
      - 
    * -
      - :ref:`document-template`
      - 
    * - Application
      - Application
      - Application
    * - :ref:`projects`
      - :ref:`knowledge-models`
      - :ref:`documents`
    * - 
      - :ref:`document-templates`
      - :ref:`administration`
    * -
      - More
      - More
    * - 
      - :ref:`document-template-development`
      - :ref:`submission-service`
    * - 
      - :ref:`integration_questions`
      - 
    * - 
      - :ref:`project-importers`
      - 


.. raw:: html
    
    <h2>Full Table of Contents</h2>


.. toctree::
    :maxdepth: 2
    :caption: About

    about/introduction/index

.. toctree::
    :maxdepth: 2
    :caption: Application

    application/knowledge-models/index
    application/document-templates/index
    application/projects/index
    application/documents/index
    application/administration/index
    application/profile/index

.. toctree::
    :maxdepth: 2
    :caption: More
    
    Changelog <https://changelog.ds-wizard.org>
    more/self-hosted-dsw/index
    more/development/index
    more/miscellaneous/index
