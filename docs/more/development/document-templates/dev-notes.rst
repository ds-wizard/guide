Document Template Development Notes
***********************************

Here we collect general recommendations and best practices to develop document templates. In case you would like to include a specific note, please let us know - any suggestions are appreciated.

Missing or Special Fonts
========================

**Issue**: It may happen that certain fonts are not installed in the document worker (affecting PDF documents) or user's device (affecting client-rendered documents like HTML or SVG). This may result in weird/incorrect characters appearing incl. rectangular shapes.

**Recommendations**: Include fonts via CSS/HTML, e.g. using the `Google Fonts <https://fonts.google.com/>`_ or other similar:

.. code:: html

    <head>
        <title>Data Management Plan</title>
        <meta charset="utf-8">
        <link rel="preconnect" href="https://fonts.googleapis.com">
        <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
        <link
            href="https://fonts.googleapis.com/css2?family=Open+Sans"
            rel="stylesheet">
        <style>
            body { font-family: "Open Sans", sans-serif; }
        </style>
    </head>


Check font licensing, file size and availability in the actual renderer. External font downloads are subject to its resource security policy; verify that the resulting document contains the intended glyphs.


Misplaced Content in PDF
========================

**Issue**: It may happen that content is placed over header/footer or incorrectly split between pages.

**Recommendations**: First, avoid incorrect HTML structures such as empty list items, nested paragraphs, tables without ``tbody`` etc. Then also make sure that the page, footer and header sizes are correctly set via CSS. Similarly, you can prevent page break using CSS. In case of issues, also refer to the :ref:`WeasyPrint step <document-template-step-weasyprint>` or directly the `WeasyPrint documentation <https://doc.courtbouillon.org/weasyprint/stable/>`_.


Issues with PDF Formatting
==========================

**Issue**: PDF is rendered differently than if I check HTML in print view of browser.

**Recommendations**: This is done via :ref:`document-template-step-weasyprint` thus the `WeasyPrint <https://weasyprint.org/>`_ library. Please check their documentation, recommendation and issues. It is also useful to search (e.g. via Google) specifically how to achieve certain styling/layouting in WeasyPrint.


Styling MS Word Documents
=========================

**Issue**: CSS and HTML styling is not appearing correctly in MS Word documents (transformed from HTML via the Pandoc step).

**Recommendations**: CSS styles do not affect resulting MS Word documents as that is not possible with Pandoc. The Word document will use the matching styles based on certain HTML tags (e.g. ``<title>``, ``<h1>``, ``<p>``, or ``<table>``).

You can adjust how those look by creating ``reference.docx`` document with desired styles incl. headers/footers. Ideal way is to download MS Word document generated, adjust styles as needed, and store it as the ``reference.docx`` document.

Then, it can be added to the document template and used for the :ref:`Pandoc step <document-template-step-pandoc>` via ``args``. Please check directly the `relevant part of the Pandoc documentation <https://pandoc.org/MANUAL.html#option--reference-doc>`_.
