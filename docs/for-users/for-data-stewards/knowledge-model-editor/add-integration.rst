***************
Add Integration
***************

Not sure how to add an integration or use an integration widget? Or want to know more information about it?

----

.. NOTE::

    **API integration** - has to be implemented in the DS Wizard.

    **Widget integration** - has to be implemented on both sides (DS Wizard and the data provider).

    For more info about integrations scroll down

Add Integration
===============

Either :doc:`create-knowledge-model` or :doc:`edit-knowledge-model`.

Then click on "Add integration".

.. TODO::

    Add Screenshot Click on Add Integration

Select "API" or "Widget" from dropdown menu and fill out the information.

.. TODO::

    Add Screenshot Integration Screen

.. WARNING::

    To finish adding the new integration, don't forget to click on the "Save button".

About Integrations
==================

The DS Wizard support integrations of external services with API responding with JSON result containing a list of items. Such list can be used to type hints in a special type of question - the Integration question.

Integration
===========

You can create a new integration in the root of any Knowledge Model by clicking on **Add integration** in the **Integrations** section. A form that might seem to be a bit complicated at the first sight will appear. But filling it up is very simple. All you need to know is how the API of what you want to integrate works. Every API should have its documentation that you can use and we recommend also trying it with `postman <https://www.postman.com/>`__ or `curl <https://curl.se/>`__.

* **Id** = internal identifier of integration used in the Wizard, not visible in the Questionnaire
* **Name** = name of the integration, typically name of the integrated service
* **Logo** = BASE64 encoded logo of the service (we recommend PNG with width around 100px, there are services that can encode the logo from file for you, for example, `Base64 Image Encoder <https://www.base64-image.de/>`__
* **Props** = variables for building the request specific to integration questions (for example, ``filter`` when you want to filter the results based on some attributes specific to a question and the API allows that)
* Request
    * **Request Method** = HTTP method used to request result from API (typically ``GET``)
    * **Request URL** = target of the request, you should use ``${q}`` variable that contains what the user fills in the field (to search), then you may use variables specified in **Props** (e.g. ``${filter}``) and also variables from the configuration file
    * **Request Headers** = various headers specified by API (usually ``Accept: application/json`` or some authentication header)
    * **Request Body** = content of the request (for ``GET`` it should be empty)
* Response
    * **Response List Field** = path in the JSON response to a list of results (dot notation can be used to navigate in complex structures)
    * **Response Id Field** = defines an identifier for the item. This will be used in Item URL as ``${id}`` to compose a URL to the found item. You can use properties from the returned item in `Jinja2 notation <https://ginger.tobiasdammers.nl/guide/>`__. For example, if the item has a field id use ``{{item.id}}`` here. You can also compose multiple fields together, e.g., ``{{item.field1}}-{{item.field2}}``
    * **Response Item Template** = how the found items will be displayed for the user. You can use properties from the returned item in `Jinja2 notation <https://ginger.tobiasdammers.nl/guide/>`__, you can also use :doc:`../../../miscellaneous/markdown-cheatsheet` for some formatting. For example, if the returned item has a field called name, you can use **{{item.name}}** to display the name in bold
    * **Response Item URL** = URL that will be displayed when an item from integration is selected, it should lead the user to more information about that item, you can use ``${id}`` (a ``props``) variable to build the URL

Dot notation is used to navigate in more complex JSON structures when the list of items or attributes of items that need to be extracted are hidden inside. For example, you would use ``result.list`` together with ``attributes.id`` and ``attributes.data.name`` in case of:

.. CODE-BLOCK:: json

    {
        "result": {
            "list": [
                { "attributes": { "id": "id01",
                            "data": { "name": "Foo",
                                        //...
                                    }
                                }
                }, //...
            ], //...
        }, //...
    }

Configuration file
==================

There is a special configuration file for integrations (typically ``integrations.yml``) that you can use to keep some settings out of the KM (e.g. URL of the API endpoint or API key that you don’t want to share). The file can contain for each integration (using its **Id**) a list of key-values.

Starting 3.11, you can store the YAML configuration directly in DSW under Settings > Knowledge Models > Integration Config.

.. WARNING::

    We highly recommend storing sensitive data such as API keys in the configuration file rather than directly as text in the knowledge model that can be exported to the file and distributed easily by mistake.

Integration question
====================

When you have some integration(s) configured, you can create questions of type **Integration**, then you have to select which integration should be used and if has any **Props** defined, you can fill them as well. Using the **Preview** functionality, you can easily verify if it works. If *Unable to get type hints* error appears, your configuration is not correct (looking at the server log can be helpful if you have access to it).

FAIRsharing Proxy
=================

To use the newer FAIRsharing API in your KM from DSW, you can use our proxy service that allows to send credentials in headers instead of needing additional requests to authenticate. To continue with "legacy" format of FAIRsharing API, you can do requests to GET requests to ``/legacy/search`` with header ``Api-Key`` where value is `base64 encoded <https://www.base64encode.org/>`__ string ``<username>:<password>`` (as for HTTP Basic Auth). In case you are using DSW root KM, your integration YAML config should look like this:

.. CODE-BLOCK:: yaml

    fairsharing:
        apiUrl: https://fairsharing4dsw.ds-wizard.org/legacy
        apiKey: dXNlcm5hbWU6cGFzc3dvcmQ=
    #        ^ = base64("username:password")

For new search, you can use GET or POST to ``/search`` endpoint.

Additional documentation may be provided in the future. `The proxy is available as open-source <https://github.com/ds-wizard/fairsharing-proxy>`__.
