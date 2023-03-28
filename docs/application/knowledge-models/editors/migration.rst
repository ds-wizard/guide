.. _knowledge-model-migration:

Knowledge Model Migration
*************************

Knowledge model can be created either from scratch or based on existing one and further modified. If that happened, we can call the original **Parent KM** and the modification **Child KM**. We can create the Child KM any :ref:`published version <knowledge-model-publish>` of the Parent KM, make some modification and publish a version of the Child KM. However, the Parent KM can evolve, and at some point we might want to have those changes in our Child KM, too.

That is what the knowledge model migration is for. Once a new version of the Parent KM is published, we can start the KM migration where we go through these changes. We can choose whether we want to apply or reject these modification to our Child KM during migration. At the end, we publish a new version of the Child KM with all the selected changes.


.. figure:: migration/km-migration.png
    
    Schematic representation of KM migration.


Creating a Knowledge Model Migration
====================================

We can start the knowledge model migration from the :ref:`list of knowledge model editors<knowledge-model-editors>`. If there is a newer version of the Parent KM available for particular knowledge model editor, we can see the :guilabel:`update available` badge next to the name of the editor. 

.. figure:: migration/update-available.png
    :width: 476
    
    Badge indicating that there is a newer version of the Parent KM.


We can either click on the badge directly, or choose :guilabel:`Upgrade` option from the dropdown menu. It will open a modal window where we can choose a new version of the Parent KM that we want to migrate our Child KM to. Usually, we want to pick the latest.


.. figure:: migration/create-migration-modal.png
    :width: 500
    
    Modal window to create a new knowledge model migration.


Knowledge Model Migration
=========================

During the migration, we can see all the changes one by one and can choose whether we want to :guilabel:`Apply` or :guilabel:`Reject` the change. We can also choose to :guilabel:`Apply all` if we simply want everything.


.. figure:: migration/migration.png
    
    During the migration we can apply or reject the changes form the Parent KM.


Cancelling a Knowledge Model Migration
======================================

We can cancell the knowledge model migration at any point before we publish the new version of the Child KM. We need to navigate to the :ref:`list of knowledge model editors<knowledge-model-editors>` and choose :guilabel:`Cancel migration` from the dropdown menu for the desired KM editor.


Finishing a Knowledge Model Migration
=====================================

After we resolve all the changes, we are ready to publish the new version of the Child KM. To do that, we need to click on the :guilabel:`Publish →` button. This will open the Publish new version screen where we need to provide additional information for the new version of the Knowledge Model.

The publish screen shows us some information about the knowledge model, such as it's **Knowledge Model Name** and **Knowledge Model ID**. We need to choose the new **version number**.

.. NOTE::

    We recommended using similar approach as in `semantic versioning <https://semver.org>`_. So when we have a version ``<major>.<minor>.<patch>``, change in the major version number indicates some breaking changes (deleting questions, significant changes in the questionnaire structure, etc.), change in minor version number indicates some new changes that are backwards compatible (i.e., adding a new question), and change in the patch version number indicate some fixes (such as fixing some typos).


Then we need to add some additional metadata (these fields are pre-filled if there was a previous version published):

- **License** - this is used when we want to share the knowledge model with other people so they know how they can do that. We recommend using a license identifier from `SPDX Licens List <https://spdx.org/licenses/>`_.
- **Description** - this should be really short and descriptive. It is used, for example, in select boxes when creating a new project to help researchers choose the best knowledge model for their use case.
- **Readme** - this is where we can describe everything we need about the knowledge model. We can, for example, include a changelog of what changed in what version, etc. We can use :ref:`Markdown<markdown>` in this field to provide some nice formatting.
