.. _integration-migration:

Migration from Legacy API Integration
*************************************

To migrate a knowledge model from API Integration Legacy to API Integration v2, we need to recreate the integration and connect it to the respective questions. To do that, open the knowledge model Editor. There, navigate to the existing integrations. The best practice is to create the integration from scratch. You can follow this :ref:`configuration guide<integration-api-configuration>`.

We recommend recreating the integration to keep the original one as a reference. This allows you to copy the configuration from it and identify which questions are using the legacy integration so you can connect them to the new one.

Once the new API Integration v2 instances are successfully created and the integration questions are connected to them, you can delete the old integrations and release the knowledge model. Then you can migrate projects.

.. NOTE::

    If you somehow manage to lose the content of the integrations before they are recreated, you can always create a new knowledge model editor.

During the migration from API Integration Legacy to API Integration v2, the existing integration replies in projects are migrated automatically. However, there are differences in how the data is stored. The following sections describe how the data is handled in each state:
- Legacy API Integration
- Migrated to API Integration v2 (legacy data)
- New API Integration v2 with “raw = HTTP response”

**State A — Legacy API Integration (ApiLegacyIntegration)**

This is how API Integration Legacy stores the data.

**What is stored:**

- an ``id`` (the selected item identifier)
- a ``type``: ``IntegrationLegacyType``
- a ``value`` (the rendered markdown or text displayed in the UI)

.. code:: json

    {
        "type": "IntegrationReply",
        "value": {
            "id": "0000-0003-3856-1682",
            "type": "IntegrationLegacyType",
            "value": "**Kryštof** **Komanec** \nORCID: **0000-0003-3856-1682** \n\n\n*Czech Technical University in Prague*  \n*Prague University of Economics and Business*  \n "
        }
    }


**State B — Migrated to API Integration v2 (existing data)**

After migrating to API Integration v2, the existing data is stored differently.

**What changes compared to Legacy:**

- ``id`` is **removed**
- ``raw`` is introduced but remains empty: ``"raw": {}``
- ``type`` becomes ``IntegrationType`` instead of ``IntegrationLegacyType``
- ``value`` remains the same (the markdown reply rendered in the UI)

.. code:: json

    {
        "type": "IntegrationReply",
        "value": {
            "raw": {},
            "type": "IntegrationType",
            "value": "**Kryštof** **Komanec** \nORCID: **0000-0003-3856-1682** \n\n\n*Czech Technical University in Prague*  \n*Prague University of Economics and Business*  \n "
        }
    }


**State C — New API Integration v2 with IntegrationType reply**

If you delete the old answer and provide a new one, or if you answer a new integration question using API Integration v2, the data is stored differently. The semantics of the stored data also change. The ``raw`` field now contains the raw HTTP response from the API, which can be used in the answer template.

**What is stored:**

- ``raw`` = the actual integration HTTP response item or body, which serves as the source of truth
- ``type`` = ``IntegrationType``
- ``value`` = custom text entered by the user or rendered template output, generated from the ``raw`` data using the answer template

.. code:: json

    {
        "type": "IntegrationReply",
        "value": {
            "raw": {
                "credit-name": null,
                "email": [],
                "family-names": "Komanec",
                "given-names": "Kryštof",
                "institution-name": [
                    "Czech Technical University in Prague",
                    "Prague University of Economics and Business"
                ],
                "orcid-id": "0000-0003-3856-1682",
                "other-name": []
            },
            "type": "IntegrationType",
            "value": "**Kryštof** **Komanec** \nORCID: [**0000-0003-3856-1682**](https://orcid.org/0000-0003-3856-1682)\n\n"
        }
    }


**State D - New API Integration v2 with PlainType reply**

If custom reply is enabled in the integration configuration, the answer to an integration question can also be a plain text. In that case, the data is stored as follows.

**What is stored:**

- ``type`` = ``PlainType``
- ``value`` = the plain text answer provided by the user.

.. code:: json

    {
        "type": "IntegrationReply",
        "value": {
            "type": "PlainType",
            "value": "https://orcid.org/0000-0003-3856-1682"
        }
    }

