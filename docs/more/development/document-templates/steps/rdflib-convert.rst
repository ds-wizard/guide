.. _document-template-step-rdflib-convert:

Step: ``rdflib-convert``
************************

|badge-status| |badge-metamodel|

Transformation step that converts between RDF formats.

Input
=====

Gets an RDF file from the previous step of one of the following formats: ``rdf`` (XML), ``nt``, ``n3``, ``ttl``, ``trig``, or ``json-ld`` (specified using ``from`` option).

Output
======

Results in an RDF document of one of the following formats: ``rdf`` (XML), ``nt``, ``n3``, ``ttl``, ``trig``, or ``json-ld`` (specified using ``from`` option).

Options
=======

-  ``from`` = specification of the input format (``rdf``, ``nt``, ``n3``, ``ttl``, ``trig``, ``json-ld``)
-  ``to`` = specification of the output format (``rdf``, ``nt``, ``n3``, ``ttl``, ``trig``, ``json-ld``)

Example
=======

.. code:: json

   {
     "name" : "rdflib-convert",
     "options" : {
       "from" : "ttl",
       "to" : "rdf"
     }
   }

.. |badge-status| image:: https://img.shields.io/badge/status-stable-green
.. |badge-metamodel| image:: https://img.shields.io/badge/metamodel%20version-%E2%89%A5%201-blue
