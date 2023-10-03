Deployment
**********


Own |project_name| Instance
===========================

.. WARNING::

    For production use, we should consult deployment and other operations with the sysadmin or contact the `DSW Team <mailto:info@ds-wizard.org>`_ for professional services.

    The following instructions are intended **only for local deployment** and trying it out. It does not include any safety measures that are required for production deployment and are handled differently based on specific requirements and deployment sites (e.g., using HTTPS, enabled websockets, backups, metrics-gathering, and many others).


.. _installation-docker:

Deployment with Docker
----------------------

The simplest way is to use `Docker Compose <https://docs.docker.com/compose/>`__. Requirements are just to have Docker installed, privileges for current users, and the Docker daemon started. At least basic knowledge of Docker is required.

1. Clone the `DSW Deployment Example <https://github.com/ds-wizard/dsw-deployment-example>`__ repository
2. Check config files (described in :doc:`./configuration`)
3. Run the |project_name| with Docker compose ``docker-compose up -d``
4. After starting up, we will be able to open the Wizard in our browser on http://localhost:8080
5. We can use ``docker-compose logs`` to see the logs and ``docker-compose down`` to stop all the services

.. WARNING::

    It is important to use latest patch version, we should monitor the documentation or join the community Slack if new hotfix releases are available.

Deployment without Docker
-------------------------

It is highly recommended using Docker. However, we can compile and run everything directly on our machine. Nevertheless, an additional expertise in programming and building/running Elm, Haskell, Python, and others is required.

The related code and instructions are available:

* https://github.com/ds-wizard/engine-backend
* https://github.com/ds-wizard/engine-frontend
* https://github.com/ds-wizard/engine-tools

Default Users
-------------

Initially, migrations will fill the database with predefined data needed including three users, all with password - ``password``:

* albert.einstein@example.com (Administrator)
* nikola.tesla@example.com (Data Steward)
* isaac.newton@example.com (Researcher)

We can use those accounts for testing or initially make our own admin account and then delete them.

.. WARNING::

    Having a public instance with default accounts is a **security risk**. We should delete or change default accounts (mainly Albert Einstein) if our |project_name| instance is public as soon as possible.

DSW Registry
------------

When we have our own self-hosted instance, it is essential to register within the `DSW Registry <https://registry.ds-wizard.org>`__. It is a source of shared knowledge models, document templates, and locales that can support our deployment. The registry is also integrated inside the |project_name|. Therefore, we can easily pull new versions from the |project_name|. The registration can be done either directly in our |project_name| instance in Settings or via the DSW Registry website.


Initial Knowledge Model, Document Templates, and Locales
--------------------------------------------------------

When we have a fresh installation, there are just the default users and no knowledge models or document templates. We are free to create them from scratch if we want. Another option is to import existing KM and document templates from the `DSW Registry <https://registry.ds-wizard.org/>`__.

In the `DSW Registry <https://registry.ds-wizard.org/>`__, we can find the core knowledge model for general data stewardship and a couple of document templates, such as Horizon Europe and locales! Another option is to import it from a file if we have any (according to usage).

Database Backups
----------------

If we want to regularly backup our database (and we should!), all we need to do is to set up a cronjob that backups PostgreSQL database (e.g., using `pg_dump <https://www.postgresql.org/docs/current/app-pgdump.html>`__ utility) as well S3 storage.

Deployment Requirements
-----------------------

The following requirements were estimated using `limiting Docker resources <https://docs.docker.com/compose/compose-file/compose-file-v3/#resources>`__ provided to containers.

+-----------------+----------------+----------------+
| Component       | Minimal        | Recommended    |
+=================+================+================+
| Server          | 128 MB         | 512 MB         |
+-----------------+----------------+----------------+
| Client          | 16 MB          | 64 MB          |
+-----------------+----------------+----------------+
| Document Worker | 240 MB         | 1024 MB        |
+-----------------+----------------+----------------+
| Mailer          | 240 MB         | 448 MB         |
+-----------------+----------------+----------------+
| **Total**       | **624 MB**     | **2048 MB**    |
+-----------------+----------------+----------------+

As for the CPU, there are no long-running tasks that would require excessive CPU consumption. Limiting CPU resources can only make some operations slightly longer (e.g., importing a knowledge model or generating a document). A number of CPUs/cores will then affect performance for concurrent users/actions. Memory consumption is affected by the size of the content (as some content is being cached for speed optimizations).

Memory used by document workers might be affected by the size of the document template (and assets) for generating a document. Recommended memory in the table above is approximated for a long-term run (without restarts) with a significant amount of content. It also minimizes the need for garbage collection techniques that may slow down the server component.

.. NOTE::

    Real requirements should be aligned with the intended use (number of concurrent users, number of users in total, size of document templates, etc.). The minimal requirements are sufficient for single-user deployment and recommended requirements should handle tens of concurrent users.
