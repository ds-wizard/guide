..  _configuration-plugins:

Plugins
*******

.. WARNING::
    
    The plugins functionality is considered experimental.


This page provides information on how to install plugins for |project_name|. Information on developing plugins can be found here: :ref:`plugins development<development-plugins>`.

There are available plugins to extend the functionality of the base DSW.

How to Install Plugins
======================

We can deploy plugins using the static file. The file is to be served via HTTP(S) so you can use public S3 bucket or HTTP(S) proxy to serve it. The file can be found in GitHub releases in a ZIP file in respective plugin repository.

Once deployed, you need to add it to your DSW instance database (see the example sql where you need to adjust the ``https://example.com/6534f8f7-0d43-4c4d-9157-15af17f37649`` value).

.. CODE-BLOCK:: sql

    INSERT INTO plugin (uuid, url, enabled, tenant_uuid, created_at, updated_at) VALUES ('6534f8f7-0d43-4c4d-9157-15af17f37649', 'https://example.com/6534f8f7-0d43-4c4d-9157-15af17f37649/', true, '00000000-0000-0000-0000-000000000000', now(), now());


Available Plugins
=================

- **Replies Importer**: https://github.com/ds-wizard/replies-importer-plugin
- **maDMP Importer**: https://github.com/ds-wizard/madmp-importer-plugin
