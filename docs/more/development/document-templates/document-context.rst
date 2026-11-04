.. _document-context:

Document Context
****************

.. NOTE::

    This page describes the document context of metamodel version **19.0**, used since DSW 5.0. For changes from earlier versions, see :ref:`document-template-metamodel-versions`.

Document context is an object that carries all information needed to produce a document. It comes either from a project or from a knowledge model editor (for its preview), so exactly one of ``project`` and ``knowledgeModelEditor`` is set. The content, such as replies, is in ``questionnaire`` in both cases. To investigate it, it is the best to use *Questionnaire Report* template with ``JSON`` format. The core fields are:

* ``config`` = object with DSW configuration related to documents
   * ``appTitle`` = optional title of the application
   * ``clientUrl`` = for referring to the DSW instance
   * ``logoUrl`` = optional URL of the logo
   * ``primaryColor`` = optional primary color
* ``document`` = object with the details about the document, ``null`` in a context fetched using API
   * ``createdAt`` = when the document was created (initial creation, not final generation of the document)
   * ``createdBy`` = optional user that created the document
   * ``documentTemplate`` = document template used for the document (``uuid``, ``id``, and ``version``)
   * ``eventUuid`` = optional UUID of the project event the document was generated at
   * ``format`` = format in the document template (``uuid`` and ``name``)
   * ``language`` = optional language requested for the document
   * ``locale`` = optional document template locale used for the translations
   * ``name`` = name of the document (entered when creating, not file name)
   * ``preview`` = whether it is a temporary document (preview), not a stored one
   * ``uuid``
* ``extras`` = additional data added by document worker if requested
* ``hash`` = hash of the context content in the ``sha256:...`` form, the same data always give the same hash
* ``knowledgeModel`` = object describing used KM
   * ``annotations`` = list of key-value annotations of KM top-level entity
   * ``chapterUuids`` = list of UUIDs for chapters (ordered)
   * ``integrationUuids`` = list of UUIDs for integrations (ordered)
   * ``metricUuids`` = list of UUIDs for metrics (ordered)
   * ``phaseUuids`` = list of UUIDs for phases (ordered)
   * ``resourceCollectionUuids`` = list of UUIDs for resource collections (ordered)
   * ``tagUuids`` = list of UUIDs for tags (ordered)
   * ``entities`` = contains ``questions``, ``answers``, and other maps with UUID-entity pairs
   * ``uuid`` = UUID of the knowledge model
* ``knowledgeModelEditor`` = object representing the knowledge model editor, ``null`` for a project
   * ``createdAt`` and ``updatedAt``
   * ``createdBy`` = optional user who created the editor
   * ``description``
   * ``id`` and ``version`` = of the knowledge model being edited
   * ``knowledgeModelMetamodelVersion``
   * ``license``
   * ``name``
   * ``previousPackageId``, ``previousPackageUuid``, and ``previousPackageVersion`` = optional previous package
   * ``readme``
   * ``uuid``
* ``knowledgeModelPackage`` = object with metadata about the KM package such as ``id``, ``version``, ``name``, or ``description``, ``null`` for a KM editor without a previous package
* ``metamodelVersion`` = metamodel version of the document context (document template metamodel version)
* ``project`` = object representing the project, ``null`` for a KM editor
   * ``createdAt`` = when the project was created
   * ``createdBy`` = optional original author who created the project
   * ``description`` = optional description of the project
   * ``documentTemplateUuid`` and ``formatUuid`` = optional default document template and format
   * ``groups`` = groups with access to the project (each entry contains ``perms`` list and ``group`` object)
   * ``isTemplate`` = whether the project is a project template
   * ``knowledgeModelPackageUuid`` = UUID of the KM package used by the project
   * ``name`` = name of the project
   * ``projectTags`` = list of project tags
   * ``selectedQuestionTagUuids`` = list of UUIDs of selected question tags
   * ``sharing`` and ``visibility`` = sharing and visibility modes of the project
   * ``updatedAt`` = when the project was last updated
   * ``users`` = users with access to the project (each entry contains ``perms`` list and ``user`` object)
   * ``uuid`` = UUID of the project
* ``questionnaire`` = object with the content of the project or the KM editor preview
   * ``files`` = list of project files (each has ``uuid``, ``fileName``, ``fileSize``, and ``contentType``)
   * ``labels`` = path-list map of labels on questions (i.e. TODOs)
   * ``language`` = optional language code of the project or the KM editor
   * ``phaseUuid`` = UUID of the current phase selected
   * ``replies`` = path-object map of replies to questions
   * ``report`` = object that contains report with computed information about number of answered questions as well as metric values
   * ``versionUuid`` = optional UUID of the current version
   * ``versions`` = ordered list of versions (objects with details)

