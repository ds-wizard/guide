Knowledge Model Preview
***********************

Choose :guilabel:`Preview` from a published knowledge model's actions to inspect its questionnaire. This preview is read-only. Use the :doc:`editor preview </application/knowledge-models/editors/detail/preview>` when testing answers while developing a model.

Link to a question
==================

To open a particular question, append ``?questionUuid=QUESTION_UUID`` to the model's preview URL. Replace ``QUESTION_UUID`` with the question's UUID, available from the knowledge model editor.

The preview fills in the parent answers needed to reach a nested question and opens that question. These are preview values, not answers saved in an existing project.

Create a project
================

When :guilabel:`Create project` is available, we can use it to start a project from the preview. Availability depends on our permissions and the instance's project-creation settings. Public models can also offer anonymous project creation when that feature is enabled.

A project created this way keeps any answers generated for the preview. Review its answers and :doc:`sharing settings </application/projects/list/detail/sharing>` before using it for real work.

.. todo::

   Screenshot: Published Knowledge Model preview and Create project action.
