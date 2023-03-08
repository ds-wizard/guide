*****************
Metamodel Schemas
*****************

As Data Stewardship Wizard evolves, the internal structures may change during the time. To support migration under the hood, we use metamodel versioning for KM and templates.

----

KM Package (.km file)
=====================

File for import and export of Knowledge Models is a JSON file that contains all KM packages (lists of change events with additional metadata). The structure of events is versioned using the KM metamodel version number and migrations in DSW automatically update the KMs when needed. As said, files according to this schema can be exported from :doc:`../../application/knowledge-models/list/index` or :doc:`../../application/knowledge-models/list/detail` and then used for :doc:`../../application/knowledge-models/list/import`.

+-------------------+---------------------------------------------------------------------------------------------------------------+-----------------------------------------+-----------+
| Metamodel Version | Schema file                                                                                                   | Changes (brief)                         | Since DSW |
+===================+===============================================================================================================+=========================================+===========+
| 13                | `JSON Schema <https://github.com/ds-wizard/dsw-schemas/blob/master/schemas/km-package/kmp_schema_v13.json>`__ | New question value types                | 3.12.0    |
+-------------------+---------------------------------------------------------------------------------------------------------------+-----------------------------------------+-----------+
| 12                | `JSON Schema <https://github.com/ds-wizard/dsw-schemas/blob/master/schemas/km-package/kmp_schema_v12.json>`__ | Enhanced integration (e.g. widget type) | 3.10.0    |
+-------------------+---------------------------------------------------------------------------------------------------------------+-----------------------------------------+-----------+
| 11                | `JSON Schema <https://github.com/ds-wizard/dsw-schemas/blob/master/schemas/km-package/kmp_schema_v11.json>`__ | Annotations and timestamps for events   | 3.8.0     |
+-------------------+---------------------------------------------------------------------------------------------------------------+-----------------------------------------+-----------+
| 10                | `JSON Schema <https://github.com/ds-wizard/dsw-schemas/blob/master/schemas/km-package/kmp_schema_v10.json>`__ | Integrations with item template         | 3.6.0     |
+-------------------+---------------------------------------------------------------------------------------------------------------+-----------------------------------------+-----------+
| 9                 | `JSON Schema <https://github.com/ds-wizard/dsw-schemas/blob/master/schemas/km-package/kmp_schema_v9.json>`__  | Annotations                             | 3.5.0     |
+-------------------+---------------------------------------------------------------------------------------------------------------+-----------------------------------------+-----------+
| 8                 | `JSON Schema <https://github.com/ds-wizard/dsw-schemas/blob/master/schemas/km-package/kmp_schema_v8.json>`__  | Metrics and phases are part of KM       | 3.2.0     |
+-------------------+---------------------------------------------------------------------------------------------------------------+-----------------------------------------+-----------+
| 7                 | `JSON Schema <https://github.com/ds-wizard/dsw-schemas/blob/master/schemas/km-package/kmp_schema_v7.json>`__  | KM name attribute removed               | 2.13.0    |
+-------------------+---------------------------------------------------------------------------------------------------------------+-----------------------------------------+-----------+
| 6                 | `JSON Schema <https://github.com/ds-wizard/dsw-schemas/blob/master/schemas/km-package/kmp_schema_v6.json>`__  | Multi-choice question type added        | 2.11.0    |
+-------------------+---------------------------------------------------------------------------------------------------------------+-----------------------------------------+-----------+
| 5                 | `JSON Schema <https://github.com/ds-wizard/dsw-schemas/blob/master/schemas/km-package/kmp_schema_v5.json>`__  | Move event                              | 2.0.0     |
+-------------------+---------------------------------------------------------------------------------------------------------------+-----------------------------------------+-----------+
| 4                 | `JSON Schema <https://github.com/ds-wizard/dsw-schemas/blob/master/schemas/km-package/kmp_schema_v4.json>`__  | Refactored KM, optional chapter text    | 1.10.0    |
+-------------------+---------------------------------------------------------------------------------------------------------------+-----------------------------------------+-----------+
| 3                 | `JSON Schema <https://github.com/ds-wizard/dsw-schemas/blob/master/schemas/km-package/kmp_schema_v3.json>`__  | Changed integration question fields     | 1.8.0     |
+-------------------+---------------------------------------------------------------------------------------------------------------+-----------------------------------------+-----------+
| 2                 | `JSON Schema <https://github.com/ds-wizard/dsw-schemas/blob/master/schemas/km-package/kmp_schema_v2.json>`__  | Changed phases representation           | 1.7.0     |
+-------------------+---------------------------------------------------------------------------------------------------------------+-----------------------------------------+-----------+
| 1                 | `JSON Schema <https://github.com/ds-wizard/dsw-schemas/blob/master/schemas/km-package/kmp_schema_v1.json>`__  | Initial versioned metamodel             | 1.6.0     |
+-------------------+---------------------------------------------------------------------------------------------------------------+-----------------------------------------+-----------+

