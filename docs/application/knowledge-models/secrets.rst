.. _knowledge-model-secrets:

Knowledge Model Secrets
***********************

Sometimes, we might need to use some secrets (for example for authentication token), additional properties (such as API URL), or basically any information that we do not want to include in the knowledge model.

We can either click the :guilabel:`Configure secrets` in integration setup or navigate there through :guilabel:`Knowledge Models → Secrets`.

Then we can add a new secret by clicking the :guilabel:`Create secret` button. So, for example, if we want to create a secret ``apiUrl``, we then need to fill the name and value, and save it.

.. figure:: secrets/secrets.png
    
    List of knowledge model secrets.


Then we can go back to the knowledge model editor and in the **Advanced Integration Configuration**, we can click the :guilabel:`copy` button next to the Secret we want to use (we have the same copy button for Variables). This copies the secret name in the Jinja2 format ``{{ secrets.apiUrl }}``, which we can then use in the request configuration.
