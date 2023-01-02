**********
Deployment
**********

.. NOTE::

    It is a good idea to first try out DSW using the public instances before going for other options (self-hosted or DSW Cloud).

----

Own DSW Instance
================

.. WARNING::

    For production use, consult deployment and other operations with your sysadmin or contact us for professional services.

    The following instructions are intended **only for local deployment** and trying it out. It does not include any safety measures that are required for production deployment and are handled differently based on specific requirements and deployment site (e.g. using HTTPS, enabled websockets, backups, and many others).


.. _installation-docker:

Deployment with Docker
----------------------

The simplest way is to use `Docker Compose <https://docs.docker.com/compose/>`__. Requirements are just to have Docker installed, privileges for current users, and the Docker daemon started. At least basic knowledge of Docker is required.

1. Visit and clone https://github.com/ds-wizard/dsw-deployment-example
2. Check config files (described in Configuration), especially ``dsw.yml`` and ``docker-compose.yml``
3. Run the DSW with Docker compose ``docker-compose up -d``
4. After starting up, you will be able to open the Wizard in your browser on http://localhost:8080
5. You can use ``docker-compose logs`` to see the logs and ``docker-compose down`` to stop all the services

.. WARNING::

    It is important to use latest patch version, you should monitor the documentation if new hotfix releases are available.

Deployment without Docker
-------------------------

We highly recommend using Docker, but you are open to compile and run everything directly on your device. Additional expertise related to programming and building/running Elm, Haskell, Python, and others is required.

The related code and instructions are available:

* https://github.com/ds-wizard/engine-backend
* https://github.com/ds-wizard/engine-frontend
* https://github.com/ds-wizard/engine-tools

Default Users
-------------

Initially, migrations will fill the database with predefined data needed including three users, all with password “password”:

* albert.einstein@example.com (Administrator)
* nikola.tesla@example.com (Data Steward)
* isaac.newton@example.com (Researcher)

You can use those accounts for testing or to initially made your own account admin and then delete them.

.. WARNING::

    Having a public instance with default accounts is a **security risk**. Delete or change default accounts (mainly Albert Einstein) if your DSW instance is public as soon as possible. Also, adjust authentication settings according to your needs.

DSW Registry
------------

When you have your own self-hosted instance, it is essential for you to register within the `DSW Registry <https://registry.ds-wizard.org>`__. It is a source of shared knowledge models, and document templates that can support your deployment. The registry is also integrated inside the DSW. Therefore, you can easily pull new versions from the DSW. The registration can be done either directly in your DSW instance in the Settings or via the DSW Registry website.


Initial Knowledge Model and Document Templates
----------------------------------------------

When you have a fresh installation, there are just the default users and no knowledge models or document templates. You are free to create them from scratch if you want. Another option is to import existing KM and document templates from the `DSW Registry <https://registry.ds-wizard.org/>`__.

In the `DSW Registry <https://registry.ds-wizard.org/>`__, you can find the core knowledge model for general data stewardship and a couple of document templates, such as Horizon Europe.  Another option is to import it from a file if you have any (according to usage).

Database Backups
----------------

If you want to regularly backup your database (and you should!), all you need to do is to set up a cronjob that backups PostgreSQL database (e.g. using `pg_dump <https://www.postgresql.org/docs/current/app-pgdump.html>`__ utility) as well S3 storage.

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

As for CPU, there are no long-running tasks that would require excessive CPU consumption. Limiting CPU resources can only make some operations slightly longer (e.g. importing a knowledge model, generating a document). A number of CPUs/cores will then affect performance for concurrent users/actions. Memory consumption is affected by the size of the content (as some content is being cached for speed optimizations).

Memory used by document workers might be affected by the size of the template (and assets) for generating a document. Recommended memory in the table above is approximated for a long-term run (without restarts) with a significant amount of content. It also minimizes the need for garbage collection techniques that may slow down the server component.

.. NOTE::

    Real requirements should be aligned with the intended use (number of concurrent users, number of users in total, size of document templates, etc.). The minimal requirements are sufficient for single-user deployment, recommended should handle tens of concurrent users.
