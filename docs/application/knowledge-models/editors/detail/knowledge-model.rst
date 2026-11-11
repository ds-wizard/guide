Knowledge Model
***************

The :guilabel:`Knowledge Model` tab is where we work on the entities (such as questions or answers) that appear in the knowledge model. We define the structure here.

Navigation
==========

In the top row, we can see the breadcrumbs that show us where we are within the knowledge model. This allows us to quickly jump back up in the hierarchy.

The navigation tree on the left shows the model's structure. Use the arrows to expand individual branches, or choose :guilabel:`Expand all` or :guilabel:`Collapse all`.

Select an entity to edit it. The active entity is highlighted in the tree so we can find its parent and child entities.

.. figure:: /_static/screenshots/5.0/km-editor.png
    :figclass: guide-screenshot
    :alt: Knowledge Model Editor in DSW 5.0
    :width: 760

    Knowledge Model Editor.

.. TIP::

    To find an entity by name using the browser search, click on :guilabel:`Expand all` in the navigation tree and use the browser's search.


Editors
========

The main area of the :guilabel:`Knowledge Model` tab is the actual editor. The form fields change based on the entity we edit, but there are some shared actions:

- **Copy UUID** - every entity has a generated UUID, we can use this button to copy it. We usually need it for :ref:`document template development<document-template-development>`.

- **Move** - we can move entities around the knowledge model. However, not every entity can be put under everything. We can open the move modal window and see where the current entity can be moved to.

- **Delete** - remove the entity. This action cannot be undone.

The editor shows different fields for each type of entity:

- :ref:`Knowledge Model<knowledge-model>`
- :ref:`Chapter<chapter>`
- :ref:`Question<question>`
- :ref:`Answer<answer>`
- :ref:`Choice<choice>`
- :ref:`Validation<validation>`
- :ref:`Expert<expert>`
- :ref:`Metric<metric>`
- :ref:`Phase<phase>`
- :ref:`Question Tag<question-tag>`
- :ref:`Integration<integration>`
- :ref:`Resource Collection<resource-collection>`

.. figure:: /_static/screenshots/5.0/km-question.png
    :figclass: guide-screenshot
    :alt: Value question configuration in DSW 5.0
    :width: 760

    Value question configuration.

Besides their own fields, each entity has **Annotations**: arbitrary key-value pairs that can be assigned to the entity and used later, when :ref:`developing a document template<document-template-development>`.

.. figure:: /_static/screenshots/5.0/km-integration.png
    :figclass: guide-screenshot
    :alt: API integration configuration in DSW 5.0
    :width: 760

    API integration configuration.


URL Checker
===========

If we have at least one :ref:`URL Reference<url-reference>` in the knowledge model, a new tab :guilabel:`URL Checker` appears in the knowledge model editor. Here we can check whether each used URL is reachable or not. This allows us to quickly find broken links in the knowledge model and fix them.

.. figure:: /_static/screenshots/5.0/km-url-checker.png
    :figclass: guide-screenshot
    :alt: Knowledge Model URL checker in DSW 5.0
    :width: 760

    Knowledge Model URL checker.

Warnings
========

The editor checks for some possible problems, such as empty title for a chapter or no answers for an options question. If there are any, the :guilabel:`Warnings` tab appears and we can quickly navigate to those problems and fix them.

.. figure:: /_static/screenshots/5.0/km-warnings.png
    :figclass: guide-screenshot
    :alt: Knowledge Model warnings in DSW 5.0
    :width: 760

    Knowledge Model warnings.

Development with Document Template Editor
=========================================
It is possible to develop the knowledge model together with the document template. Any changes to the knowledge model are immediately reflected in the document template editor. In the Preview tab we can also save the current preview answer values to the knowledge model and make them visible in the document template editor.