This structure is provided to a Jinja template in :doc:`steps/jinja` and outputted from :doc:`steps/json`. We can use the JSON step to observe the actual content of the document context (structure as well as the values). We can also check :doc:`../metamodel-schemas`.

We can fetch a real context using ``GET /projects/{uuid}/document-context`` (optionally with ``eventUuid``) and ``GET /knowledge-model-editors/{uuid}/document-context``, or with the ``get-context`` command of the :doc:`tdk`. The document worker accepts only contexts of major version 19.

.. _document-context-obj:

Objectified Document Context
============================

It is possible to easily turn the JSON-like / tree-structured document context into objects with additional helper relations, attributes, methods, and many more to ease up the template development:

.. code:: jinja

   {%- set dc = ctx|to_context_obj -%}


-  All data types are using Python, e.g., ``str`` is textual string, ``Optional[str]`` is a string or ``None``, ``list[str]`` is a list of strings.
-  We use ``snake_case`` for naming of attributes and variables, ``PascalCase`` is used for class names.
-  ``datetime`` is the standard `datetime <https://docs.python.org/3/library/datetime.html#datetime-objects>`__ module, supports timezone information.

Guard the code that depends on the source of the context:

.. code:: jinja

   {% if dc.project %}
     {{ dc.project.name }}
   {% elif dc.km_editor %}
     {{ dc.km_editor.name }}
   {% endif %}

Diagram
-------

The structure is visualized on the following class diagrams (right-click and open in a new tab to enlarge). They are generated from the object model and show its attributes and links. An entity without attributes is described on another diagram.

Context
~~~~~~~

The document context with its source, document, users, and report.

.. image:: document-context/context-light.*
   :alt: Class diagram: context of the document context
   :class: only-light

.. only:: html

   .. image:: document-context/context-dark.svg
      :alt: Class diagram: context of the document context
      :class: only-dark

Knowledge model
~~~~~~~~~~~~~~~

The knowledge model and its entities, except for questions.

.. image:: document-context/knowledge-model-light.*
   :alt: Class diagram: knowledge model of the document context
   :class: only-light

.. only:: html

   .. image:: document-context/knowledge-model-dark.svg
      :alt: Class diagram: knowledge model of the document context
      :class: only-dark

Questions
~~~~~~~~~

Question types with their answers and choices.

.. image:: document-context/questions-light.*
   :alt: Class diagram: questions of the document context
   :class: only-light

.. only:: html

   .. image:: document-context/questions-dark.svg
      :alt: Class diagram: questions of the document context
      :class: only-dark

Replies
~~~~~~~

Reply types and what they link to.

.. image:: document-context/replies-light.*
   :alt: Class diagram: replies of the document context
   :class: only-light

.. only:: html

   .. image:: document-context/replies-dark.svg
      :alt: Class diagram: replies of the document context
      :class: only-dark


Entities
--------

Here is an interlinked description of each entity and its attributes and links. There are also *aliases* that are convenient shorthands to make template more concise.

.. _odc-document-context:

DocumentContext
~~~~~~~~~~~~~~~

-  ``config`` (:ref:`odc-context-config`)
-  ``document`` (``Optional[``\ :ref:`odc-document`\ ``]``) - always set when the document worker renders
-  ``hash`` (``str``)
-  ``km`` (:ref:`odc-knowledge-model`)
-  ``km_editor`` (``Optional[``\ :ref:`odc-km-editor`\ ``]``) - set for a KM editor, ``None`` for a project
-  ``km_package`` (``Optional[``\ :ref:`odc-km-package`\ ``]``) - ``None`` for a KM editor without a previous package
-  ``project`` (``Optional[``\ :ref:`odc-project`\ ``]``) - set for a project, ``None`` for a KM editor
-  ``questionnaire`` (:ref:`odc-questionnaire`)


.. _odc-context-config:

ContextConfig
~~~~~~~~~~~~~

