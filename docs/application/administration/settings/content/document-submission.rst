Document Submission Settings
****************************

If we enable the **Document Submission** feature, users will be able to see :guilabel:`Submit` option for their documents. After selecting it, they will be prompted to select a service compatible with the document where they want to submit it.

Each service must have its own **ID** (recommended is to use lowercase alphanumeric symbols and dash symbols). Then, we can set human-readable **Name** and **Description** (Markdown-enabled) to clarify for users what is this service and in what cases they should use it. We also need to specify the **Supported Formats**, for each we need to select a document template, its version, and the desired format. Finally, we configure how the document is sent to the external service, the request may contain some **User Properties** (users will be able to set values for them in their user profiles) and it is a HTTP request with a specific **Method**, sent to the **URL**, possibly with HTTP **Headers**. The very last option is to check whether the file should be sent as **Multipart** (with its own **File Name**) instead of plainly in the request body. Most of this configuration should be specified by the external submission service.

.. NOTE::

    In case we will update the document template used in **Supported Formats**, we should verify that it is still suitable for the submission service and if yes, then add it as a new entry under **Supported Formats**.

