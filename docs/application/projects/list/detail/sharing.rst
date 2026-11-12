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

    Some sharing options may be disabled in the application settings and hidden for individual projects.


Document creation requires a signed-in editor or owner. The Metrics tab is available only when the instance enables the summary report.

Users
=====

Search for a user, add them and choose their project role. The selector shows affiliation where available, which can help distinguish people with similar names. Save the sharing settings to apply changes.


Visible by all other logged-in users
====================================

We can enable the :guilabel:`Visible by other logged-in users` toggle to grant access without listing each user. This applies to other signed-in users. Then, we can also choose what the users can do -- **view**, **comment**, or **edit** the project. We cannot grant **owner** access this way though.

For an example project or :ref:`project template<project-templates>`, choose **view** access if other users should be able to use it without changing it.


Public link
===========

We can enable the :guilabel:`Public link` toggle to grant access to the project to anyone who has the link. We can again choose what they can do -- **view**, **comment**, or **edit** the project. Copy the link and send it to the people we want to collaborate with. They can access the project without a DSW account.

User groups
===========

Add a user group to share the project with its members and choose the group's project role. Group ownership and the role on this project are separate. See :doc:`/application/user-groups/index`.
