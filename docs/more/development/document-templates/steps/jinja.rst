.. _document-template-step-jinja:

Step: ``jinja``
***************

Renders requested Jinja2 template with document context and optionally other data.

Input
=====

If not used as a first step, then the previous document is available from ``document`` variable.

Output
======

Results to a file of specified type (via ``content-type`` option) and file extension (via ``extension`` option).

Options
========

-  ``template`` = path to template file to be rendered
-  ``content-type`` = MIME type of resulting file
-  ``extension`` = file extension for the produced file (without leading dot)

Optional:

-  ``jinja-ext`` = comma-separated list of `Jinja2 extensions <https://jinja.palletsprojects.com/en/stable/extensions/>`__ to be enabled (supported values: ``debug``)
-  ``extras`` = comma-separated list of related entities to query in addition to :doc:`../document-context` (possible values: ``submissions``, ``project``); values will be added to ``extras`` attribute of the document context
-  ``policy.*`` = `Jinja2 policies <https://jinja.palletsprojects.com/en/stable/api/#policies>`__: ``policy.truncate.leeway``, ``policy.urlize.rel``, ``policy.urlize.target``, ``policy.urlize.extra_schemes``, and ``policy.json.dumps_kwargs.<name>``

The ``i18n-dir``, ``i18n-domain``, and ``i18n-lang`` options were removed and are ignored, see :ref:`document-template-translations`.

Template (Jinja2)
=================

Variables
---------

The following variables are set:

-  ``ctx`` = contains JSON-like plain :doc:`../document-context` (possibly with ``extras`` attribute, if configured)
-  ``secrets`` = dictionary of secret values, only if enabled by configuration file
-  ``requests`` = wrapper of `requests <https://requests.readthedocs.io/en/latest/>`__ module only if enabled by configuration file
-  ``datetime`` = Python `datetime <https://docs.python.org/3/library/datetime.html>`__ module
-  ``zoneinfo`` = Python `zoneinfo <https://docs.python.org/3/library/zoneinfo.html>`__ module
-  ``json`` = Python `json <https://docs.python.org/3/library/json.html>`__ module
-  ``rdflib`` = `RDFLib <https://rdflib.readthedocs.io/>`__ module if installed

The ``requests`` wrapper allows only ``http`` and ``https`` URLs. Hosts resolving to private, loopback, or link-local addresses are rejected unless allowed by the ``security`` configuration of the document worker. TLS verification cannot be disabled, the timeout cannot be extended, and redirects are limited and checked. Credentials are dropped when a redirect points to another host.

Functions
---------

There are the following functions available on the global.

``assets``
~~~~~~~~~~

The ``assets(file)`` function serves to retrieve Asset object from either a static file in a document template or a questionnaire file. Therefore, the `file` argument can be one the three following:

- ``string`` value with path to asset file within the template (relative from its root), e.g. ``"assets/logo.png"``;
- :ref:`odc-project-file` object from :ref:`document-context-obj`, e.g. from reply to a File Question passing file from it simply as ``reply.file``;
- ``dict`` representing a questionnaire file retrieved from regular :ref:`document-context`, i.e. an item of the ``ctx['questionnaire']['files']`` list.

As a result you get either ``Asset`` object as described below or ``None`` in case no such asset is found.

.. code-block:: jinja
  :caption: Example of using ``assets`` function with static template file

  {%- set asset = assets("assets/logo.png") -%}
  {%- if asset and asset.is_image -%}
    <img src="{{ asset.data_url }}" alt="Our logo" />
  {%- endif -%}


