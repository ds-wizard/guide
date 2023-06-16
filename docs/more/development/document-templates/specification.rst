.. _document-template-spec:

Document Template Specification
*******************************

Each document template in |project_name| has metadata stored. If developing locally with :doc:`./tdk`, you can find and manage them  in ``template.json`` file. In case of using :doc:`../../../application/document-templates/editors/index`, you can manage them on **Settings** tab.


Specification Structure
=======================

* ``id`` = composed full ID of the template (``organizationId:templateId:version``)
* ``organizationId`` = identifier of organization developing the template (lowercase, numerics, dot)
* ``templateId`` = identifier of template (lowercase, numerics, dash)
* ``version`` = version (semver) in X.Y.Z format where X, Y, and Z are non-negative numbers
* ``name`` = name of the template
* ``description`` = short description of the template
* ``license`` = name of the used license
* ``readme`` = longer description usually containing changelog
* ``metamodelVersion`` = supported version of template metamodel, it affects with which |project_name| version is can be used
* ``allowedPackages`` = list of package filters (see :ref:`document-template-package-filter`) to specify supported packages
* ``formats`` = list of available formats (see below :ref:`document-template-format`) with specified steps for generation
* ``_tdk`` = TDK configuration for local development (not stored in |project_name|, see :ref:`tdk-config`)


.. NOTE::

    TDK handles ``id`` and ``readme`` for you, so you can skip them and naturally use ``README.md`` file separately.


.. _document-template-package-filter:

Package Filters
---------------

For filtering, the ``null`` value serves as wildcard, i.e., filter with all ``null`` values means that all packages are allowed.

* ``orgId``: identifier of organization (e.g. ``myorg``)
* ``kmId``: identifier of knowledge model (e.g. ``root``)
* ``minVersion``: minimal package version (in format X.Y.Z, inclusive)
* ``maxVersion``: maximal package version (in format X.Y.Z, inclusive)


.. _document-template-format:

Formats
-------

A template can describe how to produce several formats, each with these metadata:

* ``uuid``: UUID of the format (within template)
* ``name``: display name of the format
* ``icon``: icon style (CSS classes), preferably `Font Awesome <https://fontawesome.com/v5/search>`__, e.g. ``fas fa-file-word``
* ``steps``: list of steps for document worker to produce the document with this format, each step has ``name`` and ``options`` (see :ref:`document-worker-steps`)


.. _document-worker-steps:

Steps
-----

Each step of template produces output based on its (optional) input and options. Steps can be chained in order to generate the document and eventually transform it. All steps have always ``name`` and ``options`` based on one of the desired step. There are the details for steps supported by the *document worker* component:

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
    steps/wkhtmltopdf


.. _tdk-config:

TDK Config
----------

Those are local-only metadata used for development of the template. You can use them in versioned ``template.json`` but those are never stored directly in |project_name|.

* ``version``: metadata version for needs of migrations
* ``readmeFile``: files used to get content for ``readme`` of the template, usually ``README.md``
* ``files``: list of patterns to specify files that are part of the document template (it uses Git wildcard-match patterns, so you can also exclude files or directories)


Template Metamodels
===================

Here are described the changes in metamodel for template specification as well as :doc:`document context<document-context>` so developers can easily update their templates to a newer metamodel version when needed. It is also possible to check JSON schemas in higher detail, see :doc:`../metamodel-schemas`.

Version 11 (since 3.20.0)
-------------------------

* Removed ``recommendedPackageId`` from template metadata and ``shortName`` together with ``color`` from formats.

Version 10 (since 3.12.0)
-------------------------

* New possible value types for value questions: ``DateTimeQuestionValueType``, ``TimeQuestionValueType``, ``EmailQuestionValueType``, ``UrlQuestionValueType``, and ``ColorQuestionValueType`` (no changes needed in existing KM-specific templates).

Version 9 (since 3.10.0)
------------------------

* If you are using integration object, the ``requestItemUrl`` is changed to ``itemUrl``.
* Integrations now have type, where the new Widget Integration has a different fields than API Integration (see schema).

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

* All KM entities has now annotations (key-value dictionary). If you do not want to use those in your template, no changes are required.

Version 4 (since 3.2.0)
-----------------------

* Levels are renamed into phases and are using UUIDs. Phases are as part of the KM in ``knowledgeModel.entities`` of the context.
* Metrics are now also identified by UUID and part of the KM.

Version 3 (since 2.12.0)
------------------------

* Additional metadata about each replies has been added and structure of reply is changed (extra ``.value`` needed). In case you are using filters such as ``reply_str_value`` no changes are needed.
* For integration reply, the type values are renamed ``IntegrationValue`` -> ``IntegrationType`` and ``PlainValue`` -> ``PlainType`` for consistency.

Version 2 (since 2.6.0)
-----------------------

* Changed ``questionnaireReplies`` to use path-reply map and removed then redundant ``questionnaireRepliesMap`` from document context.
* Replies for list question represented as list of UUIDs instead of size used for numeric indexing.

Version 1 (since 2.5.0)
-----------------------

* Initial version of metamodel, introduced in |project_name| 2.5.0 as start of versioning.
