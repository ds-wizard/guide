.. _document-template:

Document Template
*****************

A document template defines how questionnaire answers become a document. For example, it can arrange the answers into a Horizon Europe data management plan or export them as machine-readable JSON.

The same template can offer several output formats, such as HTML, PDF and MS Word. We choose a template and format when :doc:`creating a document </application/projects/list/detail/documents>`, or set defaults in the :doc:`project settings </application/projects/list/detail/settings>`.

.. todo::

   Screenshot: Document template details showing its description, version and available formats.

Document Template Structure
===========================

A document template brings together:

* **Metadata** describing the template and its version.
* **Knowledge model compatibility** defining which questionnaires it can use.
* **Formats** defining the outputs users can choose.
* **Files** containing the layout, rendering code and other resources.

Metadata
--------

Each template has a name, identifier and version, along with a description, source language, license and README. The README can explain what the template is for and what changed between versions.

A released version can be used in projects. Changes are prepared in a :ref:`document template editor<document-template-editors>` and published as another version.

Knowledge Model Compatibility
-----------------------------

A template needs to understand the questions and answers it uses. It therefore defines which :ref:`knowledge models<knowledge-model>` it is compatible with, using model identifiers and optional version ranges.

For example, a template written for a particular research-data questionnaire may not work with an unrelated questionnaire. When choosing a template for a project, DSW uses these compatibility rules to offer suitable templates.

Formats
-------

A format is one output offered by the template. Each format has a name, an icon and a sequence of generation steps.

One template might offer a readable HTML report, a PDF for sharing and a JSON file for another system. These formats can present different parts of the same questionnaire.

Generation Steps
^^^^^^^^^^^^^^^^

Steps describe how to produce a format. For example, a Jinja step can turn the questionnaire data into HTML. A following WeasyPrint step can convert that HTML to PDF.

Different formats can use different steps. Template authors configure them in :doc:`document template settings </application/document-templates/editors/detail/settings>`. The :doc:`development reference </more/development/document-templates/specification>` describes the available steps and their options.

Files
-----

Template files contain the rendering code and resources used by the generation steps. They can include Jinja templates, stylesheets, images and reference documents.

The rendering code uses the questionnaire data to choose which answers to include and how to display them. We can manage these files in the :doc:`document template editor </application/document-templates/editors/detail/files>` or develop them locally with the :ref:`Template Development Kit (TDK)<dsw-tdk>`.

Languages
---------

A template has a source language and can have translations for additional languages. These translate text supplied by the template, such as headings and labels. They do not translate answers entered by users.

When a template offers additional languages, we can choose one while creating a document. See :ref:`document template locales<document-template-locales>` for managing translations.

Using and Creating Templates
============================

We can import existing templates from the :ref:`DSW Registry<dsw-registry>` or a ZIP file into the :doc:`document template library </application/document-templates/list/import>`.

To adapt a template or create our own, we can start a :doc:`document template editor </application/document-templates/editors/create>`. Before publishing it, test the supported formats with representative project answers and check the resulting documents.
