.. _dsw-tdk:

Template Development Kit
************************

.. NOTE::

    **Requirements for Local Template Development**

    * Your favorite text editor or IDE
    * Template Development Kit (see below)
    * |project_name| instance (recommended to have local one) with your admin account
    * Python 3.7+ (with pip) or Docker

Our Template Development Kit (TDK) provides a simple way how to work with templates locally. It is a CLI tool written in Python.


Video Tutorial
==============

This is a comprehensive video tutorial on how to use the Template Development Kit.

.. youtube:: FFElv-e24NE
    :width: 100%
    :align: center


Installation
============

You can install it easily using `pip <https://pip.pypa.io/en/stable/installation/>`__ from `Python Package Index (PyPI) <https://pypi.org/project/dsw-tdk/>`__. Optionally, you can use virtual environment or other installation option described in the `TDK repository <https://github.com/ds-wizard/engine-tools/tree/develop/packages/dsw-tdk>`__.

.. code-block::

    pip install dsw-tdk
    dsw-tdk --help

It is also possible to use `datastewardshipwizard/dsw-tdk <https://hub.docker.com/r/datastewardshipwizard/dsw-tdk>`__ Docker image when you don’t have Python locally:


.. code-block::

    docker run datastewardshipwizard/dsw-tdk --help


Commands
========

There are these basic commands:

* ``new`` = create a new template project, it launches a simple interactive wizard for template metadata
* ``list`` = list all templates (latest versions) from configured |project_name|
* ``get`` = download a template project with specified template ID from |project_name|
* ``put`` = upload the local template project to |project_name| (once or continually on-change when ``--watch`` flag is used)
* ``verify`` = check the metadata of the local template project
* ``package`` = create a ZIP distribution package from the local template project (ZIP is importable to |project_name| via its web interface)

Default template directory is current one for ``put``, ``verify``, and ``package``. But ``new`` and ``get`` will create a new folder according to the template ID if not explicitly set in other way.

You can use ``--help`` to find out details:


.. code-block::

    dsw-tdk new --help


Environment variables and .env file
===================================

You can use environment variables to authenticate:

* ``DSW_API_URL`` = URL of |project_name| API with which you want to communicate. Hover mouse over your profile name to find the About section where URL is specified.
* ``DSW_API_KEY`` = your API Key. Hover mouse over your profile name, click on :guilabel:`Edit Profile` and then navigate to :guilabel:`API Keys` From there, you can generate a new API Key for the authentication.

To make this even easier, you can store those in ``.env`` file in the project root and it will be loaded automatically. Or you can specify the path to a ``.env`` file:

.. code-block::

    dsw-tdk --dot-env /path/to/.env list

