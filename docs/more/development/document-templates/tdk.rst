.. _dsw-tdk:

Template Development Kit
************************

Use a 5.0-compatible Template Development Kit (TDK) for context 19.0. It can maintain template metadata, fetch server content, package templates and render locally with the shared templating engine.
Use Python 3.12 or later (below Python 4), or the compatible TDK container, and keep its rendering dependencies aligned with the instance's worker.

Configuration
=============

Set ``DSW_API_URL`` to the API base shown by your instance, normally ``https://<instance>/api``, and ``DSW_API_KEY`` to a permitted API key.
A local untracked ``.env`` or the TDK shared configuration can provide these values. Do not commit credentials.
Run ``dsw-tdk --help`` and a command's ``--help`` for options in your installed compatible version.

Template workflow
=================

* ``new`` starts a local template project.
* ``get`` downloads a template; ``list`` lists available templates.
* ``verify`` validates local template metadata.
* ``put`` uploads the template, optionally watching local changes.
* ``package`` creates an importable ZIP; ``unpackage`` extracts one.
* ``pot`` extracts translatable messages.



Get a real context
==================

.. code-block:: shell

   dsw-tdk get-context --project PROJECT_UUID --output context.json
   dsw-tdk get-context --km-editor EDITOR_UUID --output editor-context.json
   dsw-tdk validate-context context.json editor-context.json

Use exactly one source per get-context command. ``--event`` can select a project event when used with ``--project``.

Generate test contexts
======================

.. code-block:: shell

   dsw-tdk generate-context --km-bundle model.km --profile typical --count 3 --seed 42 --output contexts
   dsw-tdk validate-context contexts/*.json

Profiles include empty, minimal, typical, full and edge. A seed makes generated data reproducible. Generated data supplements real cases; it does not establish that all questionnaire behavior or template semantics are correct.

Render and compare
==================

.. code-block:: shell

   dsw-tdk render --context context.json --format "HTML Document" --output document.html
   dsw-tdk render --context contexts --all-formats --output output

A batch renders the context/format combinations and writes a summary. Use the result to identify failures and inspect representative outputs for each customer format.
Use supported translation and project-file options when the document depends on them.

For field changes, see :doc:`/more/development/document-templates/document-context`. Local/server parity also depends on the deployed conversion tools, fonts and custom rendering extensions.
