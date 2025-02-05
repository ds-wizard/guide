.. _plugins:

Plugins
*******

It is possible to extend functionality of |project_name| by implementing own plugins according to the instructions and thus add new features to the application. This requires technical knowledge and experience with the relevant technologies used in |project_name| (such as Python or Docker). You should not consider developing plugins unless you are familiar with programming and also will be committed to maintaining the plugin in the future.

Document Worker Plugins
=======================

.. note::

    The plugin system is still in development and may change in the future versions.

Document Worker allows plugins to be installed as Python packages next to the main application and then are automatically loaded thanks to the `setuptools` `entry points <https://setuptools.pypa.io/en/latest/userguide/entry_point.html>`_ and used `Pluggy <https://pluggy.readthedocs.io/en/stable/>`_ library. For this version, the plugins can implement the following interfaces (hooks):

- `provide_steps` - provides additional steps for the document processing workflow (dictionary: step name, step class inheriting from `dsw.document_worker.templates.steps.Step`)
- `enrich_document_context` - enrich (or otherwise modify) the document context before the processing starts (context is passed as a dictionary in the argument)
- `enrich_jinja_env` - enrich the Jinja environment used for rendering the templates (environment is passed as an argument), this can be used to add custom filters, tests, or global variables

The Python package implementing the plugin need to import `hookimpl` from `dsw.document_worker.plugins` and then use it as a decorator for the functions implementing the hooks:

.. code-block:: python

    # my_plugin/plugin.py
    import jinja2
    from dsw.document_worker.plugins import hookimpl
    from dsw.document_worker.templates.steps import Step

    @hookimpl
    def provide_steps() -> dict[str, type[Step]]:
        return {
            'my-step': MyStep
        }

    @hookimpl
    def enrich_document_context(context: dict) -> None:
        context['my-key'] = 'my-value'

    @hookimpl
    def enrich_jinja_env(jinja_env: jinja2.Environment, options: dict) -> None:
        jinja_env.filters['my_filter'] = my_filter

Then, the plugin must specify ``dsw_document_worker_plugins`` entry point, e.g. in the ``pyproject.toml`` file:

.. code-block:: toml

    [project.entry-points.dsw_document_worker_plugins]
    my_plugin = 'my_plugin.plugin'


Finally, if you are running DSW in a Docker container, you need to build a new image with the plugin installed. The plugin package must be installed in the container, one way to do this is to build a new image while using the original DSW image as a base and installing the plugin package in the Dockerfile. For more details, see the `DSW Document Worker: Example Plugin repository <https://github.com/ds-wizard/docworker-example-plugin>`_.

When the plugin is installed and the DSW application is started, the plugin will be automatically loaded and used in the document processing workflow. The document templates may simply use the new steps provided by the plugin, context enriched by the plugin, or custom filters added to the Jinja environment. However, keep in mind that the document templates may be transferred other instances of DSW, so the templates should be as generic as possible and explicitly check presence of such custom things, e.g. via ``{% if my_filter is not defined %}``. 
