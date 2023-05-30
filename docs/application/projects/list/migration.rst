.. _project-migration:

Project Migration
*****************

Every project is based on a specific :ref:`knowledge model<knowledge-model>`, its version, and selected tags. Sometimes, we might want to change the knowledge model to a different version (for example, when a new version is released), change the knowledge model (for example, when a new customization is created), or just change the tag selection. Project migration is a process where we can do this.

The following video explains all aspects of Project Migration.

.. youtube:: E5bXIWvhNKw
    :width: 100%
    :align: center


Creating a Project Migration
============================

We can start a project migration either from the :ref:`project list<project-list>`, or from the :ref:`project settings<project-settings>`. Sometimes, when there is a newer version of the knowledge model available, we can see a tag :guilabel:`update available` next to the project name. We can click on the tag to start the migration as well.

.. figure:: migration/create.png
    
    Choosing a new knowledge model for the project when creating a project migration.



We can see the **original knowledge model**, its **version**, and selected **question tags** on the left side. On the right side we can choose new values for all of these. After we are satisfied with our selection we can click on :guilabel:`Create` button.

Note that the original project will remain unchanged until the migration is finished. So we can cancel it anytime before it is finsihed without affecting the project.

Project Migration
=================

The next screen is the project migration itself. We can go through all the changes between the orignal and the new knowledge model that affects our answers. During this process, we can also add :ref:`todos<todos>` if we want to come back to a specific question later, after the migration. 

.. figure:: migration/migration.png
    
    Reviewing changes during the project migration.


It is possible that there are no changes to review. This can happen when we don't have all the answers in the questionnaire yet and those we have are not affected by the changes, i.e., all of the questions that we answered are in the original and in the new knowledge model.

We can leave the migration at any point now and come back to it later. We will see the project twice in the :ref:`project list<project-list>`, one of them tagged as :guilabel:`migrating`. If we open the migrating one, we can come back to the project migration. If we open the other one, we can access the original project, however, only in the read-only mode until the migration is finished or cancelled.


Cancelling a Project Migration
==============================

At any point before we finalize the migration, we can decide that we actually don't want to do the migration. We can simply navigate to the :ref:`project list<project-list>` and choose the :guilabel:`Cancel migration` action on the project tagged as :guilabel:`migrating`. This will cancel the migration and the original project will remain unaffected.

Finishing a Project Migration
=============================

After we resolve all the changes (or if there are no changes to review), we can click on :guilabel:`Finalize migration`. This will complete the project migration applying all the knowledge model changes, and unlocking the project from the read-only mode.