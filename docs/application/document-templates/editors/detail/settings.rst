Document template settings
**************************

Edit the template's name, description, identifier, version, source language, license and README in the settings.
The source language describes the template's translatable content; output translations are managed for the released template.

.. todo::

   Screenshot: Document Template settings in DSW 5.0.

Knowledge model compatibility
=============================

Compatibility patterns use a knowledge model identifier and optional minimum/maximum versions. A null or empty identifier matches any model; a missing bound leaves that side of the version range unrestricted.
The organization ID is no longer a separate filter. Review migrated organization-only patterns, because removing that constraint can broaden the accepted models.

.. todo::

   Screenshot: Allowed Knowledge Models in DSW 5.0.

Formats
========

Each output format has a name, icon and ordered generation steps. A step has its implementation name and its options.
Choose the steps required to generate or convert that format, then test it with actual answers, translations and uploaded files where relevant.

The metadata uses document-template metamodel 19.0. Port custom code as described in :ref:`document-template-metamodel-versions`; changing only the metamodel number does not update an old template's field accesses.

.. todo::

   Screenshot: Document Template formats in DSW 5.0.

.. todo::

   Screenshot: Jinja rendering step with its template and file output options.
