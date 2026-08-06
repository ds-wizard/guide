************
Contributing
************

Interested in contributing to the DSW development?

----

Ideas
=====

If you have some idea (feature request) how to extend the DS Wizard, you can add it to our `Ideas website <https://ideas.ds-wizard.org/>`__ or you can send us an email at `support@ds-wizard.org <support@ds-wizard.org>`__.

Reporting
=========

Bugs
----

In case you find some bug, please `create an issue <https://github.com/ds-wizard/ds-wizard/issues/new/choose>`__ and provide requested information or contact us via email `support@ds-wizard.org <support@ds-wizard.org>`__.

Vulnerabilities
---------------

If you find an security issue within DSW, please `create appropriate issue <https://github.com/ds-wizard/ds-wizard/issues/new/choose>`__. However, never include sensitive information in the issue as it is publicly available. Such information (e.g. logs) send to us via e-mail `support@ds-wizard.org <support@ds-wizard.org>`__.

Development
===========

Our projects are open source and you can contribute via GitHub (fork and pull request):

* https://github.com/ds-wizard
* https://github.com/ds-wizard/engine-backend
* https://github.com/ds-wizard/engine-frontend
* https://github.com/ds-wizard/document-worker
* https://github.com/ds-wizard/dsw-tdk

.. NOTE::

    Carefully read README and CONTRIBUTING files (if present) and also try to contact the main developer of the project for further details. You should follow the same code style, be DRY, and fit our overall architectures and structuring.

Test Policy
===========

Testing is essential to ensure the successful construction and implementation of DSW. It is necessary to keep tests updated together with new features and other changes in the code.

Each component may use its own test suite (unit tests, acceptance tests, integration tests), which shall be described in the CONTRIBUTING file within the corresponding repository. To test all components together, we have the `E2E test suite <https://github.com/ds-wizard/dsw-e2e-tests>`__ (Cypress) that tests according to various use cases, i.e., what can a user do within DSW using its web user interface.

Whenever a new feature is developed, it must be covered by tests. For the E2E test suite, a specific sub-task is created in our JIRA when applicable. All components must pass all tests before releasing (including release candidate versions).

The release candidate versions are tested with `OWASP ZAP <https://www.zaproxy.org/>`__. Eventual found vulnerabilities related to the code or dependencies (not deployment) are solved prior to the release or listed in :doc:`./vulnerabilities` if not possible to solve for the release.

In case that a bug is found, it must be analyzed why tests did not find it. If possible and needed, test suites are extended to cover these (and similar) bugs.
