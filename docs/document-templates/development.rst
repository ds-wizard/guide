Document Template Development
*****************************


.. TODO::

    There are links to archived DSW repositories

.. NOTE::

    **Requirements for Template Development**

    * Your favorite text editor or IDE
    * DSW Template Development Kit (see below)
    * DSW instance (recommended to have local one) with your admin account
    * Python 3.6+ (with pip) or Docker


DSW Template Development Kit
============================

Our Template Development Kit (TDK) provides a simple way how to work with templates locally. It is a CLI tool written in Python.


Video Tutorial
--------------

This is a comprehensive video tutorial on how to use the DSW Template Development Kit.

.. youtube:: FFElv-e24NE
    :width: 100%
    :align: center


Installation
------------

You can install it easily using `pip <https://pip.pypa.io/en/stable/installation/>`__ from `Python Package Index (PyPI) <https://pypi.org/project/dsw-tdk/>`__. Optionally, you can use virtual environment or other installation option described in the `TDK repository <https://github.com/ds-wizard/engine-tools/tree/develop/packages/dsw-tdk>`__.

.. code-block::

    pip install dsw-tdk
    dsw-tdk --help

It is also possible to use `datastewardshipwizard/dsw-tdk <https://hub.docker.com/r/datastewardshipwizard/dsw-tdk>`__ Docker image when you don’t have Python locally:

.. code-block::

    docker run datastewardshipwizard/dsw-tdk --help

Commands
--------

There are these basic commands:

* ``new`` = create a new template project, it launches a simple interactive wizard for template metadata
* ``list`` = list all templates (latest versions) from configured DSW
* ``get`` = download a template project with specified template ID from DSW
* ``put`` = upload the local template project to DSW (once or continually on-change when ``--watch`` flag is used)
* ``verify`` = check the metadata of the local template project
* ``package`` = create a ZIP distribution package from the local template project (ZIP is importable to DSW via its web interface)

Default template directory is current one for ``put``, ``verify``, and ``package``. But ``new`` and ``get`` will create a new folder according to the template ID if not explicitly set in other way.

You can use ``--help`` to find out details:

.. code-block::

    dsw-tdk new --help

Environment variables and .env file
-----------------------------------

To avoid entering API URL and credentials every time, you can use environment variables:

* ``DSW_API`` = URL of DSW API with which you want to communicate. Hover mouse over your profile name to find the About section where URL is specified.
* ``DSW_USERNAME`` = your login (email address) to that DSW instance, must be administrator account
* ``DSW_PASSWORD`` = corresponding password

To make this even easier, you can store those in ``.env`` file in the project root and it will be loaded automatically. Or you can specify the path to a ``.env`` file:

.. code-block::

    dsw-tdk --dot-env /path/to/.env list

Template Metadata
=================

Each document template in DSW has metadata stored in ``template.json`` file:

.. TODO::

    Add links to Package Filter, Format and TDK Config

* ``id`` = composed full ID of the template (``organizationId:templateId:version``)
* ``organizationId`` = identifier of organization developing the template (lowercase, numerics, dot)
* ``templateId`` = identifier of template (lowercase, numerics, dash)
* ``version`` = version (semver) in X.Y.Z format where X, Y, and Z are non-negative numbers
* ``name`` = name of the template
* ``description`` = short description of the template
* ``license`` = name of the used license
* ``readme`` = longer description usually containing changelog
* ``metamodelVersion`` = supported version of template metamodel, it affects with which DSW version is can be used
* ``recommendedPackageId`` = identifier of recommended package (if any, null otherwise)
* ``allowedPackages`` = list of package filters (see below Package Filter) to specify supported packages
* ``formats`` = list of available formats (see below Format) with specified steps for generation
* ``_tdk`` = TDK configuration for local development (not stored in DSW, see below TDK Config)

DSW TDK handles ``id`` and ``readme`` for you, so you can skip then and naturally use ``README.md`` file separately.

Package Filter
--------------

For filtering, the ``null`` value serves as wildcard, i.e., filter with all ``null`` values means that all packages are allowed.

* ``orgId``: identifier of organization (e.g. ``dsw``)
* ``kmId``: identifier of knowledge model (e.g. ``root``)
* ``minVersion``: minimal package version (in format X.Y.Z, inclusive)
* ``maxVersion``: maximal package version (in format X.Y.Z, inclusive)

