Security Reports
****************

Report a security problem privately to support@ds-wizard.org. Include the affected component and version, the steps needed to reproduce it and its possible impact. Avoid putting passwords, API keys or private project data in a public issue.

Check the release notes and the affected component's repository for published security fixes. This guide does not maintain a complete vulnerability register.

Deployment precautions
======================

* Change or remove demonstration accounts before making an instance public.
* Review the default role assigned during registration.
* Use HTTPS for the public client and API.
* Back up the database, object storage and configuration regularly.
* Configure the mail provider's supported SSL or STARTTLS transport.
* Use strong passwords, especially for administrators.

For deployment and upgrade instructions, see :doc:`/more/self-hosted-dsw/index`.
