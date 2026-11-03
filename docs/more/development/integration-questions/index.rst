.. _integration-questions:

Integration Questions
*********************

An integration question searches an external service and stores the selected result in the questionnaire. API integrations can connect DSW to services such as FAIRsharing or ROR.

Configure the integration in the knowledge model, then select it for the integration question. Define the request, response extraction and answer template. The :doc:`API integration configuration <integration-api>` describes these fields.

Installed plugins can also provide integrations. Choose the plugin integration in the knowledge model editor and follow the fields supplied by that plugin. Available integrations depend on the plugins enabled for the instance.

Integration credentials should use :doc:`knowledge model secrets </application/knowledge-models/secrets>` instead of being embedded in the model. Test the integration with the service before publishing the model.


.. todo::

   Screenshot: API integration configuration and test results.


.. toctree::
   :maxdepth: 1

   integration-api