Format
------

A template can describe how to produce several formats, each with these metadata:

.. TODO::

    Add link to Steps

* ``uuid``: UUID of the format (within template)
* ``name``: display name of the format
* ``shortName``: short name (ideally extension) for the format, it can be used for example to be displayed in icons
* ``icon``: icon style (CSS classes), preferably `Font Awesome <https://fontawesome.com/icons?d=gallery>`__, e.g. ``fas fa-file-word``
* ``steps``: list of steps for document worker to produce the document with this format, each step has ``name`` and ``options`` (see below Steps)

TDK Config
----------

Those are local-only metadata used for development of the template. You can use them in versioned ``template.json`` but those are never stored directly in DSW.

* ``version``: metadata version for needs of migrations
* ``readmeFile``: files used to get content for ``readme`` of the template, usually ``README.md``
* ``files``: list of patterns to specify files that are part of the document template (it uses Git’s wildcard-match patterns, so you can also exclude files or directories)


.. _schema-doc-context:

Document Context
================

.. NOTE::

    To work efficiently with the Document Context, you want to use object instead of the JSON-like one. Please read through `DocumentContext.md <https://github.com/ds-wizard/document-worker/blob/develop/support/DocumentContext.md>`__ directly (select different version if needed).

Document context is an object that carries all information related to a DSW questionnaire in order to produce a document. To investigate it, it is the best to use *Questionnaire Report* template with ``JSON`` format. The core fields are:

* ``config`` = object with DSW configuration related to documents, e.g., ``clientUrl`` for referring to the DSW instance
* ``createdAt`` = timestamp when the document was created
* ``createdBy`` = object describing author of the document
* ``knowledgeModel`` = object describing used KM for the questionnaire
    * ``chapterUuids`` = list of UUIDs for chapters
    * ``integrationUuids`` = list of UUIDs for integrations
    * ``tagUuids`` = list of UUIDs for tags
    * ``entities`` = contains ``questions``, ``answers``, and other maps with UUID-entity pairs
    * ``name`` = name of the knowledge model
    * ``uuid`` = UUID of the knowledge model
* ``level`` = current desirability level selected for the questionnaire
* ``levels`` = list of desirability levels possible
* ``metrics`` = list of available metrics
* ``organization`` = object describing organization that runs the DSW instance
* ``package`` = object with metadata about the KM package such as ``version``, ``name``, or ``description``
* ``questionnaireName`` = name of the questionnaire
* ``questionnaireReplies`` = map of replies with path-reply pairs, each reply has ``type`` and ``value``
* ``questionnaireUuid`` = UUID of the questionnaire
* ``report`` = object that contains report for the questionnaire that contains computed information about number of answered questions as well as metric values
* ``updatedAt`` = timestamp when the document was last updated
* ``uuid`` = UUID of the document

Document Worker
===============

.. TODO::

    Check where to link Jinja2 filters, the original link does not work

`Document Worker <https://github.com/ds-wizard/document-worker>`__ component is used for document generation by supplying context to a specific template based on users demands. It retrieves a job to generate document, based on desired template and format it processed the input. This processing may be composed of several steps, usually some generation using Jinja2 and then optionally transformations. For processing Jinja2, we add several custom filters to those builtin directly in Jinja2.

Steps
-----

Each step of template produces output based on its (optional) input and options. For the first step, the input is the document context, for other steps, the output of the previous step is used.

* ``json`` = produces a JSON as simply dump of document context
    * *no options*
* ``jinja2`` = produces a document by supplying document context to specified Jinja2 template and renders it
    * options:
        * ``template`` = path of the template entry file (POSIX style, relative from ``template.json``, e.g. ``template/index.html.j2``)
        * ``content-type`` = resulting content type of the rendered document (e.g. ``text/html``)
        * ``extension`` = file extensions for the rendered document (e.g. ``html``)
* ``pandoc`` = runs `Pandoc <https://pandoc.org/index.html>`__ for automatic conversion between document formats, it must follow the step where document with ``from`` format is created (usually ``jinja2`` step)
    * options:
        * ``from`` = source format according to possibilities of `Pandoc <https://pandoc.org/index.html>`__, e.g. ``html``
        * ``to`` = target format (as above), e.g. ``docx``
