.. _roles:

Roles
*****

Roles define what users can do across the |project_name| instance. Each user has one global role. The role contains a set of permissions, such as whether the user can manage users, configure settings, work with knowledge models, or access all projects.

Default Roles
=============

New |project_name| instances include default roles for the usual workflows:

- **Researcher** for users who mainly create and work on their own projects.
- **Data Steward** for users who prepare content such as knowledge models, document templates, and project templates.
- **Admin** for users who manage the instance.

The **Admin** role is special. It has all permissions available in role management and cannot be changed or deleted. Other default roles can be adjusted or deleted if they are not assigned to users and are not configured as the default role for new users.

Custom Roles
============

Users with permission to manage settings can create custom roles when the default roles do not match the way an organization works. A role has a name, an optional description, and selected permissions.

Custom roles are useful for cases such as:

- a data support role that can view or comment on all projects
- a user-management role that can manage users without managing settings
- an analytics role that can access reporting without broader administration access
- a content-management role that can work with knowledge models or document templates

.. TODO::

    Add a screenshot of the roles list showing default roles, custom roles, and the number of users assigned to each role.

Role Permissions
================

Permissions are grouped by the type of work they enable. The available groups depend on the |project_name| edition and enabled features.

Project-related permissions can allow a role to:

- manage project templates
- view all projects
- comment on all projects
- edit all projects
- manage all projects

Content-related permissions can allow a role to:

- create and use knowledge model editors
- manage knowledge models
- manage knowledge model secrets
- create and use document template editors
- manage document templates
- manage locales

Administration permissions can allow a role to:

- manage users
- manage settings
- manage automations
- access audit log
- access integration hub
- access analytics

.. TODO::

    Add a screenshot of the role create/edit form with permission groups and toggles visible.

Global Roles and Project Sharing
================================

Global roles and :ref:`project sharing<sharing>` are related but separate.

Project sharing controls access to a specific project. It is used for inviting collaborators as viewers, commenters, editors, or owners.

Global role permissions can grant access across projects. For example, a role may allow a user to view, comment on, edit, or manage all projects in the instance. In that case, the user does not need to be listed explicitly in every project's sharing settings for that level of access.

Project sharing is still used to manage collaboration inside a specific project, especially for project ownership and external/public access.

Editing Roles
=============

When a role is changed, users assigned to that role receive the updated permissions. Before changing a role, check how many users are assigned to it.

A role cannot be deleted if it is assigned to users. A role also cannot be deleted if it is configured as the :ref:`default role<authentication>` for new users.

.. TODO::

    Add a screenshot of a role detail page or edit form showing a role that cannot be deleted because it is assigned to users.
