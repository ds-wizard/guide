FAQ and Deployment Notes
************************


Frequenty Asked Questions
=========================

This section tries to cover the common deployment issues people have and suggest what next steps should be done.

Why something is not running; what should I do?
-----------------------------------------------

Check what is not running using `docker-compose ps` and then use also `docker-compose logs <service>` to check what the issue is.

Why I cannot upload locales/templates and document generation fails?
--------------------------------------------------------------------

You probably have some issue with S3 configuration or its deployment. Also, check whether you have S3 bucket present with correct name.

Why I cannot download files from DSW or generate document preview?
------------------------------------------------------------------

Your S3 is probably not accessible by users. The S3 URL configured in :ref:`config-server` should be reachable so users can download something from the storage.

There is some issue with the PostgreSQL database; what should I do?
-------------------------------------------------------------------

Please use the `PostgreSQL documentation <https://www.postgresql.org/docs/>`_ to check the cause, various things may have happened... especially if you tried to upgrade the database version.

There is some issue with the MinIO S3 storage; what should I do?
----------------------------------------------------------------

Please use the `MinIO documentation <https://min.io/docs/minio/container/index.html>`_ to check the cause, various things may have happened... especially if you tried to upgrade the storage version.

I upgraded DSW and now it does not work properly, what should I do?
-------------------------------------------------------------------

You should always check :doc:`upgrade-guidelines` before upgrading, be sure that you followed all steps. In case you forgot and it is not possible to fix it now, you will have to rollback from you backup and do it again by following the guidelines this time. In case you encounter an issue even though you followed the guidelines, that might a bug and please `report it <https://github.com/ds-wizard/ds-wizard/issues>`_.

Document templates show "Unsupported Metamodel", what should I do?
------------------------------------------------------------------

You need to update your document templates so those are compatible with your DSW version, e.g. from DSW Registry. If those are your own document templates, you need to update them according to :doc:`upgrade-guidelines`.

Deployment Notes
================

- You should be knowledgeable with at least basics of server management, service operations, work with Docker, and debugging issues (e.g. accessing Docker logs).
- The deployment can vary significantly based on needs and available infrastructure, we cannot help with different kinds of deployments and technologies that we are not experts with.
- The deployment example serves for local testing purposes and should not be used as is for production. An expert should deploy DSW for production while considering local needs and capabilities.
- Never update production instance without backups and preferrably try the update procedure first on a testing environment.
- Running DSW locally is not "free", you need people, time, and infrastructure. With that in mind, consider what `option <https://ds-wizard.org/get-started>`_ is the most suitable for you.
