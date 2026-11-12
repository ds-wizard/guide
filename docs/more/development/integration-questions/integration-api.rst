Integration Question - API
**************************

:ref:`Integration questions <integration-question>` can search an external service through its API. The request configuration defines the search; the response and answer templates define which result is saved and how it is displayed. Include a link or persistent identifier in the answer template when the service provides one.

We can use `Jinja2 templating language <https://jinja.palletsprojects.com/en/stable/>`_ to construct everything in integrations. We also have this :ref:`cheatsheet<jinja-cheatsheet>` available.


External Service Requirements
=============================

An external service must meet the following requirements for an API integration with DSW.

- **Allows search using free text**

  - There must be a way to send a search phrase to the API so that it can filter the results based on it

- **Returns a JSON response with a list of results**

  - The response must be JSON so DSW can parse it
  - There needs to be a JSON list where all the items matching the search query are

.. _integration-api-configuration:

Configuration
=============


The configuration is done in the :ref:`knowledge model editor<knowledge-model-editor>`. First of all, we need to create a new integration and choose its **Type** to be **API**. Then we need to fill the integration **Name**.

Advanced Integration Configuration
----------------------------------

Additional integration configuration can be used when we want to force the integration reply, or when adding and editing **Variables** and **Secrets**.

- **Allow Custom Reply** - The custom reply is turned on by default. We can turn it off if we want to force the integration reply. In that case, users will have to select one of the results from the external service, otherwise their reply will not be saved. Explain this requirement in the question description.
- **Variables** - We can use variables to parametrize the integration for each question. Variables can be filled on questions that use this integration and then used in the request configuration. For example, if you define a variable named ``type``, you can use it as ``{{ variables.type }}``, such as ``https://example.com/{{ variables.type }}``.
- **Secrets** - Secrets can be used to store sensitive information, such as API keys or access tokens. We can reference these secrets as ``{{ secrets.secret_name }}`` anywhere in the request configuration, but their values will not be exposed in the question or answer templates. The additional knowledge model secrets documentation can be found :ref:`here<knowledge-model-secrets>`.

Request Configuration
---------------------

In the field before the URL, we can switch between ``GET`` and ``POST`` request methods.

In the full API endpoint used for search we can use ``{{ q }}`` to insert the user's search term, and ``{{ variables.name }}`` for referencing variables and ``{{ secrets.name }}`` for secrets.

So for example, we can write **Request URL** as:

.. code-block::

    {{ secrets.apiUrl }}/search/?q={{ q }}&registry={{ variables.registry }}

We can also import the request configuration from a cURL command using the **Import** button.

Advanced Request Configuration
------------------------------

The advanced request configuration defines how the API request is constructed. This includes the request HTTP headers, request HTTP body and allow empty search switch.

- **Request HTTP Headers** - some headers might be needed, such as ``Accept: application/json`` to have a correct response type
- **Request HTTP Body** - if we need to send some HTTP body
- **Allow Empty Search** - some APIs don't work if we try to search with an empty string, turn this off in that case

We can use ``{{ q }}`` for the search term, ``{{ variables.name }}`` for referencing variables and ``{{ secrets.name }}`` for secrets within those fields.

Test
----

In this section we can test the API integration. After filling in **Request Configuration**, **Test Search Query**, and optionally **Test Variables** we can use the **Load** button to send a test request to the API and see the response.

Then we can view the **Request Details** and **Response**. In case of a large response, there will be no syntax highlighting for better performance. Otherwise, the response JSON will be syntax highlighted for better readability. There is also a **Copy response** button to copy the whole response JSON. In case of error we can check the logs for more information. In case of success, we can see the response JSON and use it to fill the **Response Configuration**.

Response Configuration
----------------------

.. WARNING::

    We need to run a valid test request before we can configure the response.


In the **Response** section, we configure how to process the JSON response from the external service. For that, we need to configure the following:

- **Response List Field** - where in the JSON response is the list of items corresponding to the search query
- **Response Item Template** - how we want to present the result to the user

.. NOTE::

    We can also set the **Response Item Template** and/or **Response Item Template for Selection** to set up a logo for the integration if we can access it.

The integration will show suggestions for **Response List Field** and **Response Item Template** based on the response structure. We can click the suggestions to insert them in the fields in the Jinja2 notation.

Advanced Response Configuration
-------------------------------

In the advanced response configuration, we can set **Response Item Template for Selection** to define how results appear before the user selects one.