Document Context
================

Document Context is provided to the document templates by document worker. It contains all relevant data about project/questionnaire with replies, related knowledge model, author, and more. As KM evolves, the context may evolve as well. It is versioned using the Template metamodel version number. A document template must support the metamodel that is in the current DSW instance. It is needed to know how the document context looks like especially for :doc:`./document-templates`.

+-------------------+------------------------------------------------------------------------------------------------------------------------+-----------------------------------------+-----------+
| Metamodel Version | Schema file                                                                                                            | Changes (brief)                         | Since DSW |
+===================+========================================================================================================================+=========================================+===========+
| 11                | `JSON Schema <https://github.com/ds-wizard/dsw-schemas/blob/master/schemas/doc-context/doc_context_schema_v11.json>`__ | Change template metadata                | 3.20.0    |
+-------------------+------------------------------------------------------------------------------------------------------------------------+-----------------------------------------+-----------+
| 10                | `JSON Schema <https://github.com/ds-wizard/dsw-schemas/blob/master/schemas/doc-context/doc_context_schema_v10.json>`__ | New question value types                | 3.12.0    |
+-------------------+------------------------------------------------------------------------------------------------------------------------+-----------------------------------------+-----------+
| 9                 | `JSON Schema <https://github.com/ds-wizard/dsw-schemas/blob/master/schemas/doc-context/doc_context_schema_v9.json>`__  | Enhanced integration (e.g. widget type) | 3.10.0    |
+-------------------+------------------------------------------------------------------------------------------------------------------------+-----------------------------------------+-----------+
| 8                 | `JSON Schema <https://github.com/ds-wizard/dsw-schemas/blob/master/schemas/doc-context/doc_context_schema_v8.json>`__  | Annotations change                      | 3.8.0     |
+-------------------+------------------------------------------------------------------------------------------------------------------------+-----------------------------------------+-----------+
| 7                 | `JSON Schema <https://github.com/ds-wizard/dsw-schemas/blob/master/schemas/doc-context/doc_context_schema_v7.json>`__  | Project tags and description            | 3.7.0     |
+-------------------+------------------------------------------------------------------------------------------------------------------------+-----------------------------------------+-----------+
| 6                 | `JSON Schema <https://github.com/ds-wizard/dsw-schemas/blob/master/schemas/doc-context/doc_context_schema_v6.json>`__  | Integrations with item template         | 3.6.0     |
+-------------------+------------------------------------------------------------------------------------------------------------------------+-----------------------------------------+-----------+
| 5                 | `JSON Schema <https://github.com/ds-wizard/dsw-schemas/blob/master/schemas/doc-context/doc_context_schema_v5.json>`__  | Annotations                             | 3.5.0     |
+-------------------+------------------------------------------------------------------------------------------------------------------------+-----------------------------------------+-----------+
| 4                 | `JSON Schema <https://github.com/ds-wizard/dsw-schemas/blob/master/schemas/doc-context/doc_context_schema_v4.json>`__  | Metrics and phases                      | 3.2.0     |
+-------------------+------------------------------------------------------------------------------------------------------------------------+-----------------------------------------+-----------+
| 3                 | `JSON Schema <https://github.com/ds-wizard/dsw-schemas/blob/master/schemas/doc-context/doc_context_schema_v3.json>`__  | Project versions                        | 2.12.0    |
+-------------------+------------------------------------------------------------------------------------------------------------------------+-----------------------------------------+-----------+
| 2                 | `JSON Schema <https://github.com/ds-wizard/dsw-schemas/blob/master/schemas/doc-context/doc_context_schema_v2.json>`__  | Reply provenance                        | 2.6.0     |
+-------------------+------------------------------------------------------------------------------------------------------------------------+-----------------------------------------+-----------+
| 1                 | `JSON Schema <https://github.com/ds-wizard/dsw-schemas/blob/master/schemas/doc-context/doc_context_schema_v1.json>`__  | Initial versioned metamodel             | 2.5.0     |
+-------------------+------------------------------------------------------------------------------------------------------------------------+-----------------------------------------+-----------+

