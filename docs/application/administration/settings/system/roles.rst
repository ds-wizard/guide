.. _roles:

Roles
*****

A role defines what a user can do across the DSW instance. Each user has one role. Access granted by a role is separate from the role assigned to a collaborator on an individual project.

Manage roles
============

Open :guilabel:`Settings` → :guilabel:`Roles` with :guilabel:`Manage Roles`. Create a role or open an existing role to change its name and permissions. Save changes to apply them to users assigned to that role.

The Admin role cannot be changed or deleted. A role cannot be deleted while it is assigned to users or selected as the default role. Use :guilabel:`Set as default` to choose the role new users receive.

Permissions
===========

.. list-table::
   :header-rows: 1
   :widths: 30 50 20

   * - Permission
     - Available actions
     - Also requires
   * - Create Projects
     - Create projects using the methods enabled in Project settings
     - —
   * - Manage Project Templates
     - Mark projects as templates; with Create Projects, create from a knowledge model even when normal creation is restricted to templates
     - —
   * - View ALL Projects
     - View projects independently of sharing settings
     - —
   * - Comment on ALL Projects
     - Comment on any project
     - View ALL Projects
   * - Edit ALL Projects
     - Edit any project
     - View and Comment on ALL Projects
   * - Manage ALL Projects
     - Manage any project with owner-level access
     - View, Comment and Edit ALL Projects
   * - Manage Knowledge Models
     - Import, export, deprecate, delete and set public visibility; manage integration secrets
     - —
   * - Use Knowledge Model Editor
     - Create, edit, migrate and publish knowledge models
     - Manage Knowledge Models
   * - Manage Document Templates
     - Import, export, deprecate and delete templates
     - —
   * - Use Document Template Editor
     - Create, edit and publish templates
     - Manage Document Templates
   * - Manage Users
     - Manage accounts and their assigned roles
     - —
   * - Manage Roles
     - Create, edit and delete roles; choose the default role
     - —
   * - Create User Groups
     - Create groups for project collaboration
     - —
   * - Manage User Groups
     - Manage all groups, including groups we do not own
     - —
   * - Manage Settings
     - Manage application settings, translations and plugins
     - —

A project shared with a person or group can grant access even when their role does not grant access to all projects. Conversely, ALL Projects permissions grant access without an explicit project invitation. See :doc:`/application/projects/list/detail/sharing`.


.. figure:: /_static/screenshots/5.0/settings-roles.png
    :figclass: guide-screenshot
    :alt: Roles and default role in DSW 5.0
    :width: 760

    Roles and default role.

.. figure:: /_static/screenshots/5.0/role-create.png
    :figclass: guide-screenshot
    :alt: Custom role editor showing project creation and organization-wide project permissions
    :width: 676

    Project permissions in a custom role.

Examples of custom roles
========================

A support role can receive view or comment access to projects, a content role can prepare knowledge models and document templates, and a user-management role can manage accounts. Choose the actual permissions and their prerequisites from the matrix above rather than relying on a role's name.

Before changing a role, review the people assigned to it. The changed permissions apply to those accounts. Use project sharing for access to a particular project, alongside the wider permissions granted by roles.
