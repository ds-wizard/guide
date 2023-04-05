# Configuration file for the Sphinx documentation builder.
#
# This file only contains a selection of the most common options. For a full
# list see the documentation:
# http://www.sphinx-doc.org/en/master/config

# -- Path setup --------------------------------------------------------------

# If extensions (or modules to document with autodoc) are in another directory,
# add these directories to sys.path here. If the directory is relative to the
# documentation root, use os.path.abspath to make it absolute, like shown here.
#
# import os
# import sys
# sys.path.insert(0, os.path.abspath('.'))


# -- Project information -----------------------------------------------------

project = 'Data Stewardship Wizard'
copyright = '2023, DSW Team'
author = 'DSW Team'

# The full version, including alpha/beta/rc tags
version = release = '3.22'

rst_prolog = f"""

.. |compose_ver| replace:: {release}

"""

# -- General configuration ---------------------------------------------------

# Add any Sphinx extension module names here, as strings. They can be
# extensions coming with Sphinx (named 'sphinx.ext.*') or your custom
# ones.
extensions = [
    'sphinx_substitution_extensions',
    'sphinxcontrib.youtube',
    'sphinx.ext.todo',
    'sphinx_toolbox.confval',
]

# Add any paths that contain templates here, relative to this directory.
templates_path = []

# List of patterns, relative to source directory, that match files and
# directories to ignore when looking for source files.
# This pattern also affects html_static_path and html_extra_path.
exclude_patterns = ['_build', 'Thumbs.db', '.DS_Store']

# -- Options for HTML output -------------------------------------------------

# The theme to use for HTML and HTML Help pages.  See the documentation for
# a list of builtin themes.
#
html_theme = 'furo'

# Add any paths that contain custom static files (such as style sheets) here,
# relative to this directory. They are copied after the builtin static files,
# so a file named "default.css" will overwrite the builtin "default.css".
html_static_path = ['_static']

html_favicon = '_static/favicon.ico'
html_theme_options = {
    'light_logo': 'logo/logo-light-mode.svg',
    'dark_logo': 'logo/logo-dark-mode.svg',
    'light_css_variables': {
        'color-brand-primary': '#f15a24',
        'color-brand-content': '#f15a24',
        'sidebar-item-spacing-horizontal': '.75rem',
    },
    'dark_css_variables': {
        'color-brand-primary': '#f15a24',
        'color-brand-content': '#f15a24',
        'sidebar-item-spacing-horizontal': '.75rem',
    },
    'sidebar_hide_name': True,
    'top_of_page_button': None,
}


def setup(app):
    app.add_css_file('style.css')

suppress_warnings = [
    # Suppress "WARNING: unknown mimetype (issue with .ico)
    'epub.unknown_project_files',
]
