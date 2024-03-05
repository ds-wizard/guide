.. _document-template-step-pandoc:

Step: ``pandoc``
****************

|badge-status| |badge-metamodel|

Transformation step that converts Pandoc-compatible document formats.

Input
=====

Gets a file from the previous step (otherwise it fails), format needs to be specified using ``from`` option.

Output
======

Results in a document in desired format specified using ``to`` option.

Options
=======

-  ``from`` = specification of the input format (passed to Pandoc via ``--from``, see `docs <https://pandoc.org/MANUAL.html#general-options>`__)
-  ``to`` = specification of the output format (passed to Pandoc via ``--to``, see `docs <https://pandoc.org/MANUAL.html#general-options>`__)
-  (optional) ``args`` = additional command line arguments passed to `pandoc <https://pandoc.org/MANUAL.html>`__
-  (optional, experimental) ``filters`` = additional `Pandoc filters <https://pandoc.org/MANUAL.html#general-options>`__ to be used, need to be located under ``/pandoc/filters`` directory (or other set by ``PANDOC_FILTERS`` environment variable), comma separated
-  (optional, experimental) ``template`` = `Pandoc template <https://pandoc.org/MANUAL.html#general-options>`__ to be used, need to be located under ``/pandoc/templates`` directory (or other set by ``PANDOC_TEMPLATES`` environment variable)

Notes
=====

-  Pandoc filter ``pandoc-docx-pagebreakpy`` can be found in `addons <../../addons>`__ directory.
-  Pandoc filter ``pandoc-docx-pagebreakpy`` will be removed with the next template metamodel version, use `` for the ``filters`` option instead.

Example
=======

.. code:: json

  {
    "name" : "pandoc",
    "options" : {
      "from" : "html",
      "to" : "docx",
      "args": "--filter=pandoc-docx-pagebreakpy --reference-doc=src/reference.docx",
      "filters": "docx-pagebreak.lua, docx-toc.lua"
    }
  }

.. |badge-status| image:: https://img.shields.io/badge/status-stable-green
.. |badge-metamodel| image:: https://img.shields.io/badge/metamodel%20version-%E2%89%A5%201-blue
