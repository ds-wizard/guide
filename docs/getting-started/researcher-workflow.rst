.. _researcher-workflow:

Researcher Workflow
*******************

This workflow shows how a researcher can move from a blank project to a shareable data management plan without needing to understand every screen in advance.


Example Scenario
================

Imagine you are starting a project called ``Neuroimaging Pilot 2026``. Your goal is to capture the key data management decisions early, review them with a data steward, and produce a first DMP for an internal or funder milestone.


1. Start from the Best Project Option
=====================================

When you create a project, prefer this order:

- Use a :ref:`project template<from-project-template>` if your institution provides one. This usually gives you the right knowledge model, useful defaults, and a better starting structure.
- Use :ref:`custom project creation<create-project-custom>` when you need a different knowledge model or want to explore from scratch.

If you are creating a custom project, choose the most suitable knowledge model and, if available, use question tags to focus the questionnaire on your use case instead of loading everything at once.

.. TODO::

    Add a screenshot of the create-project dialog showing both entry paths: project template and custom project creation. The image should make it obvious where the researcher chooses the knowledge model or template.


2. Work Phase by Phase
======================

In the :ref:`project questionnaire<project-questionnaire>`, set the current phase if your knowledge model uses phases. This helps you focus on what must be answered now and what can wait until later.

Good information to gather early includes:

- project title, funder, and high-level goals
- datasets you expect to create or reuse
- storage location and backup responsibilities
- repository or archive you may use for publication
- ethical, legal, or access restrictions
- named people who own specific data management tasks

Use the questionnaire chapter by chapter. For repeated structures such as datasets, contributors, or instruments, expect to use list-of-items questions.

Example dataset items:

- ``Raw MRI scans``
- ``De-identified derivatives``
- ``Analysis notebooks and scripts``

If you do not know an answer yet, create a TODO instead of leaving the question buried in the form. If you need input from a colleague, leave a comment on the specific question so the discussion stays attached to the right context.

.. TODO::

    Add a screenshot of the questionnaire detail with the phase selector, chapter list, and one open question area. If possible, include an example list-of-items question so the structure is easy to understand at a glance.


3. Collaborate Early
====================

Do not wait until the questionnaire is "finished" before involving others.

- Share the project with a data steward as a :ref:`commenter or editor<sharing>`.
- Use comments for review and clarification.
- Upload supporting files in the project when they help reviewers understand the plan, for example a protocol, ethics memo, data collection sheet, or repository checklist.

This often leads to faster feedback than sending a document around by email, because collaborators can comment directly where the uncertainty appears.


4. Generate Outputs at Milestones
=================================

Use :ref:`preview<preview>` for fast visual checks while you are still editing. Use :ref:`documents<project-documents>` when you need a persistent milestone output that should stay available even after the questionnaire changes.

Helpful naming examples:

- ``DMP-v1-proposal``
- ``DMP-v2-after-steward-review``
- ``DMP-v3-ethics-submission``

If your instance has submission services configured, you may also be able to submit a generated document directly to an external system.

.. TODO::

    Add a screenshot of project detail with the preview open and the documents tab visible in the project navigation. The goal is to clarify where preview fits in relation to stored document outputs.


5. Keep the Project Alive
=========================

Treat the project as a living workspace rather than a one-time form.

- Update the current phase as the project moves forward.
- Add newly created datasets and files when the scope changes.
- Generate a new document for each important checkpoint instead of overwriting the meaning of an old one.
- Review TODOs regularly so temporary placeholders do not become permanent gaps.


Suggested First Session
=======================

If you only have 30 minutes, this is a strong first pass:

1. Create the project from the best available template.
2. Set the current phase.
3. Complete the first chapter and add at least one dataset item.
4. Add TODOs for anything blocked by another person.
5. Share the project with your data steward.
6. Set or confirm the default document template.
7. Open the preview and generate the first persistent document.


Where to Dive Deeper
====================

- :ref:`create-project`
- :ref:`project-questionnaire`
- :ref:`sharing`
- :ref:`preview`
- :ref:`project-documents`
