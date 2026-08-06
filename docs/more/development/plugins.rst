.. _development-plugins:

Plugins
*******

.. WARNING::
    
    The plugins functionality is considered experimental.


This page provides information on how to develop plugins for DSW. Information on installing plugins can be found here: :ref:`plugins installation<configuration-plugins>`.

If we want to extend DSW with new features, we can create plugins that will add the desired functionality.

To develop a plugin, we will need the DSW Plugin SDK, which is a library that will help us create, test, and deploy plugins for DSW. The SDK provides a framework for building plugins, as well as documentation and examples to get us started. The DSW Plugin SDK can be found here: https://github.com/ds-wizard/dsw-plugin-sdk.

There are two templates we can use to create a new plugin:

- **DSW Plugin Template**: https://github.com/ds-wizard/dsw-plugin-template - to create plugins that extend DSW functionality using only the frontend part.
- **DSW Plugin Service Template**: https://github.com/ds-wizard/dsw-plugin-service-template - to create plugins that also have a backend service part.

If we want to create a plugin using the backend service part, we can either use the Engine Gateway or create a new service from scratch using our preferred framework. The Engine Gateway has its own documentation here: https://github.com/ds-wizard/engine-gateway.
