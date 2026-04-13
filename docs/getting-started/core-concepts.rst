.. _dsw-core-concepts:

Core Concepts
*************

If you remember only a few things about |project_name|, remember these five building blocks. They explain most of the application and make the rest of the guide much easier to follow.


Knowledge model
===============

A :ref:`knowledge model<knowledge-model>` is the questionnaire logic prepared by data stewards. It defines chapters, questions, branching, guidance, validations, metrics, integrations, and experts. Researchers do not usually edit it directly; they answer projects that were created from it.


Project template
================

A :ref:`project template<project-templates>` is a reusable starting point for researchers. It can already include the right knowledge model, a default document template, pre-filled answers, comments, and TODOs. If your institution provides project templates, they are usually the fastest way to start correctly.


Project
=======

A :ref:`project<project>` is the live workspace for one research effort. This is where the questionnaire is answered, files are uploaded, collaborators are invited, and documents are generated. Think of it as the working area for one DMP and its supporting material.


Document template
=================

A :ref:`document template<document-template>` turns questionnaire answers into an output format such as PDF, DOCX, HTML, JSON, or XML. A template must be compatible with the knowledge model used by the project, because it needs to know how to interpret the answers.


Document
========

A :ref:`document<project-documents>` is a generated output stored with the project. Unlike the live preview, a generated document is immutable. This is useful when you need a milestone snapshot such as "proposal submission version" or "reviewed version for ethics board".


How the Pieces Fit Together
===========================

A common end-to-end flow looks like this:

1. An administrator imports or enables content for the instance.
2. A data steward prepares or customizes a knowledge model and one or more document templates.
3. The data steward creates a project template for researchers.
4. A researcher creates a project, answers the questionnaire, uploads supporting files, and collaborates with others.
5. |project_name| generates a document from the selected template and format.

Example:

- Knowledge model: "Institutional DMP Core"
- Project template: "Horizon Europe Starter"
- Project: "Neuroimaging Pilot 2026"
- Document template: "Horizon Europe DMP"
- Document: "DMP-v1-proposal.pdf"

.. TODO::

    Add a screenshot of a project workspace with the questionnaire visible and the main project navigation tabs in view. This should help new readers connect the core concepts to the actual UI.


What Runs Behind the Scenes
===========================

For everyday use, it helps to know which service is responsible for which part of the system.

.. list-table::
    :widths: 20 80
    :header-rows: 1

    * - Component
      - Responsibility
    * - Client
      - The web interface, typically available at ``/wizard``, where users work with projects, questionnaires, templates, and administration pages.
    * - Server
      - The main application backend. It stores answers, manages users and permissions, exposes the API, and coordinates project operations.
    * - Document Worker
      - Generates previews and persistent documents from document templates.
    * - Mailer
      - Sends invitation emails, password resets, and other notifications when mail is configured.
    * - PostgreSQL
      - Stores application data such as users, projects, answers, settings, and metadata.
    * - S3-compatible storage
      - Stores uploaded files, generated documents, and document template assets.

Operational rule of thumb:

- If users cannot log in or save answers, check the Server and PostgreSQL first.
- If file uploads or document downloads fail, check S3 connectivity and whether the configured S3 endpoint is reachable from the browser.
- If documents stay queued or previews fail, check the Document Worker.
- If emails do not arrive, check the Mailer and SMTP configuration.


Where to Continue
=================

- If you are a researcher, continue with :ref:`researcher-workflow`.
- If you are preparing reusable institutional content, continue with :ref:`data-steward-workflow`.
- If you are deploying or evaluating an instance, continue with :ref:`local-deployment-quickstart`.
