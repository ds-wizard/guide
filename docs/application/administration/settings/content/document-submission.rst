.. _document-submission-settings:

Document Submission
*******************

If we enable the **Document Submission** feature, users will be able to see :guilabel:`Submit` option for their documents. After selecting it, they will be prompted to select a service compatible with the document where they want to submit it.

For each service, configure:

* **ID**, **Name** and **Description** to identify it to users. The description supports Markdown.
* **Supported Formats**: the document template, version and format accepted by the service.
* The HTTP **Method**, **URL** and any required **Headers**.
* **User Properties** for values each user supplies, such as an API token.
* **Multipart** and **File Name** if the service expects a multipart upload instead of a file in the request body.

Use the request format specified by the external service.

If the submission service requires additional user properties, we can set those values under :ref:`submission-settings`. For example, if the submission service requires an API token, we can set it there.

.. NOTE::

    In case we will update the document template used in **Supported Formats**, we should verify that it is still suitable for the submission service and if yes, then add it as a new entry under **Supported Formats**.


.. figure:: /_static/screenshots/5.0/settings-submission.png
    :figclass: guide-screenshot
    :alt: Document Submission settings in DSW 5.0
    :width: 760

    Document Submission settings.
