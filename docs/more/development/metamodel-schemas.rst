Metamodels and schemas
**********************

DSW 5.0 uses knowledge-model metamodel 20 and document-template/document-context metamodel 19.0.
A stable knowledge-model metamodel number does not mean that every surrounding API or content-identifier field remains unchanged.

Current model reference
=======================

The compatible ``dsw-models`` package defines the wire models and can generate JSON Schema 2020-12 for knowledge-model bundles, compiled knowledge models, template metadata and document contexts.
Use the schema/model version matching the deployed application and tools.

.. code-block:: python

   import json
   from dsw.models import schemas

   schema = schemas.document_context_schema()
   print(json.dumps(schema, indent=2))

The schema module also provides ``knowledge_model_bundle_schema``, ``knowledge_model_schema`` and ``template_json_schema``.
For template metadata, distinguish the local descriptor from a packaged bundle when choosing the schema.

See the `model/schema source <https://github.com/ds-wizard/engine-tools/blob/6c159fa862b381890c6a1464be846df4f57fd387/packages/dsw-models/dsw/models/schemas.py>`__ and :doc:`/more/development/document-templates/document-context` for current field names.
Validation catches structural errors; it is not a substitute for rendering and checking the intended document output.
