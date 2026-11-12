.. _document-template-development:

Document Template Development
*****************************

Document templates allow us to specify how to export a questionnaire in the form of a document file. Developing templates requires basic programming skills and familiarity with Jinja2. We can develop the document templates either on our local computer (traditional development with text editor or IDE) using the :doc:`./tdk` (TDK) or directly in DSW using :doc:`../../../application/document-templates/editors/index`.

Every document template is based on the :doc:`template specification<specification>` and typically uses the :doc:`document context<document-context>` to query information from a project (questionnaire replies, knowledge model, metadata, etc.) to create a document.

Examples
========

- `ds-wizard/questionnaire-report-template <https://github.com/ds-wizard/questionnaire-report-template>`__
- `ds-wizard/madmp-template <https://github.com/ds-wizard/madmp-template>`__
- `ds-wizard/horizon-europe-dmp-template <https://github.com/ds-wizard/horizon-europe-dmp-template>`__




.. toctree::
    :maxdepth: 1

    document-context
    tdk
    Template Specification<specification>
    document-worker-plugins
    Development Notes<dev-notes>
