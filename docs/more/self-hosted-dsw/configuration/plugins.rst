..  _configuration-plugins:

Plugins
*******

.. WARNING::

    Plugin support is experimental.


This page provides information on how to install plugins for DSW. Information on developing plugins can be found here: :ref:`plugins development<development-plugins>`.

Plugins can extend DSW with additional features.

How to Install Plugins
======================

We can deploy plugins by serving their static files. Serve the files over HTTP(S), for example from a public S3 bucket or a web server. The file can be found in GitHub releases in a ZIP file in respective plugin repository.

Once deployed, you need to add it to your DSW instance database (see the example SQL where you need to adjust the ``https://example.com/6534f8f7-0d43-4c4d-9157-15af17f37649`` value).

.. CODE-BLOCK:: sql

    INSERT INTO plugin (uuid, url, enabled, tenant_uuid, created_at, updated_at) VALUES ('6534f8f7-0d43-4c4d-9157-15af17f37649', 'https://example.com/6534f8f7-0d43-4c4d-9157-15af17f37649/', true, '00000000-0000-0000-0000-000000000000', now(), now());


Available Plugins
=================

- **Replies Importer**: https://github.com/ds-wizard/replies-importer-plugin
- **maDMP Importer**: https://github.com/ds-wizard/madmp-importer-plugin