* ``wkhtmltopdf`` = runs `wkhtmltopdf <https://wkhtmltopdf.org/>`__ to transform HTML from the previous step to PDF document
    * *no options*
* ``rdflib-convert`` = converts between RDF formats using `rdflib <https://rdflib.readthedocs.io/en/stable/index.html>`__
    * options:
        * ``from`` = source format (one of: ``rdf`` (XML), ``n3``, ``nt``, ``ttl``, ``trig``, ``jsonld``)
        * ``to`` = target format (as above)

Jinja2 filters
--------------

.. NOTE::

    All filters are described in `JinjaFilters.md <https://github.com/ds-wizard/document-worker/blob/develop/support/JinjaFilters.md>`__ (select different version if needed).

To make template development easier, the document worker provides several additional filters:

* ``any`` = check if any value of iterable is true
* ``all`` = check if all values of iterable are true
* ``datetime_format`` = formats datetime given in ISO format according to the given `format string <https://docs.python.org/3/library/datetime.html#strftime-and-strptime-format-codes>`__
* ``extract`` = for object/map and list of keys it returns list of corresponding values from that object/map
* ``of_alphabet`` = transforms a numer to letter of alphabet (e.g. ``0`` to ``a``)
* ``roman`` = transforms given number to Roman numerals
* ``markdown`` = transforms Markdown into HTML
* ``dot`` = ends string with . if it does not already end with it nor is empty
* ``reply_str_value`` = gets string value from given reply (if valid, otherwise empty string)
* ``reply_int_value`` = gets integer value from given reply (if valid, otherwise ``0``)
* ``reply_float_value`` = gets float value from given reply (if valid, otherwise ``0``)
* ``reply_items`` = gets list of items (their UUIDs) from given list-question reply (if valid, otherwise empty list)
* ``reply_path`` = joins given list of UUIDs into reply path

Jinja2 tests
------------

.. NOTE::

    All tests are described in `JinjaTests.md <https://github.com/ds-wizard/document-worker/blob/develop/support/JinjaTests.md>`__ (select different version if needed).

Tests can be used to make if conditions more readable using the ``is`` keyword. Just as in Python.

Graphics and Scripts
====================

If you want to include some graphics or JavaScript, we recommend you to put it directly into the HTML template file. In case of graphics, use ``base64`` encoded content (suitable for smaller images like icons and logos):

.. code-block:: xml

    <img src="data:image/png;base64, iVBORw0KGgoAAAANSUhEUgAAAAUAAAAFCAYAAACNbyblAAAAHElEQVQI12P4//8/w38GIAXDIBKE0DHxgljNBAAO9TXL0Y4OHwAAAABJRU5ErkJggg==" alt="Red dot" />


Alternatively, you can of course reference picture that is accessible online. For JavaScript, again you can put there directly some script or reference it, for example, from some CDN:

.. code-block:: xml

    <style type="text/javascript" src="https://code.jquery.com/jquery-3.3.1.min.js"></style>
    <style type="text/javascript">
        jQuery(".btn").click(function(){
            jQuery(this).toggleClass(".clicked");
        });
    </style>


You can split your template code into multiple files and the use include directive that opens the file and inserts its content where the directive is placed - like we do for including CSS style in HTML template (only one complex HTML file is generated in the end):

.. code-block:: jinja

    <head>
        <title>Data Management Plan</title>
        <meta charset="utf-8">
        <style>{% include "root.css" %}</style>
    </head>


Template Development Procedure
==============================

* Prepare template project locally and run ``dsw-tdk put -fw`` with ``.env`` file prepared for your dev instance.
* Open a project in the DSW dev instance and set default template and format to the one you are going to edit.
* Edit the template as you need and save the changed files (TDK will update the template in dev instance).
* Switch to browser, click "Preview" tab for refresh.
* You will either compiled document or information about error that will help you to fix it.

It is recommended to save and check atomic changes in the templates as it makes it more convenient for eliminating bugs.

Template Metamodels
===================

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

* Initial version of metamodel, introduced in DSW 2.5.0 as start of versioning.


More Info
=========

* Examples
    * `ds-wizard/questionnaire-report-template <https://github.com/ds-wizard/questionnaire-report-template>`__
    * `ds-wizard/madmp-template <https://github.com/ds-wizard/madmp-template>`__
