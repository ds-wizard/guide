.. _knowledge-model-publish:

Publish
*******

Before the knowledge model can be used by researchers in their projects, we need to publish it. We can get to the publish form by clicking the :guilabel:`Publish` button in the top right corner of the knowledge model editor.

.. figure:: publish/publish-modal.png
    :width: 528
    
    Publish form where we fill additional details for the knowledge model.


The publish form shows us some information about the knowledge model, such as it's name nad ID, as well as what was the **last version** that was published. We need to choose the new **version number**. There are some suggestions based on what the previous version was.

.. NOTE::

    We recommended using similar approach as in `semantic versioning <https://semver.org>`_. So when we have a version ``<major>.<minor>.<patch>``, change in the major version number indicates some breaking changes (deleting questions, significant changes in the questionnaire structure, etc.), change in minor version number indicates some new changes that are backwards compatible (i.e., adding a new question), and change in the patch version number indicate some fixes (such as fixing some typos).


Then we need to add some additional metadata (these fields are pre-filled if there was a previous version published):

- **License** - this is used when we want to share the knowledge model with other people so they know how they can do that. We recommend using a license identifier from `SPDX Licens List <https://spdx.org/licenses/>`_.
- **Description** - this should be really short and descriptive. It is used, for example, in select boxes when creating a new project to help reseaerchers choose the best knowledge model for their use case.
- **Readme** - this is where we can describe everything we need about the knolwedge model. We can, for example, include a changelog of what changed in what version, etc. We can use :ref:`Markdown<markdown>` in this field to provide some nice formatting.
