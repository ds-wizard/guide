.. _jinja-cheatsheet:

Jinja Cheatsheet
****************

We can use Jinja templating language in :guilabel:`Response Item Template` and in :guilabel:`Response Item Template for Selection` (under :guilabel:`Advanced Response Configuration`) fields in DSW. Here you can get a basic overview of what can be achieved with Jinja.

For more information about Jinja templating language, visit the `official Jinja documentation <https://jinja.palletsprojects.com/en/stable/templates/>`_.

Basic Syntax
============

These are the basic Jinja elements:


.. list-table::
   :header-rows: 1

   * - Formatting
     - Jinja Syntax
   * - Variable
     - ``{{ variable }}``
   * - If Statement
     - ``{% if condition %} ... {% endif %}``
   * - If-Else Statement
     - ``{% if condition %} ... {% else %} ... {% endif %}``
   * - For Loop
     - ``{% for item in items %} ... {% endfor %}``
   * - Comment
     - ``{# This is a comment #}``

.. NOTE::

    We can also construct logo and link available in the legacy version of API Integration directly in the Response Item Template.

Whitespace Control
==================

By default, Jinja keeps whitespace (spaces, tabs, newlines) around tags. You can use the ``-`` (dash) modifier inside delimiters to trim or strip it.


.. list-table::
   :header-rows: 1

   * - Formatting
     - Jinja Syntax
   * - Default Behavior
     - ``{% if condition %} ... {% endif %}``
   * - Trim Leading Whitespace
     - ``{%- if condition %} ... {%- endif %}``
   * - Trim Trailing Whitespace
     - ``{% if condition -%} ... {% endif -%}``
   * - Trim Both Sides
     - ``{%- if condition -%} ... {%- endif -%}``
   * - Loop Example
     - ``{% for item in items -%} {{ item }} {%- endfor %}``

.. NOTE::

    Use the ``-`` (dash) inside tag delimiters to remove whitespace. This is particularly helpful when generating compact text or code (e.g., JSON, YAML, Markdown).

Multiline whitespace examples
=============================

Without trimming, the line breaks around a block are kept:

.. code-block:: jinja

   {% if condition %}
     ...
   {% endif %}

A loop can trim the surrounding whitespace while keeping the value expression:

.. code-block:: jinja

   {% for item in items -%}
   {{ item }}
   {%- endfor %}
