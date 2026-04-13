.. _local-deployment-quickstart:

Local Deployment Quickstart
***************************

This is a quick way to evaluate |project_name| locally. It uses the ``dsw-deployment-example`` repository and is intended for local testing, demos, and proof-of-concept setups.


What You Get
============

The example stack includes these services:

.. list-table::
    :widths: 20 80
    :header-rows: 1

    * - Service
      - Purpose
    * - ``client``
      - Web application on ``http://localhost:8080/wizard``
    * - ``server``
      - Main backend API on ``http://localhost:3000``
    * - ``docworker``
      - Document generation and preview processing
    * - ``mailer``
      - Mail service container; actual email delivery requires SMTP configuration
    * - ``postgres``
      - Relational database
    * - ``garage``
      - S3-compatible object storage used for files and generated documents


Prerequisites
=============

Before starting, make sure you have:

- Docker with Docker Compose support
- the local ports ``8080``, ``3000``, ``5432``, ``9000``, and ``9003`` available
- permission to run Docker containers on your machine


Run the Example Stack
=====================

Open the ``dsw-deployment-example`` directory and run:

.. code-block:: bash

    cp example.env .env
    docker compose up -d
    ./create-bucket.sh

Then open:

- ``http://localhost:8080/wizard``

Default test users:

- ``albert.einstein@example.com`` / ``password`` (Administrator)
- ``nikola.tesla@example.com`` / ``password`` (Data Steward)
- ``isaac.newton@example.com`` / ``password`` (Researcher)

The ``create-bucket.sh`` step is important. It bootstraps the local Garage node, creates the bucket if needed, imports the S3 key, and grants permissions required by the application. It is intended to be safe to rerun for this local setup.

.. TODO::

    Add a screenshot of the local login page or landing page opened at ``http://localhost:8080/wizard`` after a successful startup. This should reassure evaluators that they are looking at the expected local instance.


Why the Example Uses Garage
===========================

|project_name| needs S3-compatible storage for generated documents, uploaded files, and document template assets. The example stack uses Garage and points the application to ``http://host.docker.internal:9000`` so that browser-facing presigned URLs work in a local Docker environment.


Quick Verification
==================

After startup, these commands are a good first check:

.. code-block:: bash

    docker compose ps
    docker compose logs garage --tail=100
    docker compose logs server --tail=100
    docker compose logs docworker --tail=100

In the application, verify that you can:

1. sign in
2. create or open a project
3. upload a file
4. open a preview
5. generate and download a document

.. TODO::

    Add a screenshot of a successful local smoke test, for example a project with generated documents visible. This should show what "working" looks like after the stack starts.


Before Reusing This Outside Local Testing
=========================================

This example is not production-ready. Before sharing or adapting it for a real environment, change or add at least the following:

- all default passwords, secrets, and keys
- persistent storage for PostgreSQL and Garage
- an HTTPS reverse proxy
- restricted exposure of PostgreSQL and Garage ports
- backup and update procedures


Where to Dive Deeper
====================

- :ref:`deployment`
- :doc:`../more/self-hosted-dsw/configuration/configuration`
- :doc:`../more/self-hosted-dsw/faq-notes`
