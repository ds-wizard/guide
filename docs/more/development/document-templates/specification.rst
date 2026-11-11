.. _document-template-spec:

Document Template Specification
*******************************

Each document template in DSW has metadata. If developing locally with :doc:`./tdk`, you can manage this metadata in ``template.json``. In case of using :doc:`../../../application/document-templates/editors/index`, you can manage it on the **Settings** tab.


Specification Structure
=======================

* ``id`` = identifier of the template without the version (letters, numbers, periods, dashes, and underscores)
* ``version`` = version (semver) in X.Y.Z format where X, Y, and Z are non-negative numbers
* ``name`` = name of the template
* ``description`` = short description of the template
* ``license`` = name of the used license
* ``readme`` = longer description usually containing changelog
* ``metamodelVersion`` = supported version of template metamodel in the ``MAJOR.MINOR`` format, determines which DSW versions can use it
* ``language`` = language of the source strings of the template (defaults to ``en``)
* ``allowedPackages`` = list of package filters (see :ref:`document-template-package-filter`) to specify supported packages
* ``formats`` = list of available formats (see below :ref:`document-template-format`) with specified steps for generation
* ``_tdk`` = TDK configuration for local development (not stored in DSW, see :ref:`tdk-config`)

Tools use ``id:version`` where one reference is required, for example ``dsw.questionnaire-report:2.17.0``.

.. NOTE::

    TDK handles ``readme`` for you, so you can skip it and naturally use ``README.md`` file separately. A template package also contains ``files``, ``assets``, ``createdAt``, and optionally ``updatedAt``, and it does not contain ``_tdk``. The ``dsw-tdk package`` command creates it for you.


.. _document-template-package-filter:

Package Filters
---------------

In a package filter, ``null`` is a wildcard. A filter whose fields are all ``null`` allows all packages.

* ``id``: identifier of knowledge model (e.g. ``myorg.root``)
* ``minVersion``: minimal package version (in format X.Y.Z, inclusive)
* ``maxVersion``: maximal package version (in format X.Y.Z, inclusive)
* ``options``: optional free string pairs, not validated


.. _document-template-format:

Formats
-------

A template can describe how to produce several formats, each with these metadata:

* ``uuid``: UUID of the format (unique within template)
* ``name``: display name of the format
* ``icon``: icon style (CSS classes), preferably `Font Awesome <https://fontawesome.com/v6/search?o=r&m=free>`__, e.g. ``fas fa-file-word``
* ``steps``: list of steps for document worker to produce the document with this format, each step has ``name`` and ``options`` (see :ref:`document-worker-steps`)


.. _document-worker-steps:

Steps
-----

Each step produces output from its options and, where required, the previous step's output. Steps run in order to generate and convert a document. Each step has a ``name`` and ``options``. The document worker supports the following steps:

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


.. _tdk-config:

TDK Config
----------

These local development settings can be kept in a version-controlled ``template.json``. They are not stored in DSW.

* ``version``: metadata version for needs of migrations
* ``readmeFile``: files used to get content for ``readme`` of the template, usually ``README.md``
* ``files``: list of patterns to specify files that are part of the document template (it uses Git wildcard-match patterns, so you can also exclude files or directories). Only those files are available when rendering locally, as on the server.


.. _document-template-metamodel-versions:

Document Template Metamodel Versions
====================================

The following sections describe metamodel changes to the template specification and :doc:`document context<document-context>` so developers can easily update their templates to a newer metamodel version. DSW accepts a template of the same major version and an equal or lower minor version. It does not migrate templates, so a template of an earlier major version has to be ported.

Version 19.0 (since 5.0.0)
--------------------------

* Replaced ``organizationId`` and ``templateId`` of a template with a single ``id`` (``<organizationId>.<templateId>``) and a separate ``version``. In the same way, ``orgId`` and ``kmId`` in package filters are replaced with ``id``; a filter naming only an organization becomes a wildcard, so review it. TDK and import still read the older form and only upgrade the metadata. Jinja templates and step options have to be ported manually.
* A document context now comes from a project or from a knowledge model editor, and contains new ``hash``, ``knowledgeModelEditor``, and ``questionnaire``. The document worker accepts only major version 19, so documents queued before an upgrade have to be regenerated.
* In the JSON-like document context:

  * replies, labels, phase, versions, files, report, and language moved from ``project`` to ``questionnaire``;
  * top-level ``users`` and ``groups`` moved to ``project``, and ``users`` of a group are renamed to ``members``;
  * ``project``, ``knowledgeModelPackage``, and ``document`` may be ``null``;
  * ``document`` has ``documentTemplate``, ``format``, ``preview``, and ``eventUuid``;
  * removed ``organization``, the report's ``uuid`` and timestamps, the package's ``organizationId``, ``kmId``, ``versions``, ``remoteLatestVersion``, and ``organization``, and ``config.appTitleShort`` and ``config.illustrationsColor``;
  * removed ``extras.questionnaire``, use ``extras.project`` (``null`` with empty ``extras.submissions`` for a KM editor).

