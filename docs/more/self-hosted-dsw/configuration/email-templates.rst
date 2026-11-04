.. _configuration-email-templates:

Email Templates
***************

For translated or customized email text, use :doc:`application and email translations </application/administration/settings/translations/index>`. Download the email POT file, prepare a PO file, upload it and enable the language. Preserve placeholders and markup used by the message.

Changing the underlying email layout is a mailer deployment customization. The mailer uses Jinja templates and can produce HTML and plain-text messages, attachments and inline images. Consult the template files in the matching `engine-tools mailer version <https://github.com/ds-wizard/engine-tools/tree/main/packages/dsw-mailer>`_ before overriding them.

Keep custom layouts and test registration, password recovery and project invitation messages after upgrading. A custom layout can affect all languages; it is separate from an individual PO translation.
