.. _jinja-cheatsheet:
 
Jinja Cheatsheet
****************

We can use Jinja templating language in :guilabel:`Response Item Template` and in :guilabel:`Response Item Template for Selection` (under :guilabel:`Advanced Response Configuration`) fields in |project_name|. Here you can get a basic overview of what can be achieved with Jinja.

For more information about Jinja templating language, visit the `official Jinja documentation <https://jinja.palletsprojects.com/en/stable/templates/>`_.

Basic Syntax
============

These are the basic Jinja elements:

.. raw:: html

    <div class="table-wrapper docutils container">
        <table class="docutils align-default markdown-table">
            <thead>
                <tr>
                    <th>Formatting</th>
                    <th>Jinja Syntax</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>
                        <p>Variable</p>
                    </td>
                    <td class="td-markdown-code">
                        {{ variable }}
                    </td>
                </tr>
                <tr>
                    <td>
                        <p>If Statement</p>
                    </td>
                    <td class="td-markdown-code">
                        {% if condition %} ... {% endif %}
                    </td>
                </tr>
                <tr>
                    <td>
                        <p>If-Else Statement</p>
                    </td>
                    <td class="td-markdown-code">
                        {% if condition %} ... {% else %} ... {% endif %}
                    </td>
                </tr>
                <tr>
                    <td>
                        <p>For Loop</p>
                    </td>
                    <td class="td-markdown-code">
                        {% for item in items %} ... {% endfor %}
                    </td>
                </tr>
                <tr>
                    <td>
                        <p>Comment</p>
                    </td>
                    <td class="td-markdown-code">
                        {# This is a comment #}
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

.. NOTE::

    We can also construct logo and link available in the legacy version of API Integration directly in the Response Item Template. 

Whitespace Control
==================

By default, Jinja keeps whitespace (spaces, tabs, newlines) around tags. You can use the ``-`` (dash) modifier inside delimiters to trim or strip it.

.. raw:: html

    <div class="table-wrapper docutils container">
        <table class="docutils align-default markdown-table">
            <thead>
                <tr>
                    <th>Formatting</th>
                    <th>Jinja Syntax</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>
                        <p>Default Behavior</p>
                    </td>
                    <td class="td-markdown-code">
                        {% if condition %}<br>
                        &nbsp;&nbsp;...<br>
                        {% endif %}
                    </td>
                </tr>
                <tr>
                    <td>
                        <p>Trim Leading Whitespace</p>
                    </td>
                    <td class="td-markdown-code">
                        {%- if condition %} ... {%- endif %}
                    </td>
                </tr>
                <tr>
                    <td>
                        <p>Trim Trailing Whitespace</p>
                    </td>
                    <td class="td-markdown-code">
                        {% if condition -%} ... {% endif -%}
                    </td>
                </tr>
                <tr>
                    <td>
                        <p>Trim Both Sides</p>
                    </td>
                    <td class="td-markdown-code">
                        {%- if condition -%} ... {%- endif -%}
                    </td>
                </tr>
                <tr>
                    <td>
                        <p>Loop Example</p>
                    </td>
                    <td class="td-markdown-code">
                        {% for item in items -%}<br>
                        {{ item }}<br>
                        {%- endfor %}
                    </td>
                </tr>
            </tbody>
        </table>
    </div>

.. NOTE::

    Use the ``-`` (dash) inside tag delimiters to remove whitespace. This is particularly helpful when generating compact text or code (e.g., JSON, YAML, Markdown).