.. code-block:: jinja
  :caption: Example of using ``assets`` function with :ref:`document-context-obj`

  {%- set dc = ctx|to_context_obj -%}
  {# Get the file from the questionnaire files using the reply.file UUID #}
  {%- set file = dc.questionnaire.files[reply.file.uuid] -%}
  {%- set asset = assets(file) -%}
  {%- if file and asset and asset.is_image -%}
    <img src="{{ asset.data_url }}" alt="{{ asset.name }}" />
  {%- elif file -%}
    <p>Questionnaire file {{ file.name }} ({{ file.uuid }}) is not an image.</p>
  {%- else -%}
    <p>Questionnaire file does not exist.</p>
  {%- endif -%}


.. code-block:: jinja
  :caption: Example of using ``assets`` function with :ref:`document-context`

  {%- for ctxFile in ctx.questionnaire.files -%}
    {%- set asset = assets(ctxFile) -%}
    {%- if asset and asset.is_image -%}
      <img src="{{ asset.data_url }}" alt="{{ asset.name }}" />
    {%- elif asset -%}
      <p>Questionnaire file {{ asset.name }} ({{ asset.uuid }}) is not an image.</p>
    {%- else -%}
      <p>Questionnaire file not found.</p>
    {%- endif -%}
  {%- endfor -%}


Every ``Asset`` object returned by ``assets()`` function has the following attributes:

- ``uuid`` - UUID of the asset
- ``name`` - original name (file name)
- ``content_type`` - MIME type
- ``data`` - data stored as bytes
- ``data_base64`` - base64-encoded data
- ``data_url`` - data URL (convenient for use in `<img>` tags)
- ``is_image`` - boolean flag indicating if the asset is an image


Filters
-------

Within Jinja templates, you can use so-called `filters <https://jinja.palletsprojects.com/en/stable/templates/#filters>`__. Basically, those are functions applied to a first argument using pipe ``|`` symbol.

Builtin Filters
~~~~~~~~~~~~~~~

There are several widely used `builtin filters <https://jinja.palletsprojects.com/en/stable/templates/#builtin-filters>`__ directly in Jinja.

Value Conversion
~~~~~~~~~~~~~~~~

We provide several filters that can be used for conversion of values:

- ``datetime_format`` = *Formats timestamp*

  - Example: ``x.created_at|datetime_format("%d/%m/%y")``
  - Arguments:

    -  ``iso_timestamp`` - ``datetime`` or ISO 8601 ``str``
    -  ``fmt`` - datetime format passed to `strftime <https://docs.python.org/3/library/datetime.html#datetime.date.strftime>`__
    -  ``tz`` (optional) - timezone name (e.g. ``"UTC"``, ``"Europe/Prague"``) for formatting the timestamp; if not provided, UTC is used

- ``of_alphabet`` = *Converts integer to characters*

  - Example: ``x|of_alphabet``
  - It prints ``a`` (for 0) to ``z`` and then continues with ``aa``, ``ab``, etc.
  - Arguments:

    -  ``n`` - integer >= 0, usually some index

- ``roman`` = *Converts integer to Roman numeral*

  - Example: ``x|roman``
  - Arguments:

    -  ``n`` - integer >= 0, usually some index

- ``markdown`` = *Converts markdown to HTML*

  - Example: ``x|markdown``
  - The result is sanitized by default because Markdown may contain raw HTML. Scripting, embedded content, stylesheets, and URLs with unexpected schemes are removed. Use ``x|markdown(sanitize=false)`` only for content fully controlled by the document template, never for user input.
  - Arguments:

    -  ``md_text`` - string containing Markdown syntax
    -  ``sanitize`` (optional) - whether the resulting HTML is sanitized (default: ``True``)

- ``bytesize_format`` = *Formats number of bytes*

  - Example: ``file.size|bytesize_format``

- ``dot`` = *Ends sentence if not already ended*

  - Example: ``"This sentence has no end"|dot``
  - Arguments:

    -  ``text``


- ``extract`` = *Extracts values from object by having keys*

  - Example: ``entities.questions|extract([uuid1, uuid2, uuid3])``
  - Arguments:

    -  ``obj`` - object for getting values (typically ``dict``)
    -  ``keys`` - list of keys to retrieve


Reply Helpers
~~~~~~~~~~~~~

These filters are handy when you need to work with ``repliesMap`` from the plain JSON-like context.

- ``reply_path`` = *Joins list of UUIDs into a path*

  - Example: ``[uuid1, uuid2, uuid3]|reply_path``
  - Arguments:

    -  ``uuids`` - list of UUIDs

- ``find_reply`` = *Tries to find a reply value using a path*

  - Example: ``replies|find_reply(path, "list")``
  - Arguments:
    -  ``replies`` - dict with replies
    -  ``path`` - list of UUIDs or path-string
    -  ``cast_type`` (optional) - desired type of return value (``"string"``, ``"int"``, ``"float"``, ``"list"``)

- ``reply_str_value`` = *Extracts string value from a reply if possible*

  - Returns an empty string if not possible to extract it from the reply. Suitable for ``AnswerReply``, ``StringReply`` and ``IntegrationReply``.
  - Example: ``reply|reply_str_value``
  - Arguments:
    -  ``reply`` - object that might be a reply

- ``reply_int_value`` = *Extracts integer value from a reply if possible*

  - Returns zero if not possible to extract it from the reply. Suitable for ``StringReply`` with numeric value type.
  - Example: ``reply|reply_int_value``
  - Arguments:

    -  ``reply`` - object that might be a reply

- ``reply_float_value`` = *Extracts float value from a reply if possible*

  - Returns zero if not possible to extract it from the reply. Suitable for ``StringReply`` with numeric value type.
  - Example: ``reply|reply_float_value``
  - Arguments:

    -  ``reply`` - object that might be a reply

- ``reply_items`` = *Extracts list of strings from a reply if possible*

  - Returns empty list if not possible to extract it from the reply. Suitable for ``MultiChoiceReply`` and ``ItemListReply``.
  - Example: ``reply|reply_items``
  - Arguments:

    -  ``reply`` - object that might be a reply

Special
~~~~~~~

These filters are more complex and add various support to template development.

- ``to_context_obj`` = *Converts plain context to well-defined objects*

  - This filter is used for easier transition and might be removed in the future.
  - Arguments:

    -  ``ctx`` - plain JSON-like document context

- ``jinja2`` = *Renders a string as a Jinja template*

  - Example: ``"Hello {{ name }}"|jinja2({"name": "Alice"})``
  - Arguments:

    -  ``template_str`` - string with the template
    -  ``variables`` (optional) - dictionary with variables
    -  ``fail_safe`` (optional) - return an empty string instead of failing (default: ``False``)

- ``error`` = *Stops generating the document with an error message*

  - Example: ``"This template needs a project"|error``
  - Arguments:

    -  ``message`` - error message
    -  ``title`` (optional) - error title


Tests
-----

Within Jinja templates, you can use so-called `tests <https://jinja.palletsprojects.com/en/stable/templates/#tests>`__. Basically, those are helpers usable in conditions after ``is`` keyword:

.. code:: jinja

   {% if loop.index is divisibleby 3 %}
       {# ... #}
   {% endif %}


Builtin Tests
~~~~~~~~~~~~~

There are several widely used `builtin tests <https://jinja.palletsprojects.com/en/stable/templates/#builtin-tests>`__ directly in Jinja.

Custom Tests
~~~~~~~~~~~~

- ``not_empty`` = *Checks if size of a collection is higher than 0*

  - Example: ``items is not_empty``

- ``of_type`` = *Checks if an object is instance of a certain type / class*

  - The name must be a string; however, it is case-insensitive. It also checks all superclasses.
  - Example: ``parent is of_type "ListQuestion"``


Replies Extraction
------------------

You can use the ``extract_replies`` filter to extract replies easily while using KM annotations. Version ``1`` stays the default, prefer version ``2`` in new templates.

With default configuration, you should use ``json.key`` annotation on chapters and questions and ``json.value`` annotation on answers and choices to easily extract replies from the document context:

.. code:: jinja

    {%- set dc = ctx|to_context_obj -%}
    {%- set object = dc|extract_replies({'version': '2'}) -%}
    {{ object.dataset.title._value }}

The given configuration replaces the respective values of the defaults:

.. code:: jinja

    {%- set dc = ctx|to_context_obj -%}
    {%- set config = {
        'variant': 'simple',
        'version': '1',
        'annotations': {
            'key': 'json.key',
            'value': 'json.value',
        },
        'options': {
            'include_reply_objects': False,
        },
    } -%}
    {%- set object = dc|extract_replies(config) -%}
    {{ object|tojson(indent=2) }}

The result is a dictionary keyed by the ``json.key`` annotations, nested as follows:

- A chapter with a key is an object under that key. The questions of a chapter without a key are in the result itself.
- The follow-up questions of the selected answer are in the object of the options question. If the options question has no key, they are in the object that holds it.
- List and multi-choice questions are lists, and the item questions of a list are in the object of each item.
- Questions without a key are left out. A list question without a key leaves out all its item questions (a warning is logged).
- Two questions with the same key in one object overwrite each other (a warning is logged).

The objects have the following fields, which use underscored names to avoid conflicts with the annotations:

.. list-table::
   :header-rows: 1

   * - Question
     - Version 1
     - Version 2 adds
   * - value
     - ``_value`` (the string reply), ``_path``
     - ``_value`` is a number for number questions
   * - integration
     - ``_value``, ``_raw`` (not for plain replies), ``_path``
     -
   * - options
     - ``_uuid``, ``_label``, ``_value`` (from ``json.value``), ``_path`` of the question
     -
   * - multi-choice
     - List of ``_uuid``, ``_label``, ``_value``, ``_path`` per choice
     -
   * - list
     - List of ``_uuid``, ``_path`` of the list question per item
     - ``_value`` (item UUID), ``_label`` (item title), ``_path`` of the item
   * - item select
     - ``_uuid``, ``_label``, ``_path``
     - ``_value`` (item UUID)
   * - file
     - ``_uuid``, ``_name``, ``_size``, ``_content_type``, ``_url``, ``_path``
     - ``_value`` (file UUID)

With the ``include_reply_objects`` option, each object has ``_reply``. For list and multi-choice questions, each item and each choice has it.

In version ``1``:

- An unanswered question is ``None`` (lists and multi-choice questions are ``[]``) and the follow-ups of unselected answers are absent, so a path through an unanswered question fails.
- ``json.value`` is converted loosely: ``true`` and ``false`` in any case to booleans, and anything Python's ``int()`` or ``float()`` accepts to a number (``007`` becomes ``7``).

In version ``2``:

- Every annotated question is present. Unanswered ones are objects with ``_value`` set to ``None`` (lists and multi-choice questions are ``[]``), and the follow-ups of unselected answers are added in the same way, so any path along the knowledge model is safe.
- ``json.value`` is converted only if it is exactly ``true``, ``false``, or a plain integer without leading zeros. Everything else stays a string.


.. _document-template-translations:

Translations
============

A document template can be translated without releasing a new version. The ``language`` of the template declares the language of its source strings, and each translation is uploaded as a document template locale (a PO file). Language is then a parameter of document generation, so one format can produce documents in several languages.

Mark strings using the `Jinja2 i18n extension <https://jinja.palletsprojects.com/en/stable/extensions/#i18n-extension>`__, which is always enabled:

.. code:: jinja

    {# TRANSLATORS: heading of the first chapter #}
    <h1>{% trans %}Introduction{% endtrans %}</h1>

    {{ _('Data Management Plan') }}
    {{ ngettext('%(num)d answer', '%(num)d answers', answers|length) }}
    {{ pgettext('menu', 'Open') }}

``{% trans %}`` blocks are always trimmed, so re-indenting a template does not orphan its translations. Use ``{% trans notrimmed %}`` where the whitespace matters, for example in ``<pre>`` or a plain-text format.

The document worker generates a POT file after a document template is released or imported. We can also create it locally using ``dsw-tdk pot``. Only files with the ``.j2``, ``.jinja``, ``.jinja2``, or ``.jnj`` extension are scanned. DSW reads the locale code from the ``Language`` header of the uploaded PO file, so that header must be filled in correctly. If a locale cannot be downloaded or is corrupt, document generation fails.

To migrate a template that used the removed options, drop ``jinja-ext``, ``i18n-dir``, ``i18n-domain``, and ``i18n-lang``, merge the per-language formats into one format per output type, and set ``language`` of the template. Then release the template, download the POT file, and upload the existing catalogs as locales.


Notes
=====

-  All paths (e.g. for ``import`` or ``extends`` in Jinja2 templates are relative from the template root, i.e. directory with ``template.json``).
-  The ``do``, ``loopcontrols``, and ``i18n`` `Jinja2 extensions <https://jinja.palletsprojects.com/en/stable/extensions/>`__ are always enabled.
-  Using file extension ``.j2`` or ``.jinja2`` for templates is just a convention.
-  The :doc:`document context <../document-context>` is provided in ``ctx`` variable, other variables, filters, and tests are documented in other documents.

Example
========

.. code:: json

   {
     "name" : "jinja",
     "options" : {
       "template" : "src/default.html.j2",
       "content-type" : "text/html",
       "extension" : "html"
     }
   }