* In the :ref:`object-oriented document context <document-context-obj>`:

.. list-table::
   :header-rows: 1

   * - 18.x
     - 19.0
   * - ``dc.e``
     - ``dc.km.entities`` (``dc.km.e`` stays)
   * - ``dc.cfg``, ``dc.pkg``, ``dc.doc``
     - ``dc.config``, ``dc.km_package``, ``dc.document``
   * - ``dc.org``, ``dc.organization``
     - Removed, ``dc.config.app_title`` is the closest for a displayed name
   * - ``dc.replies``, ``dc.current_phase``, ``dc.report``
     - ``dc.questionnaire.replies``, ``dc.questionnaire.phase``, ``dc.questionnaire.report``
   * - ``dc.users``, ``dc.groups``
     - ``dc.project.users``, ``dc.project.groups``
   * - ``dc.project.replies``, ``phase``, ``phase_uuid``, ``version``, ``versions``, ``files``, ``language``, ``todos``
     - Same names in ``dc.questionnaire``
   * - ``dc.pkg.id`` (``org:km:version``)
     - ``dc.km_package.id``, the ID alone without the version
   * - ``dc.pkg.org_id``, ``organization_id``, ``km_id``, ``versions``
     - Removed
   * - ``dc.doc.document_template_uuid``, ``format_uuid``
     - ``dc.document.document_template.uuid``, ``dc.document.format.uuid``
   * - ``dc.config.app_title_short``, ``illustrations_color``
     - Removed

Version 18.3 (since 4.35.0)
---------------------------

* Added:

  * ``language`` = new field in template specification, language of the source strings of the template
  * ``language`` and ``locale`` = new fields of ``document`` in document context, see :ref:`odc-document`

Version 18.2 (since 4.33.0)
---------------------------

* Added:

  * ``language`` = new field on Knowledge Model Package and Project objects in document context (see :ref:`document-context`)

Version 18.1 (since 4.31.0)
---------------------------

