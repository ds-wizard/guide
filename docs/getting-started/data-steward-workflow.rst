.. _data-steward-workflow:

Data Steward Workflow
*********************

|project_name| becomes much more valuable when data stewards turn institutional knowledge into reusable guidance. This workflow focuses on that job: prepare the right content once, then help many researchers start from a better baseline.


Example Scenario
================

Imagine your institution wants a reusable DMP workflow for life-science projects. You want researchers to start with the right questions, see local guidance inside the questionnaire, and generate a document that already matches your preferred reporting format.


1. Start from Existing Content When Possible
============================================

Usually, the fastest path is not to build everything from scratch.

- Import a :ref:`knowledge model<knowledge-models>` from the DSW Registry or adapt an existing institutional one.
- Import a :ref:`document template<document-templates>` that already covers your target output, then customize it only where your organization differs.
- Import locales if your users need a translated interface or translated content.

Starting from existing content shortens review cycles and makes future updates easier to compare.

.. TODO::

    Add a screenshot of importing content from the DSW Registry, preferably one image that shows either knowledge model import or document template import with the registry source selected.


2. Tailor the Knowledge Model to Real Decisions
===============================================

Focus on the questions that genuinely help researchers make better decisions. Good stewardship content often includes:

- phases that match the research lifecycle
- branching that hides irrelevant follow-up questions
- answer advice for common mistakes or weak practices
- references to local policy, storage guidance, or funder rules
- named experts for specialized topics such as legal review or sensitive data
- integrations that help researchers choose controlled terms or external resources
- metrics that show quality or FAIRness trends without blocking progress

The goal is not to ask everything possible. The goal is to ask the smallest set of questions that leads to a better plan.

.. TODO::

    Add a screenshot of the knowledge model editor with a question open for editing. The image should show where stewards manage question text, branching or follow-up structure, and supporting guidance such as references or experts.


3. Prepare the Output Documents
===============================

Once the questionnaire captures the right information, make sure researchers can turn it into the outputs they actually need.

- Use the :ref:`document template editors<document-template-editors>` when the changes are small and can be handled in the application.
- Use :ref:`DSW Template Development Kit (TDK)<dsw-tdk>` when you want a stronger development workflow, version control, packaging, or automation around template work.

Keep the document template compatible with the knowledge model it targets. A template can only transform answers it knows how to read.


4. Package the Experience as a Project Template
===============================================

The biggest improvement for end users often comes from a well-prepared :ref:`project template<project-templates>`.

A good project template can include:

- the preferred knowledge model
- the default document template and format
- pre-filled organizational answers
- TODOs for common researcher follow-up tasks
- comments that explain local review expectations

This turns "start a DMP" from a blank-page experience into a guided workflow.

.. TODO::

    Add a screenshot of project settings with the Project Template option enabled. This should make it clear where a normal project is turned into a reusable template.


5. Pilot with One Real Research Team
====================================

Before broad rollout, test the content with one real project. Watch for:

- questions researchers consistently misread
- places where branching hides something important
- advice that is too abstract to act on
- missing document outputs for real reporting needs
- bottlenecks that would be better handled by a local expert or integration

One practical way to improve a knowledge model is to observe one full project from creation to first document.


6. Maintain Content Like a Product
==================================

Treat your knowledge models, templates, and project templates as maintained content rather than static assets.

- track which version researchers are using
- review registry updates regularly
- migrate content deliberately instead of changing everything at once
- communicate what changed and why
- keep examples and local guidance current


Suggested Stewardship Package
=============================

A practical first release for an institution might include:

- one institutional knowledge model based on the core DSW model
- one main document template for your common DMP format
- one project template for new researchers
- one short internal review workflow using comments and sharing roles
- a small list of named experts and resource links


Where to Dive Deeper
====================

- :ref:`knowledge-models`
- :ref:`document-templates`
- :ref:`project-templates`
- :ref:`document-template-editors`
- :ref:`dsw-tdk`
- :ref:`integration-questions`
