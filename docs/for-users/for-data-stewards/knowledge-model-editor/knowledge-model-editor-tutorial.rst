*******************************
Knowledge Model Editor Tutorial
*******************************

This Knowledge Model Editor Tutorial will help you to create your own Knowledge Model step by step.

----

The KM (Knowledge Model) Editor is used for creating and updating Knowledge Models. This tutorial will go through the steps of creating a new KM from scratch.

Create a new Knowledge Model
============================

1. Click on **Knowledge Models** and then on **Editors** in Sidebar
2. Click on **Create** in the top right corner
3. Fill the fields with appropriate Name (e.g. ``KM Editor Test Model``) and Knowledge Model ID (e.g. ``test-model``). The ID can contain alphanumeric characters and dash but cannot start or end with dash. Leave Parent Knowledge Model as is (–). Note: If you want to update or reuse an existing model, this is where you select which one.
4. Click on **Create** button

Create a Chapter
================

Once you have created a new KM, it’s time to fill it with Chapters (i.e. sections; think of them as headers of your model).

1. Press **+ Add chapter**
2. Write a Title (e.g. ``Introduction``) and Text (e.g. ``Background information``) for the chapter. Note: The Text field is where you add a description of what the chapter will contain questions about. There are two tabs, **Editor** and **Preview**, since you can use :doc:`../../../miscellaneous/markdown-cheatsheet` to format the text and check the result in **Preview**.
3. Press **+ Add question** in order to create a Question

Notice another Sidebar that gives an overview of your KM. Use this to navigate between the different parts. Whenever you want to see the result of an addition, click on another part in the KM overview (at this stage this would be the *parent* we named `My test KM`.

You can also Expand and Collapse parts of your KM to get better overview.

Add a Question
==============

Questions can be of different types:

* Option
* List of Items
* Value
* Integration
* Multi-Choice

Let's create a question of each type to demonstrate:

**Options**

1. Click on **Introduction** in the overview area of the editor
2. Press *+Add question* in order to create a new question
3. Select *Options* as **Question Type**
4. Write 'Research field' as **Title**
5. Write 'Please select the research field for this project' as **Text**
6. Click on +Add answer
7. Write 'Life science' as **Label**
8. Write 'Your project is likely going to produce a lot of data, a full data management plan will prepare you for the various challenges this will entail' as **Advice**
9. Click on the Research field in the overview area, scroll down to **Answers** and click on *+Add answer*
10. Write 'Other' as **Label**
11. Scroll down to **Follow-up Questions** and click on a *+Add follow-up* question
12. Select *Value* as **Question Type**
13. Write 'Which other research field?' as Title
14. As **Value Type**, select *Text*

**List of items**

1. Click on **Introduction** in the overview area of the editor
2. Press *+Add question* in order to create a new question
3. Select *List of items* as **Question Type**
4. Write 'Project members' as **Title**
5. Write 'Please specify the researchers participating in the project' as **Text**
6. Select *Before submitting the DMP* as **When does this question become desirable?**
7. In the **Item Template**, click on *+Add question*
    1. Set the **Question Type** to *Value*
    2. Write 'Name' as **Title**
    3. Back to one level up by clicking on Project members in the overview part of the editor
    4. Scroll down and click on *+Add question* in the **Item Template**
    5. Set the **Question Type** to *Value*
    6. Write 'Email' as **Title**

**Value**

1. Click on **Introduction** in the overview area of the editor
2. Press *+Add question* in order to create a new question
3. Select *Value* as **Question Type**
4. Write ‘Project title’ in the **Title** field
5. In the **Text** field, write ‘Please enter the title of your project’, as an instructive text
6. Use **When does this question become desirable?** to indicate in which phase of the project a question should be answered, e.g. Before submitting the proposal.
7. **Value type** can be *String*, *Number*, *Date*, *Date Time*, *Time*, *Text*, *Email*, *URL* or *Color*, select *Text*

**Integrations**

1. Click on **Introduction** in the overview area of the editor
2. Press *+Add question* in order to create a new question
3. Select *Integration* as **Question Type**

.. TODO::

    Finish this


**Multi-Choice**

.. TODO::

    Finish this

