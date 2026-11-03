.. _document-template-step-pandoc:

Step: ``pandoc``
****************



Transformation step that converts Pandoc-compatible document formats.

Use the Pandoc version supplied by your compatible worker or local rendering environment. Check its supported formats and options in the `Pandoc manual <https://pandoc.org/MANUAL.html>`_.

Input
=====

Gets a file from the previous step (otherwise it fails), format needs to be specified using ``from`` option.

Output
======

Results in a document in desired format specified using ``to`` option.

Options
========

-  ``from`` = specification of the input format (passed to Pandoc via ``--from``, see `docs <https://pandoc.org/MANUAL.html#general-options>`__)
-  ``to`` = specification of the output format (passed to Pandoc via ``--to``, see `docs <https://pandoc.org/MANUAL.html#general-options>`__)
-  (optional) ``args`` = additional command line arguments passed to `pandoc <https://pandoc.org/MANUAL.html>`__
-  (optional, experimental) ``filters`` = additional `Pandoc filters <https://pandoc.org/MANUAL.html#general-options>`__ to be used, use the bundled filters or a directory configured by the rendering environment, comma separated
-  (optional, experimental) ``template`` = `Pandoc template <https://pandoc.org/MANUAL.html#general-options>`__ to be used, need to be located under ``/pandoc/templates`` directory (or other set by ``PANDOC_TEMPLATES`` environment variable)

Example
========

.. code:: json

  {
    "name" : "pandoc",
    "options" : {
      "from" : "html",
      "to" : "docx",
      "args": "--reference-doc=src/reference.docx",
      "filters": "docx-pagebreak.lua, docx-toc.lua"
    }
  }


The shared renderer bundles ``docx-landscape.lua``, ``docx-pagebreak.lua`` and ``docx-toc.lua``. For additional filters, check that the same files are installed in local testing and on the worker.
