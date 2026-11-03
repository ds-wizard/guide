.. _dsw-tdk:

Template Development Kit
************************

Use a 5.0-compatible Template Development Kit (TDK) for context 19.0. It can maintain template metadata, fetch server content, generate test contexts, package templates and render locally with the same ``dsw-templating`` engine as the document worker.

Installation
============

Use Python 3.12 or later (below Python 4), or the compatible TDK container, and keep its rendering dependencies aligned with the instance's worker.

.. code-block:: shell

   pip install dsw-tdk
   pip install 'dsw-tdk[all]'

The ``all`` extra adds the optional dependencies of the ``weasyprint``, ``excel`` and ``rdflib-convert`` steps, the ``requests`` template global and the ``pandoc-docx-pagebreakpy`` filter. WeasyPrint also needs Pango, and the ``pandoc`` step needs Pandoc installed on the system.

If you do not have Python locally, use the `datastewardshipwizard/dsw-tdk <https://hub.docker.com/r/datastewardshipwizard/dsw-tdk>`__ Docker image instead. Mount your template project into the container to work with it:

.. code-block:: shell

   docker run --rm datastewardshipwizard/dsw-tdk --help
   docker run --rm -v "$PWD:/home/user/my-template" datastewardshipwizard/dsw-tdk verify my-template

Configuration
=============

Set ``DSW_API_URL`` to the API base of your instance, normally ``https://<instance>/api``, which you can find in the :doc:`About </application/profile/about>` dialog, and ``DSW_API_KEY`` to a permitted :ref:`API key <api-keys>`.
A local untracked ``.env`` or the shared ``~/.dsw-tdk`` configuration can provide these values. Do not commit credentials.

* ``dsw-tdk config init`` creates the shared configuration and ``config edit`` opens it.
* ``dsw-tdk config dot-env`` creates a ``.env`` file for a template project.
* ``dsw-tdk config check`` shows the configuration that can be loaded.
* ``--dot-env``, ``--no-dot-env`` and ``--no-config`` change which sources are loaded.

Run ``dsw-tdk --help`` and a command's ``--help`` for options in your installed compatible version.

Template workflow
=================

* ``new`` starts a local template project.
* ``list`` lists available templates; ``--released-only`` and ``--drafts-only`` narrow the list.
* ``get`` downloads a template by its ``<id>:<version>`` reference.
* ``verify`` validates local template metadata.
* ``put`` uploads the template; ``--watch`` keeps uploading local changes.
* ``package`` creates an importable ZIP; ``unpackage`` extracts one.
* ``pot`` extracts translatable messages.

.. code-block:: shell

   dsw-tdk get dsw.questionnaire-report:2.17.0 my-template
   dsw-tdk verify my-template
   dsw-tdk put my-template --watch

``put`` compares the template's ``metamodelVersion`` with the server. It warns about an older compatible minor version and refuses any other mismatch.

Get a real context
==================

.. code-block:: shell

   dsw-tdk get-context --project PROJECT_UUID --output context.json
   dsw-tdk get-context --km-editor EDITOR_UUID --output editor-context.json
   dsw-tdk validate-context context.json editor-context.json

Use exactly one source per get-context command. ``--event`` can select a project event when used with ``--project``. The file is saved as the server sent it. The command fails when the server's context metamodel differs from the TDK's, so use the TDK version matching the server.

``validate-context`` checks files against the 19.0 schema and their own knowledge model, including reply paths and values, files, labels, phase, version and hash. It exits with code 1 on any error. ``--fix-hash`` rewrites a hash that does not match the content.

Generate test contexts
======================

.. code-block:: shell

   dsw-tdk generate-context --sample --profile minimal --profile edge --output contexts
   dsw-tdk generate-context --km-bundle model.km --profile typical --count 3 --seed 42 --output contexts
   dsw-tdk validate-context contexts/*.json

Use exactly one input: ``--sample`` (the knowledge model shipped with the TDK), ``--km-bundle`` (a ``.km`` or ``.km.gz`` file), ``--km-package`` (a package on the server) or ``--from`` (an existing context).

* ``--profile`` is one of ``empty``, ``minimal``, ``typical``, ``full`` and ``edge``, and can be repeated.
* ``--count`` sets the variants per profile.
* ``--seed`` and ``--now`` make the output reproducible.
* ``--source`` chooses a ``project`` or ``km-editor`` context.
* ``-D KEY=VALUE`` sets a ``config`` value: ``clientUrl``, ``appTitle``, ``primaryColor`` or ``logoUrl``.

With ``--from``, ``--mutate`` perturbs the context at the rate of each profile and ``--anonymize`` replaces personal data and free text with deterministic placeholders. Use ``--anonymize`` before sharing a test context taken from real data, and review the result.

Generated data supplements real cases; it does not establish that all questionnaire behavior or template semantics are correct.

Render and compare
==================

.. code-block:: shell

   dsw-tdk render --context context.json --format "HTML Document" --output document.html
   dsw-tdk render --context contexts --all-formats --output output

``--format`` accepts a format's UUID or name and can be omitted if the template has only one. Both ``--context`` and ``--format`` can be repeated, and ``--context`` also accepts a directory of ``*.json`` files.

A batch renders the context/format combinations and writes ``summary.json`` with the status, duration, output and error of each one. The exit code is 1 if any combination fails. Use the result to identify failures and inspect representative outputs for each customer format.

The context must be a complete 19.0 context; otherwise, ``render`` reports the file, JSON path and problem. A hash that does not match the content only produces a warning. ``render`` fills ``document`` as the worker does and always uses the template and format being rendered.

.. list-table::
   :header-rows: 1

   * - Option
     - Use
   * - ``--po``, ``--language``
     - Render with a PO file and set the document language.
   * - ``--project-files``
     - Directory with project files, named by UUID or file name.
   * - ``--preview``/``--final``, ``--event``, ``--document-name``
     - Set the matching ``document`` values.
   * - ``--write-context``
     - Save the rendered context; the file passes ``validate-context``.
   * - ``-D NAME=VALUE``
     - Override a value the worker adds to ``config``, named as in its ``documentContext`` configuration. Its ``DOCUMENT_CONTEXT_*`` environment variables also work.
   * - ``--secret NAME=VALUE``, ``--allow-requests``
     - Provide the ``secrets`` and ``requests`` globals, which exist on the server only when configured for the template.
   * - ``--pandoc-filters``, ``--pandoc-templates``
     - Directories with additional Pandoc filters and templates.

For field changes, see :ref:`document-template-metamodel-versions`. Local/server parity also depends on the deployed conversion tools, fonts and custom rendering extensions.