- ``app_title`` (``str``) - passed by backend from Settings
- ``client_url`` (``str``) - base URL of the DSW instance (client app)
- ``logo_url`` (``str``) - passed by backend from Settings + default in deployment config
- ``primary_color`` (:ref:`odc-color`) - passed by backend from Settings + default in deployment config
- ``service_domain_name`` (``str``) - deployment config (ds-wizard.org)
- ``service_name`` (``str``) - deployment config (Data Stewardship Wizard)
- ``service_name_short`` (``str``) - deployment config (DSW)
- ``service_url`` (``str``) - deployment config (https://ds-wizard.org)


.. _odc-color:

Color
~~~~~

- ``red``, ``green``, ``blue`` (``int``)
- ``hex`` (``str``) - e.g. ``#0033aa``, it is also the string value of a color
- ``luminance`` (``float``)
- ``is_dark``, ``is_light`` (``bool``)
- ``contrast_color`` (:ref:`odc-color`) - white if its contrast ratio with this color is above 3, otherwise black


.. _odc-document:

Document
~~~~~~~~

-  ``uuid`` (``str``)
-  ``name`` (``str``)
-  ``document_template`` (:ref:`odc-document-document-template`)
-  ``format`` (:ref:`odc-document-format`)
-  ``language`` (``Optional[str]``) - language requested for the document
-  ``locale`` (``Optional[``\ :ref:`odc-document-template-locale`\ ``]``) - locale used for the translations
-  ``preview`` (``bool``) - a temporary document (preview), not a stored one
-  ``event_uuid`` (``Optional[str]``) - the project event the document was generated at
-  ``created_by`` (``Optional[``\ :ref:`odc-user`\ ``]``)
-  ``created_at`` (``datetime``)


.. _odc-document-document-template:

DocumentDocumentTemplate
^^^^^^^^^^^^^^^^^^^^^^^^

-  ``uuid`` (``str``)
-  ``id`` (``str``)
-  ``version`` (``str``)


.. _odc-document-format:

DocumentFormat
^^^^^^^^^^^^^^

-  ``uuid`` (``str``)
-  ``name`` (``str``)


.. _odc-document-template-locale:

DocumentTemplateLocale
^^^^^^^^^^^^^^^^^^^^^^

-  ``uuid`` (``str``)
-  ``name`` (``str``)
-  ``code`` (``str``) - language code from the ``Language`` header of the locale PO file
-  ``created_at`` (``datetime``)
-  ``updated_at`` (``datetime``)


.. _odc-km-package:

KnowledgeModelPackage
~~~~~~~~~~~~~~~~~~~~~

-  ``uuid`` (``str``)
-  ``id`` (``str``) - the ID alone, e.g. ``dsw.root``, without the version
-  ``version`` (``str``)
-  ``name`` (``str``)
-  ``description`` (``str``)
-  ``language`` (``str``)
-  ``created_at`` (``datetime``)

Notes:

-  Use ``dc.km_package.id ~ ':' ~ dc.km_package.version`` for the full reference.


.. _odc-project:

Project
~~~~~~~

Metadata of the project, its content is in :ref:`odc-questionnaire`.

-  ``uuid`` (``str``)
-  ``name`` (``str``)
-  ``description`` (``str``)
-  ``visibility`` (``str``) - e.g. ``PrivateProjectVisibility``
-  ``sharing`` (``str``) - e.g. ``RestrictedProjectSharing``
-  ``is_template`` (``bool``)
-  ``knowledge_model_package_uuid`` (``str``)
-  ``selected_question_tag_uuids`` (``list[str]``)
-  ``project_tags`` (``list[str]``)
-  ``document_template_uuid`` (``Optional[str]``) - default document template of the project
-  ``format_uuid`` (``Optional[str]``) - default format of the project
-  ``users`` (``list[``\ :ref:`odc-user-perm`\ ``]``)
-  ``groups`` (``list[``\ :ref:`odc-group-perm`\ ``]``)
-  ``created_by`` (``Optional[``\ :ref:`odc-user`\ ``]``)
-  ``created_at`` (``datetime``)
-  ``updated_at`` (``datetime``)


.. _odc-km-editor:

KnowledgeModelEditor
~~~~~~~~~~~~~~~~~~~~

-  ``uuid`` (``str``)
-  ``name`` (``str``)
-  ``description`` (``str``)
-  ``id`` (``str``) - of the knowledge model being edited
-  ``version`` (``str``) - of the knowledge model being edited
-  ``license`` (``str``)
-  ``readme`` (``str``)
-  ``previous_package_uuid`` (``Optional[str]``)
-  ``previous_package_id`` (``Optional[str]``)
-  ``previous_package_version`` (``Optional[str]``)
-  ``knowledge_model_metamodel_version`` (``int``)
-  ``created_by`` (``Optional[``\ :ref:`odc-user`\ ``]``)
-  ``created_at`` (``datetime``)
-  ``updated_at`` (``datetime``)


.. _odc-questionnaire:

Questionnaire
~~~~~~~~~~~~~

Content of the project, or of the preview questionnaire of a KM editor.

-  ``replies`` (:ref:`odc-replies-container`)
-  ``phase`` (:ref:`odc-phase`) - the current phase, a phase titled ``never`` if none is set
-  ``phase_uuid`` (``Optional[str]``)
-  ``version`` (``Optional[``\ :ref:`odc-project-version`\ ``]``)
-  ``versions`` (``list[``\ :ref:`odc-project-version`\ ``]``)
-  ``files`` (``dict[str, ProjectFile]``) - see :ref:`odc-project-file`
-  ``labels`` (``dict[str, list[str]]``) - label UUIDs by reply path
-  ``todos`` (``list[str]``) - reply paths marked as TODO
-  ``report`` (:ref:`odc-report`)
-  ``language`` (``Optional[str]``)


.. _odc-project-file:

ProjectFile
~~~~~~~~~~~

-  ``uuid`` (``str``)
-  ``name`` (``str``)
-  ``size`` (``int``)
-  ``content_type`` (``str``)
-  ``reply`` (``Optional[``\ :ref:`odc-file-reply`\ ``]``)
-  ``download_url`` (``str``)
-  ``project_uuid`` (``Optional[str]``) - UUID of the project or the KM editor


.. _odc-project-version:

ProjectVersion
~~~~~~~~~~~~~~

-  ``uuid`` (``str``)
-  ``event_uuid`` (``str``)
-  ``name`` (``str``)
-  ``description`` (``str``)
-  ``created_by`` (``Optional[``\ :ref:`odc-simple-author`\ ``]``)
-  ``created_at`` (``datetime``)
-  ``updated_at`` (``datetime``)


.. _odc-user:

User
~~~~

-  ``uuid`` (``str``)
-  ``first_name`` (``str``)
-  ``last_name`` (``str``)
-  ``email`` (``str``)
-  ``image_url`` (``Optional[str]``)
-  ``affiliation`` (``Optional[str]``)
-  ``created_at`` (``datetime``)
-  ``updated_at`` (``datetime``)


.. _odc-user-group:

UserGroup
~~~~~~~~~

-  ``uuid`` (``str``)
-  ``name`` (``str``)
-  ``description`` (``Optional[str]``)
-  ``private`` (``bool``)
-  ``members`` (``list[``\ :ref:`odc-user-group-member`\ ``]``)
-  ``created_at`` (``datetime``)
-  ``updated_at`` (``datetime``)


.. _odc-user-group-member:

UserGroupMember
~~~~~~~~~~~~~~~

-  ``uuid`` (``str``)
-  ``first_name`` (``str``)
-  ``last_name`` (``str``)
-  ``gravatar_hash`` (``str``)
-  ``image_url`` (``Optional[str]``)
-  ``membership_type`` (``str``) - one of: ``member``, ``owner``


.. _odc-simple-author:

SimpleAuthor
~~~~~~~~~~~~

-  ``uuid`` (``str``)
-  ``first_name`` (``str``)
-  ``last_name`` (``str``)
-  ``image_url`` (``Optional[str]``)
-  ``gravatar_hash`` (``Optional[str]``)


.. _odc-user-perm:

UserPermission
~~~~~~~~~~~~~~

- ``user`` (:ref:`odc-user`)
- ``permissions`` (``list[str]``) - contains: ``VIEW``, ``COMMENT``, ``EDIT``, ``ADMIN``

Helpers:

- is_viewer (``bool``)
- is_commenter (``bool``)
- is_editor (``bool``)
- is_owner (``bool``)


.. _odc-group-perm:

UserGroupPermission
~~~~~~~~~~~~~~~~~~~

- ``group`` (:ref:`odc-user-group`)
- ``permissions`` (``list[str]``) - contains: ``VIEW``, ``COMMENT``, ``EDIT``, ``ADMIN``

Helpers:

- is_viewer (``bool``)
- is_commenter (``bool``)
- is_editor (``bool``)
- is_owner (``bool``)


.. _odc-report:

Report
~~~~~~

-  ``total_report`` (:ref:`odc-report-item`)
-  ``chapter_reports`` (``list[``\ :ref:`odc-report-item`\ ``]``)


.. _odc-report-item:

ReportItem
^^^^^^^^^^

-  ``indications`` (``list[``\ :ref:`odc-report-indication`\ ``]``)
-  ``metrics`` (``list[``\ :ref:`odc-report-metric`\ ``]``)
-  ``chapter`` (``Optional[``\ :ref:`odc-chapter`\ ``]``) - set if it is a chapter report


.. _odc-report-indication:

ReportIndication
^^^^^^^^^^^^^^^^

-  ``indication_type`` (``str``) - one of: ``PhasesAnsweredIndication``, ``AnsweredIndication`` (use alias)
-  ``answered`` (``int``) - number of answered questions
-  ``unanswered`` (``int``) - number of unanswered questions

Aliases:

-  ``total`` (``int``) - ``answered`` + ``unanswered``
-  ``percentage`` (``float``) - ``answered`` / ``total`` (handles zero division, number between ``0.0`` and ``1.0``)
-  ``is_for_phase`` (``bool``) - if it is a phase-related indication
-  ``is_overall`` (``bool``) - if it is an overall indication (not phase-related)


.. _odc-report-metric:

ReportMetric
^^^^^^^^^^^^

-  ``measure`` (``Optional[float]``) - number between ``0.0`` and ``1.0``, ``None`` if nothing answered contributes to it
-  ``metric`` (``Optional[``\ :ref:`odc-metric`\ ``]``)


.. _odc-knowledge-model:

KnowledgeModel
~~~~~~~~~~~~~~

-  ``uuid`` (``str``)
-  ``annotations`` (``dict[str,str]``)
-  ``entities`` (:ref:`odc-knowledge-model-entities`)
-  ``chapters`` (``list[``\ :ref:`odc-chapter`\ ``]``)
-  ``integrations`` (``list[``\ :ref:`odc-integration`\ ``]``)
-  ``metrics`` (``list[``\ :ref:`odc-metric`\ ``]``)
-  ``phases`` (``list[``\ :ref:`odc-phase`\ ``]``)
-  ``resource_collections`` (``list[``\ :ref:`odc-resource-collection`\ ``]``)
-  ``tags`` (``list[``\ :ref:`odc-tag`\ ``]``)

Aliases:

-  ``e`` (:ref:`odc-knowledge-model-entities`) - same as ``entities``
-  ``a`` (``dict[str,str]``) - same as ``annotations``


Notes:

-  Equality of all KM entities is being done using the ``uuid`` comparison under the hood.
-  All KM entities that have ``annotations`` have also the ``a`` alias.
-  An annotation value is a list of strings if the key is used more than once.


.. _odc-knowledge-model-entities:

KnowledgeModelEntities
^^^^^^^^^^^^^^^^^^^^^^

Container holding all types of Knowledge Model entities within UUID-key
dictionaries:

-  ``answers`` (``dict[str,``\ :ref:`odc-answer`\ ``]``)
-  ``chapters`` (``dict[str,``\ :ref:`odc-chapter`\ ``]``)
-  ``choices`` (``dict[str,``\ :ref:`odc-choice`\ ``]``)
-  ``experts`` (``dict[str,``\ :ref:`odc-expert`\ ``]``)
-  ``integrations`` (``dict[str,``\ :ref:`odc-integration`\ ``]``)
-  ``metrics`` (``dict[str,``\ :ref:`odc-metric`\ ``]``)
-  ``phases`` (``dict[str,``\ :ref:`odc-phase`\ ``]``)
-  ``questions`` (``dict[str,``\ :ref:`odc-question`\ ``]``)
-  ``references`` (``dict[str,``\ :ref:`odc-reference`\ ``]``)
-  ``resource_collections`` (``dict[str,``\ :ref:`odc-resource-collection`\ ``]``)
-  ``resource_pages`` (``dict[str,``\ :ref:`odc-resource-page`\ ``]``)
-  ``tags`` (``dict[str,``\ :ref:`odc-tag`\ ``]``)


.. _odc-chapter:

Chapter
^^^^^^^

-  ``uuid`` (``str``)
-  ``title`` (``str``)
-  ``text`` (``Optional[str]``) - possibly Markdown text
-  ``questions`` (``list[``\ :ref:`odc-question`\ ``]``)
-  ``reports`` (``list[``\ :ref:`odc-report-item`\ ``]``)
-  ``annotations`` (``dict[str,str]``)


.. _odc-question:

Question
^^^^^^^^

Superclass with common attributes for all types of questions. You always
get a more specific one and never just a ``Question``.

-  ``uuid`` (``str``)
-  ``type`` (``str``)
-  ``title`` (``str``)
-  ``text`` (``Optional[str]``)
-  ``required_phase`` (:ref:`odc-phase`) - a phase titled ``never`` if none is set
-  ``is_required`` (``bool``) - if the question is required in the current phase
-  ``replies`` (``dict[str,``\ :ref:`odc-reply`\ ``]``) - path-key dictionary of replies to the question
-  ``experts`` (``list[``\ :ref:`odc-expert`\ ``]``)
-  ``references`` (``list[``\ :ref:`odc-reference`\ ``]``)
-  ``tags`` (``list[``\ :ref:`odc-tag`\ ``]``)
-  ``parent`` (``Union[``\ :ref:`odc-chapter`\ ``,``\ :ref:`odc-list-question`\ ``,``\ :ref:`odc-answer`\ ``]``)
-  ``annotations`` (``dict[str,str]``)

Aliases:

-  ``cross_references`` (``list[``\ :ref:`odc-cross-reference`\ ``]``)
-  ``resource_page_references`` (``list[``\ :ref:`odc-resource-page-reference`\ ``]``)
-  ``url_references`` (``list[``\ :ref:`odc-url-reference`\ ``]``)

Notes:

- Parent of a question can be of multiple kinds, you may use the ``of_type`` test to check what it is if needed.

.. _odc-value-question:

ValueQuestion
'''''''''''''

-  ``value_type`` (``str``) - type of value, use alias
-  ``validations`` (``list[``\ :ref:`odc-value-question-validation`\ ``]``)

Aliases:

-  ``is_string`` (``bool``)
-  ``is_text`` (``bool``)
-  ``is_number`` (``bool``)
-  ``is_date`` (``bool``)
-  ``is_datetime`` (``bool``)
-  ``is_time`` (``bool``)
-  ``is_email`` (``bool``)
-  ``is_url`` (``bool``)
-  ``is_color`` (``bool``)

.. _odc-value-question-validation:

ValueQuestionValidation
"""""""""""""""""""""""

-  ``type`` (``str``)
-  ``full_type`` (``str``)
-  ``value`` (``str | int | float | None``) - based on the ``type``


.. _odc-integration-question:

IntegrationQuestion
'''''''''''''''''''

-  ``integration`` (``Optional[``\ :ref:`odc-integration`\ ``]``)
-  ``variables`` (``dict[str,str]``)

.. _odc-options-question:

OptionsQuestion
'''''''''''''''

-  ``answers`` (``list[``\ :ref:`odc-answer`\ ``]``)

.. _odc-multichoice-question:

MultiChoiceQuestion
'''''''''''''''''''

-  ``choices`` (``list[``\ :ref:`odc-choice`\ ``]``)

.. _odc-list-question:

ListQuestion
''''''''''''

-  ``followups`` (``list[``\ :ref:`odc-question`\ ``]``)

.. _odc-item-select-question:

ItemSelectQuestion
''''''''''''''''''

-  ``list_question`` (``Optional[``\ :ref:`odc-list-question`\ ``]``)

.. _odc-file-question:

FileQuestion
''''''''''''

-  ``max_size`` (``Optional[int]``) - maximum file size (in bytes) allowed
-  ``file_types`` (``Optional[str]``) - comma-separated file type specifications


.. _odc-answer:

Answer
^^^^^^

-  ``uuid`` (``str``)
-  ``label`` (``str``)
-  ``advice`` (``Optional[str]``) - possibly Markdown text
-  ``metric_measures`` (``list[``\ :ref:`odc-metric-measure`\ ``]``)
-  ``followups`` (``list[``\ :ref:`odc-question`\ ``]``)
-  ``parent`` (:ref:`odc-options-question`)
-  ``annotations`` (``dict[str,str]``)

.. _odc-metric-measure:

MetricMeasure
'''''''''''''

Indication of how an answer affects a certain metric.

-  ``measure`` (``float``) - value between ``0.0`` and ``1.0`` (inclusive)
-  ``weight`` (``float``) - value between ``0.0`` and ``1.0`` (inclusive)
-  ``metric`` (``Optional[``\ :ref:`odc-metric`\ ``]``)


.. _odc-choice:

Choice
^^^^^^

-  ``uuid`` (``str``)
-  ``label`` (``str``)
-  ``parent`` (:ref:`odc-multichoice-question`)
-  ``annotations`` (``dict[str,str]``)


.. _odc-expert:

Expert
^^^^^^

-  ``uuid`` (``str``)
-  ``name`` (``str``)
-  ``email`` (``str``)
-  ``annotations`` (``dict[str,str]``)


.. _odc-reference:

Reference
^^^^^^^^^

As for the :ref:`odc-question` class, ``Reference`` is also a superclass and you will always get an object of its subclass.

-  ``uuid`` (``str``)
-  ``type`` (``str``)
-  ``annotations`` (``dict[str,str]``)

.. _odc-cross-reference:

CrossReference
''''''''''''''

-  ``target_uuid`` (``str``)
-  ``description`` (``str``)

.. _odc-resource-page-reference:

ResourcePageReference
'''''''''''''''''''''

-  ``resource_page`` (``Optional[``\ :ref:`odc-resource-page`\ ``]``)

.. _odc-url-reference:

URLReference
''''''''''''

-  ``label`` (``str``)
-  ``url`` (``str``)


.. _odc-resource-collection:

ResourceCollection
^^^^^^^^^^^^^^^^^^

-  ``uuid`` (``str``)
-  ``title`` (``str``)
-  ``pages`` (``list[``\ :ref:`odc-resource-page`\ ``]``)
-  ``annotations`` (``dict[str,str]``)

.. _odc-resource-page:


ResourcePage
^^^^^^^^^^^^

-  ``uuid`` (``str``)
-  ``title`` (``str``)
-  ``content`` (``str``)
-  ``collection`` (``Optional[``\ :ref:`odc-resource-collection`\ ``]``)
-  ``annotations`` (``dict[str,str]``)


.. _odc-metric:

Metric
^^^^^^

-  ``uuid`` (``str``)
-  ``title`` (``str``)
-  ``abbreviation`` (``str``)
-  ``description`` (``Optional[str]``) - possibly Markdown text
-  ``annotations`` (``dict[str,str]``)


.. _odc-phase:

Phase
^^^^^

-  ``uuid`` (``str``)
-  ``title`` (``str``)
-  ``description`` (``Optional[str]``) - possibly Markdown text
-  ``order`` (``int``) - order of the phase within the KM, starting with ``1``
-  ``annotations`` (``dict[str,str]``)


.. _odc-integration:

Integration
^^^^^^^^^^^

-  ``uuid`` (``str``)
-  ``name`` (``str``)
-  ``type`` (``str``) - one of: ``ApiIntegration``, ``PluginIntegration``
-  ``annotations`` (``dict[str,str]``)

.. _odc-api-integration:

ApiIntegration
''''''''''''''

-  ``variables`` (``list[str]``)
-  ``allow_custom_reply`` (``bool``)
-  ``request_method`` (``str``)
-  ``request_url`` (``str``)
-  ``request_headers`` (``dict[str,str]``)
-  ``request_body`` (``Optional[str]``)
-  ``request_allow_empty_search`` (``bool``)
-  ``response_list_field`` (``Optional[str]``)
-  ``response_item_template`` (``str``)
-  ``response_item_template_for_selection`` (``Optional[str]``)

.. _odc-plugin-integration:

PluginIntegration
'''''''''''''''''

-  ``plugin_uuid`` (``str``)
-  ``integration_id`` (``str``)
-  ``settings`` (``dict``) - plugin-specific settings object


.. _odc-tag:

Tag
^^^

-  ``uuid`` (``str``)
-  ``name`` (``str``)
-  ``description`` (``Optional[str]``) - possibly Markdown text
-  ``color`` (``str``)
-  ``annotations`` (``dict[str,str]``)


.. _odc-replies-container:

RepliesContainer
~~~~~~~~~~~~~~~~

Wrapper around a path-key dictionary of replies.

-  ``replies`` (``dict[str,``\ :ref:`odc-reply`\ ``]``)

Operations:

-  ``X[path: str]`` (``Optional[``\ :ref:`odc-reply`\ ``]``) - you can get a reply using square brackets
-  ``len(X)`` (``int``) - number of replies in the container
-  ``get(path: str, default=None) -> Optional[``\ :ref:`odc-reply`\ ``]``
-  ``iterate_by_prefix(path_prefix: str) -> Iterable[``\ :ref:`odc-reply`\ ``]``
   - *O(n)* iteration with filter
-  ``iterate_by_suffix(path_suffix: str) -> Iterable[``\ :ref:`odc-reply`\ ``]``
   - *O(n)* iteration with filter
-  ``values() -> Iterable[``\ :ref:`odc-reply`\ ``]``
-  ``keys() -> Iterable[str]``
-  ``items() -> ItemsView[str,``\ :ref:`odc-reply`\ ``]``


.. _odc-reply:

Reply
~~~~~

Superclass with common attributes for all types of replies. You always
get a more specific one and never just a ``Reply``.

-  ``path`` (``str``)
-  ``fragments`` (``list[str]``) - UUIDs of the path (starting with chapter)
-  ``type`` (``str``)
-  ``created_at`` (``datetime``)
-  ``created_by`` (``Optional[``\ :ref:`odc-simple-author`\ ``]``)
-  ``question`` (``Optional[``\ :ref:`odc-question`\ ``]``) - you can assume more specific type of ``Question`` based on a type of ``Reply``

AnswerReply
^^^^^^^^^^^

-  ``answer`` (``Optional[``\ :ref:`odc-answer`\ ``]``) - selected answer as the option

Aliases:

-  ``value`` (``str``) - UUID of the answer (``answer.uuid``)

Notes:

-  ``question`` is always :ref:`odc-options-question`


MultiChoiceReply
^^^^^^^^^^^^^^^^

-  ``choices`` (``list[``\ :ref:`odc-choice`\ ``]``) - selected answer as the option

Aliases:

-  ``value`` (``list[str]``) - list of UUIDs of the choices

Notes:

-  ``question`` is always :ref:`odc-multichoice-question`
-  You can iterate directly over reply object(``for choice in reply``)

StringReply
^^^^^^^^^^^

-  ``value`` (``str``)

Aliases:

-  ``as_number`` (``Optional[float]``) - tries to cast the value to a number
-  ``as_datetime`` (``Optional[datetime]``) - tries to cast the value to a timestamp
-  ``markdown_html`` (``str``) - renders the value as Markdown and returns HTML
-  ``markdown_plain`` (``str``) - renders the value as Markdown and returns plain text (without formatting)

Notes:

-  ``question`` is always :ref:`odc-value-question`


.. _odc-file-reply:

FileReply
^^^^^^^^^

-  ``file_uuid`` (``str``)
-  ``file`` (``Optional[``\ :ref:`odc-project-file`\ ``]``) - ``None`` if file has been deleted

Aliases:

-  ``value`` (``str``) - same as ``file_uuid``

Notes:

-  ``question`` is always :ref:`odc-file-question`


ItemListReply
^^^^^^^^^^^^^

-  ``items`` (``list[str]``) - list of items UUIDs (used in reply paths)

Aliases:

-  ``value`` (``list[str]``) - same as ``items``

Notes:

-  ``question`` is always :ref:`odc-list-question`
-  You can iterate directly over reply object (``for item in reply``)


ItemSelectReply
^^^^^^^^^^^^^^^

-  ``item_uuid`` (``str``)
-  ``item_title`` (``str``)

Aliases:

-  ``value`` (``str``) - same as ``item_uuid``

Notes:

-  ``question`` is always :ref:`odc-item-select-question`


IntegrationReply
^^^^^^^^^^^^^^^^

-  ``value_type`` (``str``) - one of: ``PlainType``, ``IntegrationType``
-  ``value`` (``str``) - rendered value from integration (or plain reply)
-  ``raw`` (``Optional[Any]``) - returned raw value stored from API or plugin (e.g., JSON object)

Aliases:

-  ``is_plain`` (``bool``) - entered by user ignoring the integration
-  ``is_integration`` (``bool``) - selected by user using the integration

Examples
========

Read replies to top-level questions:

.. code-block:: jinja

   {%- set x = ctx|to_context_obj -%}
   {% for chapter in x.km.chapters %}
     <h2>{{ chapter.title }}</h2>
     {% for question in chapter.questions %}
       {% set path = chapter.uuid ~ '.' ~ question.uuid %}
       {% set reply = x.questionnaire.replies.get(path) %}
       {% if reply %}<p>{{ question.title }}: {{ reply.value }}</p>{% endif %}
     {% endfor %}
   {% endfor %}

A reply path contains the UUIDs leading to that question, separated by dots. Nested list items and follow-up questions add their UUIDs to the path. Use ``RepliesContainer`` helpers to select related replies and :doc:`steps/jinja` for reply filters and extraction by annotations.

List uploaded files:

.. code-block:: jinja

   {% for file in x.questionnaire.files.values() %}
     <p>{{ file.name }} ({{ file.size }} bytes)</p>
   {% endfor %}

Use ``assets(file)`` when embedding a file's content in the output. A download link and embedded content serve different purposes; the former still requires access to the instance.

Worker-supplied extras
======================

A rendering step can request ``extras`` as a comma-separated option, for example ``submissions,project``. The document worker adds the requested data to ``ctx['extras']``:

* ``submissions``: submission records for the source project.
* ``project``: the worker's additional project record.

For a knowledge model editor preview, ``extras.project`` is ``None`` and ``extras.submissions`` is empty. The deprecated ``extras.questionnaire`` alias is removed in 19.0; use ``extras.project`` for that data. Replies and questionnaire content are already in the main ``questionnaire`` object.

These extras are worker enrichment. The backend's fetched raw context does not include them, so validate the backend payload before enrichment.
