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

Notes
=====

-  Pandoc filter ``pandoc-docx-pagebreakpy`` can be found in `addons <../../addons>`__ directory.

Example
=======

.. code:: json

   {
     "name" : "pandoc",
     "options" : {
       "from" : "html",
       "to" : "docx",
       "args": "--filter=pandoc-docx-pagebreakpy --reference-doc=src/reference.docx"
     }
   }

.. |badge-status| image:: https://img.shields.io/badge/status-stable-green
.. |badge-metamodel| image:: https://img.shields.io/badge/metamodel%20version-%E2%89%A5%201-blue
