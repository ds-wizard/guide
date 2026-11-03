.. _document-template-step-weasyprint:

Step: ``weasyprint``
********************



Transformation step that converts HTML file from previous step to PDF using `WeasyPrint <https://weasyprint.org/>`_.

Use the WeasyPrint version supplied by the compatible worker or local environment. Check the `WeasyPrint documentation <https://doc.courtbouillon.org/weasyprint/stable/>`_ for that version.

Input
=====

Gets HTML file from the previous step (otherwise it fails).

Output
======

Always results in a PDF file (``application/pdf``) with file extension ``.pdf``.

Options
========

-  (optional) ``render.presentational_hints`` = whether HTML presentational hints are followed (default: ``False``)
-  (optional) ``render.optimize_size`` = specify what should be optimized (``''``, ``'fonts'``, ``'images'``, ``'fonts,images'``, default: ``'fonts'``)
-  (optional) ``render.forms`` = whether PDF forms have to be included (default: ``False``)
-  (optional) ``pdf.zoom`` = zoom value as a floating number (default: ``'1'``)
-  (optional) ``pdf.variant`` = a PDF variant name
-  (optional) ``pdf.version`` = a PDF version number
-  (optional) ``pdf.custom_metadata`` = whether custom HTML metadata should be stored in the generated PDF

Notes
=====

-  Check the official `WeasyPrint <https://weasyprint.org/>`__ documentation and examples for more information.

Example
========

.. code:: json

   {
     "name" : "weasyprint",
     "options" : {
       "render.optimize_size": "fonts,images",
       "render.forms": "True",
       "pdf.zoom": "1.2"
     }
   }


External resources
==================

Images, stylesheets and fonts are subject to the renderer's security policy. Local files must be inside the template directory or an explicitly allowed path. External HTTP resources must be enabled; private-network addresses are blocked unless allowed by the deployment configuration. Data URLs are supported. A blocked resource can be omitted with a warning while a PDF is still produced. Check the rendered file and worker warnings when an asset is missing.

Additional supported options include ``pdf.identifier``, ``pdf.uncompressed``, ``render.jpeg_quality`` and ``render.dpi``. Consult the compatible renderer when choosing values; test resulting quality and size in the actual output format.