Template (.json file)
=====================

Each template has its descriptor file ``template.json`` which contains all the information about the template, its format(s) and steps how to produce the document(s). It is also versioned by the Template metamodel version number. This file also contains the actual number of the supported version... With local :doc:`./document-templates`, we will need to manage the file according to the schema; however, when :doc:`../../application/document-templates/editors/index` are used, we will define it using forms directly in DSW.

.. NOTE::

    Between versions 1 and 5, the structure of ``template.json`` is still the same. Only the document context has been changed.

+-------------------+----------------------------------------------------------------------------------------------------------------------------+-----------------------------------------+-----------+
| Metamodel Version | Schema file                                                                                                                | Changes (brief)                         | Since DSW |
+===================+============================================================================================================================+=========================================+===========+
| 11                | `JSON Schema <https://github.com/ds-wizard/dsw-schemas/blob/master/schemas/template-json/template_json_schema_v11.json>`__ | Change template metadata                | 3.20.0    |
+-------------------+----------------------------------------------------------------------------------------------------------------------------+-----------------------------------------+-----------+
| 10                | `JSON Schema <https://github.com/ds-wizard/dsw-schemas/blob/master/schemas/template-json/template_json_schema_v10.json>`__ | New question value types                | 3.12.0    |
+-------------------+----------------------------------------------------------------------------------------------------------------------------+-----------------------------------------+-----------+
| 9                 | `JSON Schema <https://github.com/ds-wizard/dsw-schemas/blob/master/schemas/template-json/template_json_schema_v9.json>`__  | Enhanced integration (e.g. widget type) | 3.10.0    |
+-------------------+----------------------------------------------------------------------------------------------------------------------------+-----------------------------------------+-----------+
| 8                 | `JSON Schema <https://github.com/ds-wizard/dsw-schemas/blob/master/schemas/template-json/template_json_schema_v8.json>`__  | Annotations change                      | 3.8.0     |
+-------------------+----------------------------------------------------------------------------------------------------------------------------+-----------------------------------------+-----------+
| 7                 | `JSON Schema <https://github.com/ds-wizard/dsw-schemas/blob/master/schemas/template-json/template_json_schema_v7.json>`__  | Project tags and description            | 3.7.0     |
+-------------------+----------------------------------------------------------------------------------------------------------------------------+-----------------------------------------+-----------+
| 6                 | `JSON Schema <https://github.com/ds-wizard/dsw-schemas/blob/master/schemas/template-json/template_json_schema_v6.json>`__  | Integrations with item template         | 3.6.0     |
+-------------------+----------------------------------------------------------------------------------------------------------------------------+-----------------------------------------+-----------+
| 5                 | `JSON Schema <https://github.com/ds-wizard/dsw-schemas/blob/master/schemas/template-json/template_json_schema_v5.json>`__  | Annotations                             | 3.5.0     |
+-------------------+----------------------------------------------------------------------------------------------------------------------------+-----------------------------------------+-----------+
| 4                 | `JSON Schema <https://github.com/ds-wizard/dsw-schemas/blob/master/schemas/template-json/template_json_schema_v4.json>`__  | Metrics and phases                      | 3.2.0     |
+-------------------+----------------------------------------------------------------------------------------------------------------------------+-----------------------------------------+-----------+
| 3                 | `JSON Schema <https://github.com/ds-wizard/dsw-schemas/blob/master/schemas/template-json/template_json_schema_v3.json>`__  | Project versions                        | 2.12.0    |
+-------------------+----------------------------------------------------------------------------------------------------------------------------+-----------------------------------------+-----------+
| 2                 | `JSON Schema <https://github.com/ds-wizard/dsw-schemas/blob/master/schemas/template-json/template_json_schema_v2.json>`__  | Reply provenance                        | 2.6.0     |
+-------------------+----------------------------------------------------------------------------------------------------------------------------+-----------------------------------------+-----------+
| 1                 | `JSON Schema <https://github.com/ds-wizard/dsw-schemas/blob/master/schemas/template-json/template_json_schema_v1.json>`__  | Initial versioned metamodel             | 2.5.0     |
+-------------------+----------------------------------------------------------------------------------------------------------------------------+-----------------------------------------+-----------+
