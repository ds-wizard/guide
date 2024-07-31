*********************************
Application Programming Interface
*********************************

An Application Programming Interface (API) allows machines, such as other systems and tools, to perform actions and transfer data based on agreed-upon methods. 

By selecting the :guilabel:`About` option from the :ref:`Profile<profile>` menu, users are directed to the :ref:`About<about>` page where the :guilabel:`API URL` and :guilabel:`API Docs` are provided. Each instance includes SwaggerUI API Documentation, which allows you to explore all operations and data transfer and also you to directly try out the API calls, with example responses provided for guidance.

Authentication and Authorization
================================

DSW utilizes JSON Web Tokens (JWT) for both authentication and authorization, ensuring secure access and control over API interactions. To obtain a token, you must have a user account, and there are multiple methods to acquire one:

* **Credentials** (Email + Password): Send a POST request to /tokens with your email and password. If your credentials are correct and your account is active, you will receive a token along with its expiration time in the response.
* **OpenID Identity Provider** (for our client only): This method involves a more complex OpenID/OAuth flow, utilizing redirects with the ``/auth/{id}/`` endpoints to authenticate.
* **API Keys**:  You can generate an API key in your user profile, which remains valid until its specified expiration date.

While several public endpoints are accessible without authentication, most endpoints require it. The system will check if you are authorized to perform specific operations based on your :ref:`roles<user-roles>` and their permissions. These roles are defined globally and can also be specific to projects. This ensures that only authorized users can access and manipulate with sensitive resources.

Example
=======

After obtaining your authentication token and reviewing the API documentation, you can start making API calls to execute actions and transfer data, easily integrating them into your projects. Here's a simple example using the Requests library in Python:

.. code-block::

    import requests

    API_URL = '...'
    API_KEY = '...'

    response = requests.get(
        url=f'{API_URL}/users/current',
        headers={'Authorization': f'Bearer {API_KEY}'},
    )
    response.raise_for_status()
    user = response.json()
    print(f'This API Key belongs to {user["email"]}')

