.. _submission-service:

Submission Service
******************

As administrators, we can configure submission services using :doc:`../../application/administration/settings/content/document-submission`. The configured HTTP request is then used when a user clicks :guilabel:`Submit` for an allowed document for submission and selected the desired submission service. The document is sent as a body of the request (or as multipart, based on the configuration) to the external service that should process it and return HTTP response with status code, and possibly also the `Location` header and some textual message.

Usually, we will need a simple proxy service to be developed that will accommodate this to API of some information system, database, storage, or other service. For example, such a proxy service will be able to receive the JSON documents from DSW, retrieve additional information through DSW API as needed, transform it to some other resulting artifact and store it in some local database that is used by other systems.

Example Submission Services
===========================

There are some submission services already implemented and can be used to check the implementation possibilities:

- `Dummy Submission Service <https://github.com/ds-wizard/dummy-submission-service>`_ which just based on the headers returns example result or error.
- `Email Submission Service <https://github.com/ds-wizard/email-submission-service>`_ sends an email through SMTP connection with the submitted document attached (or processed in case of JSON).
- `Nanopub Submission Service <https://github.com/ds-wizard/nanopub-submission-service>`_ allows to store a `nanopublication <https://github.com/Nanopublication>`_ (in RDF TRiG format) in the distributed network of nanopublication servers.
