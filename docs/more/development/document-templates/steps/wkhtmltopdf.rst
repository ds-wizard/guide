.. _document-template-step-wkhtmltopdf:

Step: ``wkhtmltopdf``
*********************

|badge-status| |badge-metamodel|

Transformation step that converts HTML file from previous step to PDF.

Input
-----

Gets HTML file from the previous step (otherwise it fails).

Output
------

Always results in a PDF file (``application/pdf``) with file extension ``.pdf``.

Options
-------

-  (optional) ``args`` = command line arguments passed to `wkhtmltopdf <https://wkhtmltopdf.org/usage/wkhtmltopdf.txt>`__

Notes
-----

-  For security reasons, ``--disable-local-file-access`` is enforced (except working directory where the template is stored).
-  We recommend using :doc:`./weasyprint` step instead.

Example
-------

.. code:: json

   {
     "name" : "wkhtmltopdf",
     "options" : {
       "args": "--disable-smart-shrinking -B 20mm -L 20mm -R 20mm -T 25mm"
     }
   }

.. |badge-status| image:: https://img.shields.io/badge/status-legacy-red
.. |badge-metamodel| image:: https://img.shields.io/badge/metamodel%20version-%E2%89%A5%201-blue