* Added:

  * ``datetime`` = exposes datetime (https://docs.python.org/3/library/datetime.html) module from Python
  * ``zoneinfo`` = exposes Python's ``zoneinfo`` module

Version 18.0 (since 4.29.0)
---------------------------

* Renamed ``questionnaire`` to ``project``
* Renamed ``package`` to ``knowledgeModelPackage`` (to ``km_package`` in the objectified context)
* Removed ``WidgetIntegration`` and ``ApiLegacyIntegration`` and replaced them with new ``PluginIntegration`` that can be used for both widget and API integrations (and also other types of integrations in the future, e.g., CLI or database integration). If you are using those legacy integrations, you need to rename them to ``PluginIntegration`` and reflect the following changes in the template:
* Removed ``roles``, ``permissions``, and ``sources`` from user object in context
* Value of ``StringReply`` (if value type is ``TextQuestionValueType``) can be now with Markdown syntax. You can use ``markdown_html`` or ``markdown_plain`` helpers to get the value rendered as HTML or plain text, respectively.

Version 17.1 (since 4.26.0)
---------------------------

* Added configurable instance properties for Document Templates, see :ref:`odc-context-config`.

Version 17.0 (since 4.22.0)
---------------------------

* Switched to semantic versioning (``MAJOR.MINOR``) for document template metamodel in order to avoid unnecessary changes in template. For example, template for 17.2 will work with DSW that supports 17.MINOR where MINOR≥2; however, will not work with DSW that supports 17.0 or 17.1. All older versions are considered as MAJOR with MINOR=0.
* Renamed ``ApiIntegration`` to ``ApiLegacyIntegration`` and introduced new ``ApiIntegration``. Added optional ``raw`` field to ``IntegrationReply`` to support the new integration that allows to store response item from API directly.
* Renamed ``props`` to ``variables`` (in all integrations and ``IntegrationQuestion``).
* Updated `WeasyPrint <https://weasyprint.org/>`_ dependency (used in :ref:`document-template-step-weasyprint`) from 60.2 to 66.0 which may cause necessary changes in CSS formatting of HTML in order to produce identical PDF (esp. avoid ``height: 100%`` styling).

Version 16 (since 4.13.0)
-------------------------

* Added validations for value questions.

Version 15 (since 4.12.0)
-------------------------

* Added file question, questionnaire file, and file reply.

Version 14 (since 4.10.0)
-------------------------

* Rearranged and enriched document context for clarity and completeness. If you are using the :ref:`object-oriented document context <document-context-obj>` (via ``to_context_obj``), the changes will not affect you and you can start using new attributes/types; otherwise, you need to reflect the following changes in the passed document context ``ctx``:

  * ``config``, ``knowledgeModel``, ``package``, and ``report`` of context stay the same;
  * ``uuid``, ``createdAt``, and ``updatedAt`` are moved to new ``document`` object that contains additional fields, namely ``createdBy``, ``documentTemplateId``, ``formatUuid``, and ``name``;
  * ``questionnaireUuid`` (and other ``questionnaire*`` fields) and ``createdBy`` are moved to new ``questionnaire`` object where are additional fields, namely ``labels``, ``createdAt``, and ``updatedAt``;
  * ``documentTemplateMetamodelVersion`` is renamed to ``metamodelVersion``;
  * there are new lists ``users`` and ``groups`` containing the information about sharing and permissions of the project (i.e. what users have access to the project and with what permissions).

* Added item select questions.
* Added resource collections and pages, incl. change in resource page references.

Version 13 (since 4.3.0)
------------------------

* Removed states from templates.

Version 12 (since 4.1.0)
------------------------

* Dropped support of deprecated ``wkhtmltopdf`` (for PDF, ``weasyprint`` is used instead).
* Changed several properties of ``Integration`` and ``IntegrationReply`` to optional (see :ref:`document-context`).

Version 11 (since 3.20.0)
-------------------------

* Removed ``recommendedPackageId`` from template metadata and ``shortName`` together with ``color`` from formats.

Version 10 (since 3.12.0)
-------------------------

* New possible value types for value questions: ``DateTimeQuestionValueType``, ``TimeQuestionValueType``, ``EmailQuestionValueType``, ``UrlQuestionValueType``, and ``ColorQuestionValueType`` (no changes needed in existing KM-specific templates).

Version 9 (since 3.10.0)
------------------------

* If you are using integration object, the ``requestItemUrl`` is changed to ``itemUrl``.
* Integrations now have type, where the new Widget Integration has different fields than API Integration (see schema).

Version 8 (since 3.8.0)
-----------------------

* Annotations and integration HTTP headers are changed from dict-like object with string-string key and value to a list of string-string tuples. Be aware that now there can be more values with the same "key" but that is usually unlikely.

Version 7 (since 3.7.0)
-----------------------

* Added description and project tags to the questionnaire object (if you do not need them, nothing has to be changed in the template).

Version 6 (since 3.6.0)
-----------------------

* Integration item template replaced item name. In templates you probably need to rename for integrations the property ``itemUrl`` to ``responseItemUrl``.

Version 5 (since 3.5.0)
-----------------------

* All KM entities now have annotations (key-value dictionary). If you do not want to use those in your template, no changes are required.

Version 4 (since 3.2.0)
-----------------------

* Levels are renamed into phases and are using UUIDs. Phases are as part of the KM in ``knowledgeModel.entities`` of the context.
* Metrics are now also identified by UUID and part of the KM.

Version 3 (since 2.12.0)
------------------------

* Additional metadata about each reply has been added and structure of reply is changed (extra ``.value`` needed). In case you are using filters such as ``reply_str_value`` no changes are needed.
* For integration reply, the type values are renamed ``IntegrationValue`` -> ``IntegrationType`` and ``PlainValue`` -> ``PlainType`` for consistency.

Version 2 (since 2.6.0)
-----------------------

* Changed ``questionnaireReplies`` to use path-reply map and removed then redundant ``questionnaireRepliesMap`` from document context.
* Replies for list of items question represented as list of UUIDs instead of size used for numeric indexing.

Version 1 (since 2.5.0)
-----------------------

* Initial version of metamodel, introduced in DSW 2.5.0 as start of versioning.
