************
Contributing
************

Interested in contributing to the DSW development?

----

Ideas
=====

If you have a feature request for DSW, add it to our `Ideas website <https://ideas.ds-wizard.org/>`__ or you can send us an email at `support@ds-wizard.org <mailto:support@ds-wizard.org>`__.

Reporting
=========

Bugs
----

If you find a bug, `create an issue <https://github.com/ds-wizard/ds-wizard/issues/new/choose>`__ and provide the requested information or contact us via email `support@ds-wizard.org <mailto:support@ds-wizard.org>`__.

Vulnerabilities
---------------

Report security issues privately as described in :doc:`vulnerabilities`. Include the affected component and version, reproduction steps and possible impact. Do not publish sensitive details or logs in a public issue.

Development
===========

Our projects are open source and you can contribute via GitHub (fork and pull request):

* https://github.com/ds-wizard
* https://github.com/ds-wizard/wizard-server
* https://github.com/ds-wizard/engine-frontend
* https://github.com/ds-wizard/engine-tools — document worker, mailer, TDK and rendering libraries

.. NOTE::

    Carefully read README and CONTRIBUTING files (if present) and also try to contact the main developer of the project for further details. You should follow the same code style, be DRY, and fit our overall architectures and structuring.

Test Policy
===========

Keep tests up to date as features and behavior change.

Each component may use its own test suite (unit tests, acceptance tests, integration tests), which shall be described in the CONTRIBUTING file within the corresponding repository. To test all components together, we use the `E2E test suite <https://github.com/ds-wizard/dsw-e2e-tests>`__ (Cypress) that tests according to various use cases, i.e., what can a user do within DSW using its web user interface.

Run the checks documented by the component repository and add tests for changed behavior. The repository's CI workflow specifies its automated checks.

For reporting a security problem, follow :doc:`vulnerabilities`.

When fixing a bug, check why the tests missed it and add coverage where appropriate.
