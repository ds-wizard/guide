.. _document-context:

Document context 19.0
*********************

The document context contains the data used to render a document. DSW 5.0 uses metamodel 19.0 for project documents and knowledge-model-editor previews.
A context has exactly one source: a project or a knowledge model editor. Its questionnaire data is represented the same way in both modes.

Raw JSON and object model
=========================

The raw JSON is available to a Jinja template as ``ctx``. For the linked Python object model, use:

.. code-block:: jinja

   {%- set x = ctx|to_context_obj -%}
   {{ (x.project.name if x.project else x.km_editor.name) }}

The JSON uses camelCase names, such as ``knowledgeModelEditor`` and ``knowledgeModelPackage``. The object model uses snake_case, including ``x.km_editor`` and ``x.km_package``.
Do not interchange raw-JSON field names with object-model attributes.

Main parts
==========

* ``hash`` identifies the context content.
* ``workspace`` contains server-supplied metadata retained in the shared context format.
* ``project`` or ``knowledgeModelEditor`` contains the source metadata; exactly one is set.
* ``questionnaire`` holds replies, phase, files, language, history-related content and the report.
* ``knowledgeModel`` is the compiled questionnaire model.
* ``knowledgeModelPackage`` is the released package metadata when applicable; it can be null for a new editor.
* ``document`` is null in a fetched context and is filled for rendering.
* ``config`` contains effective branding and rendering configuration.

Guard source-specific template code before using it:

.. code-block:: jinja

   {% if x.project %}
     {{ x.project.name }}
   {% elif x.km_editor %}
     {{ x.km_editor.name }}
   {% endif %}

Migrating object-model code from 18.x
=====================================

.. list-table::
   :header-rows: 1

   * - Earlier attribute
     - 19.0 object-model attribute
   * - ``x.e``
     - ``x.km.entities`` (``x.km.e`` remains an alias).
   * - ``x.cfg``, ``x.pkg``, ``x.doc``
     - ``x.config``, ``x.km_package``, ``x.document``.
   * - ``x.replies``, ``x.current_phase``, ``x.report``
     - ``x.questionnaire.replies``, ``x.questionnaire.phase``, ``x.questionnaire.report``.
   * - ``x.users``, ``x.groups``
     - ``x.project.users``, ``x.project.groups``; guard the project source.
   * - Questionnaire fields previously on ``x.project``
     - Use the corresponding fields on ``x.questionnaire``.
   * - ``x.org`` / ``x.organization``
     - Removed; use the configuration data appropriate to the intended output.
   * - A composed package identifier containing the version
     - Use ``x.km_package.id`` and ``x.km_package.version`` separately.
   * - Document template/format identity shortcuts
     - Use ``x.document.document_template`` and ``x.document.format``.

The `complete current object reference <https://github.com/ds-wizard/engine-tools/blob/6c159fa862b381890c6a1464be846df4f57fd387/packages/dsw-templating/support/DocumentContext.md>`__ describes the entity graph, attributes and examples for 19.0. Its older class diagram is not authoritative for the new structure.

Fetch and validate a context
============================

The API provides ``GET /projects/{uuid}/document-context`` (optionally ``eventUuid``) and ``GET /knowledge-model-editors/{uuid}/document-context``.
An unknown historical project event returns not found. A template must handle both project and editor contexts where it is offered for those uses.

Use the :doc:`/more/development/document-templates/tdk` commands to fetch, validate, generate and render contexts. Validation and a metadata version change do not replace checking the semantic output of your template.
