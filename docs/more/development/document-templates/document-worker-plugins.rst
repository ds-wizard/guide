.. _document-worker-plugins:

Rendering Plugins
*****************

Python plugins can extend document generation with custom steps, context data and Jinja filters. In 5.0, these extensions use the shared ``dsw-templating`` renderer, which is used by the document worker and TDK.

Hooks
=====

* ``provide_steps`` returns a dictionary of step names and classes derived from ``dsw.templating.Step``.
* ``enrich_document_context(context)`` can add or change values in the rendering context.
* ``enrich_jinja_env(jinja_env, options)`` can register filters, tests or globals in Jinja.

A minimal plugin can add a context value and a filter:

.. code-block:: python

   # my_plugin/plugin.py
   from dsw.templating import hookimpl

   @hookimpl
   def enrich_document_context(context: dict) -> None:
       context['custom_note'] = 'Example output'

   @hookimpl
   def enrich_jinja_env(jinja_env, options: dict[str, str]) -> None:
       jinja_env.filters['project_code'] = lambda value: str(value).upper()

Register the module in ``pyproject.toml``:

.. code-block:: toml

   [project.entry-points.dsw_templating_plugins]
   my_plugin = 'my_plugin.plugin'

The renderer discovers installed packages through that entry point. Migrate older plugins from the removed ``dsw.document_worker`` imports and ``dsw_document_worker_plugins`` entry point.

Custom steps
============

A custom step implements ``execute_first(context)`` when it starts a format pipeline, or ``execute_follow(document, context)`` when it transforms an existing result. Return a ``DocumentFile`` appropriate to the output.

If overriding ``before_render(render_ctx)``, call the base implementation to preserve translation support. A step can translate its own output using ``self.gettext``, ``self.ngettext``, and ``self.pgettext``, and read ``self.translations`` and ``self.language``. Use ``self.options`` to read the step options, and ``self.raise_exc(message)`` to fail with an error message.

Install and test
================

Install the plugin package in the document worker image. Install the same compatible version in the local TDK environment when using it to test the template.

Test every format that depends on the plugin, including translations and representative project data. Record the dependency in the template README so other deployments know what they need to install.
