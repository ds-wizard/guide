.. _document-template-step-jinja:

Step: ``jinja``
***************

|badge-status| |badge-metamodel|

Renders requested Jinja2 template with document context and optionally other data.

Input
=====

If not used as a first step, then the previous document is available from ``document`` variable.

Output
======

Results to a file of specified type (via ``content-type`` option) and file extension (via ``extension`` option).

Options
=======

-  ``template`` = path to template file to be rendered
-  ``content-type`` = MIME type of resulting file
-  ``extension`` = file extension for the produced file (without leading dot)

Optional:

-  ``jinja-ext`` = comma-separated list of `Jinja2 extensions <https://jinja.palletsprojects.com/en/3.0.x/extensions/>`__ to be enabled (supported values: ``debug``)
-  ``i18n-dir`` = location (relative to template root) of translations
-  ``i18n-domain`` = domain string of translations
-  ``i18n-lang`` = language code used in the template
-  ``extras`` = comma-separated list of related entities to query in addition to :doc:`../document-context` (possible values: ``submissions``, ``questionnaire``); values will be added to ``extras`` attribute of the document context

Template (Jinja2)
=================

Variables
---------

The following variables are set:

-  ``ctx`` = contains JSON-like plain :doc:`../document-context` (possibly with ``extras`` attribute, if configured)
-  ``secrets`` = dictionary of secret values, only if enabled by configuration file
-  ``requests`` = wrapper of `requests <https://requests.readthedocs.io/en/latest/>`__ module only if enabled by configuration file

Filters
-------

Within Jinja templates, you can use so-called `filters <https://jinja.palletsprojects.com/en/3.0.x/templates/#filters>`__.Basically, those are functions applied to a first argument using pipe ``|`` symbol.

Bultin Filters
~~~~~~~~~~~~~~

There are several widely used `builtin filters <https://jinja.palletsprojects.com/en/3.0.x/templates/#builtin-filters>`__ directly in Jinja.

Value Conversion
~~~~~~~~~~~~~~~~

We provide several filters that can be used for conversion of values:

- ``datetime_format`` = *Formats timestamp*
  
  - Example: ``x.created_at|datetime_format("%d/%m/%y")``
  - Arguments:

    -  ``iso_timestamp`` - ``datetime`` or ISO 8601 ``str``
    -  ``fmt`` - datetime format passed to `strftime <https://docs.python.org/3/library/datetime.html#datetime.date.strftime>`__

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

  - Example: ``x|roman``
  - Arguments:

    -  ``md_text`` - string containing Markdown syntax

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
    -  ``xtype`` (optional) - desired type of return value (``"string"``, ``"int"``, ``"float"``, ``"list"``)

- ``reply_str_value`` = *Extracts string value from a reply if possible*

  - Returns an empty string if not possible to extract it from the reply. Suitable for ``AnswerReply``, ``StringReply`` and ``IntegrationReply``.
  - Example: ``reply|reply_str_value``
  - Arguments:
    -  ``reply`` - object that might a reply

- ``reply_int_value`` = *Extracts integer value from a reply if possible*

  - Returns zero if not possible to extract it from the reply. Suitable for ``StringReply`` with numeric value type.
  - Example: ``reply|reply_int_value``
  - Arguments:

    -  ``reply`` - object that might a reply

- ``reply_float_value`` = *Extracts float value from a reply if possible*

  - Returns zero if not possible to extract it from the reply. Suitable for ``StringReply`` with numeric value type.
  - Example: ``reply|reply_float_value``
  - Arguments:
    
    -  ``reply`` - object that might a reply

- ``reply_items`` = *Extracts list of strings from a reply if possible*

  - Returns empty list if not possible to extract it from the reply. Suitable for ``MultiChoiceReply`` and ``ItemListReply``.
  - Example: ``reply|reply_items``
  - Arguments:

    -  ``reply`` - object that might a reply

Special
~~~~~~~

These filters are more complex and add various support to template development.

- ``to_context_obj`` = *Converts plain context to well-defined objects*

  - This filter is used for easier transition and might be removed in the future.
  - Arguments:

    -  ``ctx`` - plain JSON-like document context


Tests
-----

Within Jinja templates, you can use so-called `tests <https://jinja.palletsprojects.com/en/3.0.x/templates/#tests>`__. Basically, those are helpers usable in conditions after ``is`` keyword:

.. code:: jinja

   {% if loop.index is divisibleby 3 %}
       {# ... #}
   {% endif %}


Bultin Tests
~~~~~~~~~~~~

There are several widely used `builtin tests <https://jinja.palletsprojects.com/en/3.0.x/templates/#builtin-tests>`__ directly in Jinja.

Custom Tests
~~~~~~~~~~~~

- ``not_empty`` = *Checks if size of a collection is higher than 0*

  - Example: ``items is not_empty``

- ``of_type`` = *Checks if an object is instance of a certain type / class*

  - The name must be a string; however, it is case-insensitive. It also checks all superclasses.
  - Example: ``parent is of_type "ListQuestion"``


Notes
=====

-  All paths (e.g. for ``import`` or ``extends`` in Jinja2 templates are relative from the template root, i.e. directory with ``template.json``).
-  The ``do`` `Jinja2 extension <https://jinja.palletsprojects.com/en/3.0.x/extensions/#expression-statement>`__ is enabled.
-  Using file extension ``.j2`` or ``.jinja2`` for templates is just a convention.
-  The :doc:`document context <../document-context>` is provided in ``ctx`` variable, other variables, filters, and tests are documented in other documents.

Example
=======

.. code:: json

   {
     "name" : "jinja",
     "options" : {
       "template" : "src/default.html.j2",
       "content-type" : "text/html",
       "extension" : "html"
     }
   }

.. |badge-status| image:: https://img.shields.io/badge/status-stable-green
.. |badge-metamodel| image:: https://img.shields.io/badge/metamodel%20version-%E2%89%A5%201-blue
