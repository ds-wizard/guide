..  _deployment:

Deployment
**********


Own DSW Instance
================

.. WARNING::

    For production use, we should consult deployment and other operations with the sysadmin or contact the `DSW Team <mailto:info@ds-wizard.org>`_ for professional services.

    The following instructions are intended **only for local deployment** and trying it out. It does not include any safety measures that are required for production deployment and are handled differently based on specific requirements and deployment sites (e.g., using HTTPS, enabled websockets, backups, metrics-gathering, and many others).


.. _installation-docker:

Deployment with Docker
----------------------

The simplest way is to use `Docker Compose <https://docs.docker.com/compose/>`__. Requirements are just to have Docker installed, privileges for current users, and the Docker daemon started. At least basic knowledge of Docker is required.

1. Clone the `DSW Deployment Example <https://github.com/ds-wizard/dsw-deployment-example>`__ repository
2. Check config files (described in :doc:`./configuration/configuration`)
3. Select configuration and component images compatible with the DSW version being installed. Run DSW with Docker Compose ``docker compose up -d``
4. After starting up, we will be able to open the Wizard in our browser on http://localhost:8080
5. We can use ``docker compose logs`` to see the logs and ``docker compose down`` to stop all the services

.. WARNING::

    It is important to use latest patch version, we should monitor the documentation or join the DSW community on Discord if new hotfix releases are available.

Deployment without Docker
-------------------------

It is highly recommended using Docker. However, we can compile and run everything directly on our machine. Nevertheless, an additional expertise in programming and building/running Elm, Haskell, Python, and others is required.

The related code and instructions are available:

* https://github.com/ds-wizard/wizard-server
* https://github.com/ds-wizard/engine-frontend
* https://github.com/ds-wizard/engine-tools

Default Users
-------------

The example deployment can seed demonstration accounts. When those seed data are enabled, the three sample accounts use password ``password``:

* albert.einstein@example.com (Administrator)
* nikola.tesla@example.com (Data Steward)
* isaac.newton@example.com (Researcher)

We can use those accounts for testing or initially make our own admin account and then delete them.

.. WARNING::

    Having a public instance with default accounts is a **security risk**. We should delete or change default accounts (mainly Albert Einstein) if our DSW instance is public as soon as possible.


DSW Registry
------------

Configure a Registry connection using an API key from an individual `DSW Registry account <https://registry.ds-wizard.org/>`_. See :doc:`/application/administration/settings/content/dsw-registry` for the settings.


Initial Knowledge Model, Document Templates, and Locales
--------------------------------------------------------

When we have a fresh installation, there are just the default users and no knowledge models or document templates. We are free to create them from scratch if we want. Another option is to import existing KM and document templates from the `DSW Registry <https://registry.ds-wizard.org/>`__.

In the `DSW Registry <https://registry.ds-wizard.org/>`__, we can find the core knowledge model for general data stewardship and a couple of document templates, such as Horizon Europe and locales! Another option is to import it from a file if we have any (according to usage).

Database Backups
----------------

If we want to regularly backup our database (and we should!), all we need to do is to set up a cronjob that backups PostgreSQL database (e.g., using `pg_dump <https://www.postgresql.org/docs/current/app-pgdump.html>`__ utility) as well S3 storage.

Deployment Requirements
-----------------------

Size the deployment for its expected content and workload. Configure `container resource limits <https://docs.docker.com/reference/compose-file/deploy/#resources>`_ and test them with representative data before production use.


Large knowledge models, uploaded files, templates and concurrent rendering jobs can affect CPU, memory and storage use. Include PostgreSQL and object storage when planning capacity, in addition to the application services.

Check the document worker with the actual formats and assets used by the instance. Conversion tools and large documents can have different resource requirements from a small HTML preview.
