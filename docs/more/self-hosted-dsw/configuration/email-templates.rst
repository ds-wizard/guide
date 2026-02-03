..  _configuration-email-templates:

Email Templates
***************

Similarly to document templates, we can customize templates for emails sent by the Wizard located in ``templates`` folder. It also uses `Jinja templating language <https://jinja.palletsprojects.com/en/3.1.x/>`__. And we can create HTML template, Plain Text template, add attachments, and add inline images (which can be used inside the HTML using `Content-ID <https://en.wikipedia.org/wiki/MIME#Related>`__ equal to the filename). We can learn more about the template structure and contents directly from `the mailer GitHub repository <https://github.com/ds-wizard/engine-tools/tree/develop/packages/dsw-mailer/templates>`__.

Including our own email templates while using dockerized Wizard is practically the same as for DMP templates. We can also bind whole ``templates`` folders. (or even ``templates`` if we want to change both):

.. CODE-BLOCK:: yaml

    mailer:
        image: datastewardshipwizard/mailer
        restart: always
        depends_on:
        - postgres
        - dsw-server
        volumes:
        - ./config/application.yml:/app/config/application.yml:ro
        - ./templates:/home/user/templates:ro
    # ... (continued)

