.. _project-questionnaire:

Questionnaire
*************

Questionnaire is the first tab of the project detail. This is the most important part where we fill in all the details about our project.


Current Phase
=============

If the :ref:`knowledge model<knowledge-model>` we use for the :ref:`project<project>` has :ref:`phases<phase>` defined, we can see a phase selection in the questionnaire detail. Different questions become desirable based on the selected phase. For example, some should be answered before submitting the proposal, while others can be filled later. The phase progress is also visible.

.. figure:: /_static/screenshots/5.0/project-detail.png
    :figclass: guide-screenshot
    :alt: Project detail in DSW 5.0
    :width: 760

    Project detail.

By clicking the phase selection we open the modal window where we can choose the current phase.

.. figure:: /_static/screenshots/5.0/project-phases.png
    :figclass: guide-screenshot
    :alt: Project phases in DSW 5.0
    :width: 480

    Project phases.

We can see the desirability of questions based on the phase we are currently in. We can also see the number of questions that still need to be answered in this phase for each chapter in the chapter list.

There are three desirability states the question can be in:

- **red, with a pen icon** - this question is desirable in the current phase and has not been answered
- **light grey, with an hourglass icon** - this question will have to be answered in some later phase
- **green, with a checkmark icon** - this question has already been answered

.. NOTE::

    If there is no phase defined on the knowledge model, the current phase selection is not visible in the questionnaire detail.


Chapters
========

Below the current phase selection, we have a list of :ref:`chapters<chapter>`. We can see the number of questions that are yet to be answered in the current phase (or overall if there are no phases defined in the knowledge model). We can use this list to navigate freely between chapters.

For the opened chapter, we can see a navigation tree for the chapter structure, showing the questions, follow-up questions, items, etc. We can use this tree to quickly navigate to a specific question in the chapter.

.. figure:: /_static/screenshots/5.0/chapter-navigation.png
    :figclass: guide-screenshot
    :alt: Questionnaire chapters in DSW 5.0
    :width: 259

    Questionnaire chapters.

Questionnaire Area
==================

The questionnaire area fills the most space in the questionnaire screen. It displays the questions and answers from the opened chapter.

Each question has an identifier which indicates the chapter it belongs to, as well as its order and nesting within the chapter. For example, **I.1.a.5**, where the Roman numeral represents the number of the chapter, and the remaining numbers indicate the order and nesting of the question. Then there is also the question name.

Some additional information can also be part of the question:

- **Question tags** - can indicate some additional grouping of questions, for example what DMP templates is this question used for
- **Description** - additional information explaining the question
- **Desirability** - what phase this question become desirable in
- **List of references** - links to additional external resources related to the question
- **List of experts** - whom to contact when help is needed with answering the question

Based on our role in the project and specific settings, there are some additional actions besides answering the question:

- :ref:`Add TODO<todos>`
- :ref:`Add comment<add-comment>`

We can get more information on how various collaboration tools work and can be used in :ref:`Sharing<sharing>`.

The most important part is, however, answering the question. The way of how to answer the question differs based on the question type.


Options Question
----------------

Options question has a list of pre-set answers and we can choose one from those. There can be some follow-up questions (indicated by the icon by the answer). These questions are displayed only if we select that answer.

If there are some metrics set for the answers, we can see labels with the metrics by the answer as well. The color of the label indicates how good or bad the answer is (red means bad, green good, yellow something in between).

.. figure:: /_static/screenshots/5.0/question-options.png
    :figclass: guide-screenshot
    :alt: Options question in DSW 5.0
    :width: 698

    Options question.

List of Items Question
----------------------

List of items question doesn't have a simple answer but a list of items. Each of the items has the same set of subquestions. For example, a list of items question asking about the project contributors where each item represent one contributor with questions about their name, role, etc.

We can simply click on :guilabel:`Add` button under the question to add a new item. Then, we can answer the questions for the item. If the item has a lot of questions, we can use the arrow icon in the item's top left corner to **fold/unfold** the item. We can also use :guilabel:`Expand all` and :guilabel:`Collapse all` buttons in the question menu to **fold/unfold** all items at once.

There is a trash bin icon in the item's top right corner that we can use to **delete** the item. If there is more than one item, there are also arrow icons that we can use to **change the order** of the items.

The first question in the list of items question is used as a label for the item. It can be any type of question.


.. figure:: /_static/screenshots/5.0/question-list.png
    :figclass: guide-screenshot
    :alt: List question in DSW 5.0
    :width: 724

    List question.

Value Question
--------------

