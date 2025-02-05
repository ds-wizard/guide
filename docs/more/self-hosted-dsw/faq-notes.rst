FAQ and Deployment Notes
************************


Frequently Asked Questions
==========================

This section tries to cover the common deployment and other issues related to instance management people have and suggest what next steps should be done.

Why something is not running; what should I do?
-----------------------------------------------

Check what is not running using `docker-compose ps` and then use also `docker-compose logs <service>` to check what the issue is.

Why I cannot upload locales/templates and document generation fails?
--------------------------------------------------------------------

You probably have some issue with S3 configuration or its deployment. Also, check whether you have S3 bucket present with correct name.

Why I cannot download files from |project_name| or generate document preview?
-----------------------------------------------------------------------------

Your S3 is probably not accessible by users. The S3 URL configured in :ref:`config-server` should be reachable so users can download something from the storage.

There is some issue with the PostgreSQL database; what should I do?
-------------------------------------------------------------------

Please use the `PostgreSQL documentation <https://www.postgresql.org/docs/>`_ to check the cause, various things may have happened... especially if you tried to upgrade the database version.

There is some issue with the MinIO S3 storage; what should I do?
----------------------------------------------------------------

Please use the `MinIO documentation <https://min.io/docs/minio/container/index.html>`_ to check the cause, various things may have happened... especially if you tried to upgrade the storage version.

I upgraded |project_name| and now it does not work properly, what should I do?
------------------------------------------------------------------------------

You should always check :doc:`upgrade-guidelines` before upgrading, be sure that you followed all steps. In case you forgot and it is not possible to fix it now, you will have to rollback from you backup and do it again by following the guidelines this time. In case you encounter an issue even though you followed the guidelines, that might a bug and please `report it <https://github.com/ds-wizard/ds-wizard/issues>`_.

.. _faq-unsupported-metamodel:

Document templates show "Unsupported Metamodel", what should I do?
------------------------------------------------------------------

There are two cases:

- You are using a document template from DSW Registry.
- You are using your own document template.

For the first case, you need to import newer version from DSW Registry. Templates in Registry are managed by the DSW Team which ensure that they are always up to date. If those are your own document templates, you need to update them according to :ref:`document-template-metamodel-versions`.

To update from DSW Registry, you need to have in connected with your DSW instance. If you can see the :guilabel:`Update Available` badge, you can update the template. If you cannot see the badge, you should check if you are connected to the DSW Registry.

To connect to the DSW Registry and import new templates from there, you can follow this guide:

1. Go to Administration -> Settings -> Content Settings -> DSW Registry
2. Click on Enabled
3. Click on Sign Up
4. Fill out your email
5. With a token you will get to login to https://registry.ds-wizard.org
6. Open desired template
7. Copy the Document Template ID
8. Go back to DSW -> Document Templates -> List
9. Click on Import
10. Paste the Document Template ID
11. Click on Import

.. NOTE::

    The Sign up to the DSW Registry must be done by an admin. Once the admin signs up, data stewards can import and update templates from the DSW Registry.


Templates imported this way will have the :guilabel:`Update Available` badge when a new version is available in the Registry.

Deployment Notes
================

- You should be knowledgeable with at least basics of server management, service operations, work with Docker, and debugging issues (e.g. accessing Docker logs).
- The deployment can vary significantly based on needs and available infrastructure, we cannot help with different kinds of deployments and technologies that we are not experts with.
- The deployment example serves for local testing purposes and should not be used as is for production. An expert should deploy |project_name| for production while considering local needs and capabilities.
- Never update production instance without backups and preferably try the update procedure first on a testing environment.
- Running |project_name| locally is not "free", you need people, time, and infrastructure. With that in mind, consider what `option <https://ds-wizard.org/get-started>`_ is the most suitable for you.
