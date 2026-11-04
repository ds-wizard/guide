.. _sharing:

Sharing
*******

Project owners can share a project with other DSW users or external collaborators. Open the :guilabel:`Share` button in the project header to change access.

.. figure:: /_static/screenshots/5.0/project-sharing.png
    :figclass: guide-screenshot
    :alt: Project sharing in DSW 5.0
    :width: 480

    Project sharing.

.. NOTE::

    Keep at least one owner with access to the project. Before removing yourself as an owner, give another collaborator Owner access.


The arrow beside :guilabel:`Share` opens sharing information and :guilabel:`Copy link`.

.. figure:: /_static/screenshots/5.0/project-sharing-members.png
    :figclass: guide-screenshot
    :alt: Sharing example with Isaac Newton and Marie Curie (researchers), Nikola Tesla (data steward) and Research Team
    :width: 480

    Sharing with researchers, a data steward and a user group.

Changes made in the sharing modal are saved after clicking :guilabel:`Save`. We can close the modal without saving by clicking :guilabel:`Cancel`.

Project Roles
=============

Project sharing roles apply to this project. They are separate from instance-wide :ref:`roles <roles>`, which can also grant access to all projects.


.. list-table::
   :header-rows: 1

   * - —
     - Viewer
     - Commenter
     - Editor
     - Owner
   * - View project
     - ✔
     - ✔
     - ✔
     - ✔
   * - Metrics
     - ✔
     - ✔
     - ✔
     - ✔
   * - Preview
     - ✔
     - ✔
     - ✔
     - ✔
   * - View documents
     - ✔
     - ✔
     - ✔
     - ✔
   * - Comment on project
     - —
     - ✔
     - ✔
     - ✔
   * - Change answers
     - —
     - —
     - ✔
     - ✔
   * - TODOs
     - —
     - —
     - ✔
     - ✔
   * - Version history
     - —
     - —
     - ✔
     - ✔
   * - Create documents
     - —
     - —
     - ✔
     - ✔
   * - Editor notes
     - —
     - —
     - ✔
     - ✔
   * - Name, rename or delete a named version
     - —
     - —
     - —
     - ✔
   * - Revert to an earlier version
     - —
     - —
     - —
     - ✔
   * - Sharing settings
     - —
     - —
     - —
     - ✔
   * - Project settings
     - —
     - —
     - —
     - ✔


.. NOTE::

    Some of the following options might be globally disabled in the application settings for the whole DSW, therefore not visible on the project level.


Document creation requires a signed-in editor or owner. The Metrics tab is available only when the instance enables the summary report.

Users
=====

Search for a user, add them and choose their project role. The selector shows affiliation where available, which can help distinguish people with similar names. Save the sharing settings to apply changes.


Visible by all other logged-in users
====================================

We can enable the :guilabel:`Visible by other logged-in users` toggle to grant access without listing each user. This applies to other signed-in users. Then, we can also choose what the users can do -- **view**, **comment**, or **edit** the project. We cannot grant **owner** access this way though.

This can be useful, when we want to have an example project accessible by everybody. We can simply enable this and choose that other users can **view** the project. We also want to set this up when we create a :ref:`project template<project-templates>`.


Public link
===========

We can enable the :guilabel:`Public link` toggle to grant access to the project to anyone who has the link. We can again choose what they can do -- **view**, **comment**, or **edit** the project. Also, the public link is visible there, so we can simply copy it and send to whoever we want to collaborate with. Then, they don't need a DSW account and still be able to access our project.

User groups
===========

Add a user group to share the project with its members and choose the group's project role. Group ownership and the role on this project are separate. See :doc:`/application/user-groups/index`.
