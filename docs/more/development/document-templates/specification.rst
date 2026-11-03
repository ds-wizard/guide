Document template specification
*******************************

The local TDK project and an exported template bundle describe their template in ``template.json``. They share the 5.0 identity model, but local TDK configuration is not stored as template metadata in the application.

Identity and metadata
=====================

* ``id``: template identifier, without the version.
* ``version``: semantic version of the template.
* ``name``, ``description``, ``license``, ``language`` and ``readme``: display and authoring metadata.
* ``metamodelVersion``: ``19.0`` for the document context supported by this release.
* ``allowedPackages``: knowledge-model compatibility patterns.
* ``formats``: supported output formats and their generation steps.

The former ``organizationId`` and ``templateId`` fields are replaced by one identifier. Existing bundles can be migrated, but custom template code still needs porting to context 19.0.

Package patterns
================

A pattern has ``id``, ``minVersion`` and ``maxVersion``. Null values leave the corresponding constraint unrestricted. The identifier and version range are separate; there is no ``orgId`` filter.
Review a migrated organization-only pattern because it can become an unrestricted identifier pattern.

.. code-block:: json

   {
     "id": "example.research-plan",
     "minVersion": "1.0.0",
     "maxVersion": null
   }

Formats and steps
=================

A format has a UUID, display ``name``, ``icon`` and ordered ``steps``. Each step has ``name`` and ``options``.
The application also uses format names in document-submission configuration, so review that configuration when renaming a format.

Generation steps
----------------

The following references describe the available generation and conversion steps. Additional system tools or optional rendering extras may be required for particular formats.

.. toctree::
   :maxdepth: 1

   steps/archive
   steps/enrich-docx
   steps/excel
   steps/jinja
   steps/json
   steps/pandoc
   steps/rdflib-convert
   steps/weasyprint

Local TDK configuration
=======================

The ``_tdk`` section can configure the TDK metadata version, README source file and included-file patterns. Keep it with your local project; it is not a server-side template setting.
Use ``dsw-tdk verify`` and ``dsw-tdk package`` to validate and package the project.