Value question contains an input field for our answer. This can be a simple text field (such as asking for a project contributor's name), or some additional widget, for example a date picker.

Value questions can have validation rules, such as a required text pattern or a permitted number range. If an answer does not meet a rule, the question shows a validation message. Review the message and correct the answer where appropriate.

.. figure:: /_static/screenshots/5.0/question-value.png
    :figclass: guide-screenshot
    :alt: Value question in DSW 5.0
    :width: 698

    Value question.

Integration Question
--------------------

Integration question is connected to an external resource where it searches for the answers. The input field works as a search field, so when we start typing something, it searches the external resource and offers us a list of possible answers.

Choose a result from the list to save the selected answer. Its displayed text and any link are defined by the knowledge model's integration configuration.

If the integration allows custom replies, we can also enter our own text when the desired result is missing. DSW marks it as a custom answer rather than a selected integration result.

.. figure:: /_static/screenshots/5.0/question-integration.png
    :figclass: guide-screenshot
    :alt: Integration question in DSW 5.0
    :width: 698

    Integration question.

Multi-Choice Question
---------------------

Multi-choice question is similar to the options question, however we can choose more than one answer and there are no follow-up questions.

.. figure:: /_static/screenshots/5.0/question-multi-choice.png
    :figclass: guide-screenshot
    :alt: Multi-choice question in DSW 5.0
    :width: 698

    Multi-choice question.

Item Select Question
--------------------

The item selection question is used together with the list of items question. When creating an item selection question, you must choose one of the existing list of items questions. The answers provided to that list of items question are then offered as possible answers in the item selection question.

.. figure:: /_static/screenshots/5.0/question-item-select.png
    :figclass: guide-screenshot
    :alt: Item-select question in DSW 5.0
    :width: 698

    Item-select question.

File Question
-------------
File question is used when we need to upload a file as an answer. We can simply click on the :guilabel:`Upload File` button and select the file from our computer. We can also drag and drop the file into the input field.

.. figure:: /_static/screenshots/5.0/question-file.png
    :figclass: guide-screenshot
    :alt: File question in DSW 5.0
    :width: 698

    File question.

View settings
=============

In the questionnaire tab, there is a menu bar with various options. The first one is :guilabel:`View`, where we can show or hide some question details:

- :guilabel:`Answered by` - show/hide who and when answered questions
- :guilabel:`Phases` - show/hide what phase the questions are desirable in
- :guilabel:`Question tags` - show/hide the question tags
- :guilabel:`Non-desirable questions` - show/hide questions that are not desirable in the current phase
- :guilabel:`Metric values` - show/hide value of metrics for accessibility purpose

.. figure:: /_static/screenshots/5.0/questionnaire-view.png
    :figclass: guide-screenshot
    :alt: Questionnaire view options in DSW 5.0
    :width: 760

    Questionnaire view options.

.. NOTE::

    If at least one of the options is turned off, a red dot will be displayed next to the :guilabel:`View` button.


Import answers
==============

Questionnaire answers can be imported from various sources using :ref:`plugins<plugins>`.

If there are some project importer plugins available for the project, there is the :guilabel:`Import answers` button in the questionnaire menu bar. We can choose one of the available importer plugins there and then follow the instructions in the importer plugin window.


.. _unanswered-questions:

Unanswered questions
====================

The :guilabel:`Unanswered` button in the questionnaire menu bar shows how many visible questions that are desirable in the current phase still need an answer. Open it to see those questions grouped by chapter. Click a question to jump to it in the questionnaire. Questions that are hidden by earlier answers or belong to a later phase are not listed.


.. figure:: /_static/screenshots/5.0/questionnaire-unanswered.png
    :figclass: guide-screenshot
    :alt: Unanswered questions in DSW 5.0
    :width: 384

    Unanswered questions.

.. _warnings:

Warnings
========

Invalid values and failed question validation rules appear as warnings. Open :guilabel:`Warnings` in the questionnaire toolbar to see the affected questions, then click a question to review its answer. The badge shows the number of warnings.

.. figure:: /_static/screenshots/5.0/validation-error.png
    :figclass: guide-screenshot
    :alt: Email value validation warning in DSW 5.0
    :width: 498

    Email value validation warning.

.. figure:: /_static/screenshots/5.0/questionnaire-warnings.png
    :figclass: guide-screenshot
    :alt: Questionnaire warnings in DSW 5.0
    :width: 760

    Questionnaire warnings.

.. _todos:

TODOs
=====

When we are filling in the questionnaire, we can stumble upon a question that we don't know how to answer yet, but we don't want to forget to come back to that question. We can click on :guilabel:`+ Add TODO` to add a TODO to the question.

We can then open the :guilabel:`TODOs` tab from the questionnaire menu to see the list of all questions with assigned TODO in the questionnaire. By clicking on a question there, we can quickly jump back to that question and fill it.

.. figure:: /_static/screenshots/5.0/questionnaire-todos.png
    :figclass: guide-screenshot
    :alt: Questionnaire TODOs in DSW 5.0
    :width: 760

    Questionnaire TODOs.

Comments
========

We sometimes want to leave comments to discuss things with our team or just reminders for ourselves. We can write comments to each question in the questionnaire. The comments can be browsed using the navigation buttons.

Total number of comments in the questionnaire is visible in the :guilabel:`Comments` tab in the questionnaire menu bar. If a comment detail is opened, the number `x/y` indicates the current comment's position within the total number of comments.

The number of comments per question is indicated by the comments icon next to the question.

.. figure:: /_static/screenshots/5.0/project-comments.png
    :figclass: guide-screenshot
    :alt: Project comments in DSW 5.0
    :width: 384

    Project comments.

.. _add-comment:

Add Comment
-----------

To add a comment, we need to click on the comments icon by the question which opens a side panel with all the comments related to that question. Then, we can write the comment into the text box and submit.


View Comments
-------------

The comments control beside a question shows its unresolved comment count. Open it to read the thread or add a reply.

In the questionnaire menu bar, there is also a :guilabel:`Comments` tab, showing a badge with the number of comments everywhere in the questionnaire. If we open the tab, we can see a list of questions for each chapter where there are some comments. Clicking on the question there will bring us to that question and open the comments side panel.


Assign Comments
---------------

We can assign comments to a specific user. This is useful when we want to ask someone to reply or when we want to assign a task to someone. We can assign a comment by clicking on the :guilabel:`Assign comment thread` button in the comment. We can also see who the comment is assigned to in the comment list.

When a comment is assigned to a user, they are notified by an email. Comments assigned to us are also visible in the :ref:`profile<profile>`.


Comment Threads
---------------

Comments are organized into comment threads for better clarity. We can either start a new thread or reply in an existing thread if our comment is on the same topic.

When the thread is resolved, we can click on the ✔ icon in order to resolve it. Resolved threads can be later viewed by selecting :guilabel:`View resolved comments`. They can also be reopened if needed.


Resolved Comments
-----------------

When we resolve a comment, it is not deleted but only hidden. We can see all resolved comments by selecting :guilabel:`View resolved comments` from the comments tab. We can also reopen the resolved comment if needed.

.. note::

    The :guilabel:`View resolved comments` switch is only present when there is at least one resolved comment in the questionnaire.


Editor Notes
------------

Besides comments there are also editor notes which work the same way as comments but they are visible only to project editors and owners. We can use editor notes for internal communication with our team while working on the DMP and then comments to gather the feedback from supervisor or reviewer.


Version History
===============

When we open the :guilabel:`Version history` tab from the questionnaire menu bar we can see the list of all the changes that happened in that questionnaire. We can see who and when made what changes grouped by months and days.

.. figure:: /_static/screenshots/5.0/project-history.png
    :figclass: guide-screenshot
    :alt: Project history in DSW 5.0
    :width: 384

    Project history.

Name a Version
--------------

Project owners can name a version, including an earlier event. Click on the triple dots on any event we want to name and choose :guilabel:`Name this version`. Then we just fill in name and description of that version. If the event already has a named version, we can choose :guilabel:`Rename this version` instead.

When we have some named versions, we can choose :guilabel:`Named versions only`. Then, we don't see every single change but only the important versions we gave a name to.

.. WARNING::

    Migration changes the knowledge model used for the current questionnaire. The event history and named versions are retained, but questions removed from the target model do not appear in the current questionnaire. Review important outputs before migrating.


View Questionnaire in a Version
-------------------------------

Thanks to the version history, we can see how the questionnaire was filled at any point in the past. We simply find the event in the version history and choose :guilabel:`View questionnaire` from the event menu.


Create Document from an Older Version
-------------------------------------

Sometimes, we might want to create a document from an older version. For example, we created only a PDF document, but later we find out that we also needed a Word document. To do that, we simply find that version in the version history and select :guilabel:`Create document`. Then, we just fill in the details in the form and create the document.


Revert to an Older Version
--------------------------

Project owners can revert the questionnaire to an earlier event. Find the event in the version history, choose :guilabel:`Revert to this version` and review the confirmation before proceeding.

.. WARNING::

    Reverting deletes later questionnaire events, named versions attached to those events, and files uploaded after the selected event. This cannot be undone. Clone the project first if the current state needs to be kept.


Search
======

Search is accessible from the questionnaire menu bar by clicking on the :guilabel:`Search` button. A search side panel opens where we can type in our search query. The search works in real-time, so while we are typing, the results are displayed below. We can fulltext search in questions and answers. In questions not only the question name but also description and references. The search is case insensitive.

We can click on any of the search results to quickly navigate to that question in the questionnaire.

.. figure:: /_static/screenshots/5.0/questionnaire-search.png
    :figclass: guide-screenshot
    :alt: Search within a questionnaire in DSW 5.0
    :width: 760

    Search within a questionnaire.
