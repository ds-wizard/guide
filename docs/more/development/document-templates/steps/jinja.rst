Jinja templates
***************

The Jinja rendering step turns a template file and document context into an output such as HTML or Markdown.
Its options include the template path, output content type and file extension. Configure the step in the output format and use the compatible renderer's supported options.

.. code-block:: json

   {
     "name": "jinja",
     "options": {
       "template": "template.html.j2",
       "content-type": "text/html",
       "extension": "html"
     }
   }

Use the linked object model when following the examples:

.. code-block:: jinja

   {%- set x = ctx|to_context_obj -%}
   <h1>{{ (x.project.name if x.project else x.km_editor.name) }}</h1>

Context 19.0 moves answers and other questionnaire data under ``questionnaire`` and distinguishes projects from editor previews. See :doc:`/more/development/document-templates/document-context` before porting an older template.

Translations and helpers
========================

Use the template's locales for translations. The earlier ``i18n-dir``, ``i18n-domain`` and ``i18n-lang`` step options are no longer the configuration mechanism.
Translation blocks are trimmed by default; use ``notrimmed`` where the intended output depends on preserved whitespace.

The shared templating engine supplies the current filters, tests, asset helpers and reply extraction. The `filter reference <https://github.com/ds-wizard/engine-tools/blob/6c159fa862b381890c6a1464be846df4f57fd387/packages/dsw-templating/support/JinjaFilters.md>`__ describes their options, including extract_replies configuration and versioned behavior.
Custom rendering extensions use the ``dsw_templating_plugins`` entry point. Check them against the compatible shared renderer rather than the removed worker-specific extension API.

Check translated output, escaped user content, long answers, images and files in every supported format.

Optional rendering features
===========================

``jinja-ext`` can enable the ``debug`` extension. The ``do``, ``loopcontrols`` and ``i18n`` extensions are already enabled. Supported ``policy.*`` options control truncation, URL rendering and JSON serialization; see the `step reference <https://github.com/ds-wizard/engine-tools/blob/6c159fa862b381890c6a1464be846df4f57fd387/packages/dsw-templating/support/steps/jinja.md>`__.

HTTP requests from templates require explicit enablement for that template in the worker configuration. Requests remain subject to its URL security policy; private-network resources, redirect credentials and request options can be restricted. Do not assume an older template's network requests remain permitted.
