.. _faq-notes:

FAQ and Deployment Notes
************************

DSW does not start
==================

Check the affected service with ``docker compose ps`` and ``docker compose logs SERVICE``. Review the reported error before changing configuration. Confirm that the component versions and configuration match, and that PostgreSQL and object storage are reachable.

The client reports a missing bootstrap endpoint
===============================================

The 5.0 client calls ``/api/bootstrap``. If requests contain ``/wizard-api`` or ``/configs/bootstrap``, check both the client's ``API_URL`` and the actual frontend image running on the instance. An old client can keep requesting an old endpoint even after its API base URL is corrected.

Use matching 5.0 client and server versions, and configure the reverse proxy for ``/api``. See :doc:`configuration/configuration`.

Uploads or document generation fail
===================================

Check the server and worker logs, configured S3 endpoint, bucket, credentials and permissions. The bucket must exist. When using the deployment example, complete its storage initialization before importing content.

Documents cannot be downloaded or previewed
===========================================

Check whether the object-storage URL is reachable from the user's browser as well as from the application containers. An internal-only hostname can work for generation but fail for a browser download. See :ref:`config-server`.

.. _faq-unsupported-metamodel:
.. _document-templates-show-unsupported-metamodel-what-should-i-do:

Document templates show unsupported metamodel
=============================================

Import a template compatible with the running DSW version. For a Registry template, check the available versions and import a suitable one; do not assume every catalogue entry supports the current release.

For a custom template, update its code and metadata for context 19.0 as described in :ref:`document-template-metamodel-versions`. Increasing only the declared metamodel version does not port the template.

To import a compatible Registry version:

#. Configure the :doc:`Registry connection </application/administration/settings/content/dsw-registry>` with a Registry API key.
#. Open :guilabel:`Document Templates` → :guilabel:`List` and choose :guilabel:`Import`.
#. Choose the Registry source, enter the template reference in ``id:version`` form and import it.
#. Select the compatible version in the project's default template settings, then test generation.

An upgrade did not complete
===========================

Check :doc:`upgrade-guidelines`, the server logs and the component versions. Keep the database and storage backups from before the upgrade. Restore matching database, object-storage and configuration backups when rolling back; changing the image tag alone does not undo database migrations.

If the problem persists, follow :doc:`/more/miscellaneous/help`. Include the version and relevant error, but remove passwords, keys and private project data from logs before sharing them.

Deployment notes
================

The deployment example is for local evaluation. A production deployment needs its own HTTPS, backups, storage access, monitoring and operational procedures. Test upgrades on a restored copy before updating production.

PostgreSQL issues
=================

Check database connectivity and PostgreSQL logs as well as the application error. Database engine upgrades have their own compatibility and backup requirements; use the `PostgreSQL documentation <https://www.postgresql.org/docs/>`_ for the installed version before changing or restoring a database.

S3-compatible storage issues
============================

With the deployment example's Garage service, check ``docker compose logs garage --tail=200`` and confirm that ``create-bucket.sh`` completed successfully. That initialization creates the bucket, imports the configured key and grants permissions. Check the endpoint, region, bucket, access key, secret key and bucket permissions with other storage providers too.

The endpoint must work from the containers; the configured public storage address must also work from users' browsers. The `Garage documentation <https://garagehq.deuxfleurs.fr/documentation/>`_ covers Garage-specific diagnosis.

Operating an instance
=====================

Self-hosting requires server-management, Docker, database, storage and backup skills as well as infrastructure and ongoing maintenance. Resource needs depend on concurrent users, total data and document-template complexity. Use a restored test copy to check both capacity and upgrade procedures before a production change.
