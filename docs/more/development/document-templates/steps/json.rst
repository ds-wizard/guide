.. _document-template-step-json:

Step: ``json``
**************

|badge-status| |badge-metamodel|

Trivial step that dumps document context to JSON file.

Input
=====

*No input from previous step (should be first step)*

Output
======

Always results in a JSON file (``application/json``) with file extension ``.json``.

Options
=======

*No options*

Example
=======

.. code:: json

   {
     "name" : "json",
     "options" : {}
   }

.. |badge-status| image:: https://img.shields.io/badge/status-stable-green
.. |badge-metamodel| image:: https://img.shields.io/badge/metamodel%20version-%E2%89%A5%201-blue
