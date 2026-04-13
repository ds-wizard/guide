.. _admin-quickstart:

Administrator Quickstart
************************

This page is for administrators who need to turn a fresh |project_name| instance into something safe, usable, and ready for real users.


1. Secure the Deployment First
==============================

Before onboarding users, make sure the instance is not still in demo mode.

- change application secrets, database passwords, and S3 credentials from their defaults
- remove or change the default example users, especially before any public exposure
- place the application behind an HTTPS-capable proxy when the instance is shared beyond local testing
- make PostgreSQL and object storage private to your deployment network unless you have a deliberate reason not to
- enable persistent storage and regular backups for both the database and object storage

If any of these are missing, treat the instance as temporary.


2. Make the Instance Useful on Day One
======================================

A secure instance is not enough; it also needs content and basic communication settings.

- configure organization and look-and-feel settings
- configure mail if users will receive invitations, password resets, or notifications
- register the instance with the DSW Registry
- import the first knowledge models, document templates, and locales your users will need

An empty instance is technically working, but it does not yet support a meaningful user workflow.

.. TODO::

    Add a screenshot of the Administration settings overview, highlighting the navigation for organization details, look and feel, and the DSW Registry connection.


3. Set Up People and Roles
==========================

Decide who will own each layer of the system:

- administrators manage infrastructure, settings, users, and policies
- data stewards manage knowledge models, templates, and institutional guidance
- researchers create and maintain project content

Create named steward accounts early so content ownership is not tied to one admin account.


4. Test the Full User Journey
=============================

Do one complete end-to-end test before announcing the service:

1. Sign in as a normal user.
2. Create a project from a realistic template.
3. Answer a few questions and upload a file.
4. Open the preview and generate a persistent document.
5. Share the project with another user.
6. If mail is enabled, verify that a real email flow works.

This test catches many misconfigurations faster than reading logs in isolation.


5. Decide What Can Wait
=======================

Not every advanced feature needs to be enabled for launch. It is usually reasonable to postpone:

- custom plugins
- submission services
- advanced integrations
- custom locales and deeper branding

Start with the smallest deployment that supports a successful user journey, then expand.


Public Deployment Minimums
==========================

For anything beyond local evaluation, make sure you have at least:

- HTTPS termination with WebSocket support
- private database and storage services
- changed secrets and passwords
- removed default accounts
- backups and a restore plan
- a process for updating images and applying hotfix releases


Where to Dive Deeper
====================

- :doc:`../more/self-hosted-dsw/index`
- :doc:`../more/self-hosted-dsw/deployment`
- :doc:`../more/self-hosted-dsw/configuration/index`
- :ref:`administration`
