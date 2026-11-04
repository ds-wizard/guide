Application and Email Translations
**********************************

DSW manages interface and email text separately under :guilabel:`Settings` → :guilabel:`Translations`. Under the :guilabel:`Translations` heading, choose :guilabel:`Application` for interface text or :guilabel:`Emails` for messages sent by DSW. The pages are titled Application Translations and Email Translations.

These translations are separate from knowledge-model questionnaire languages and document-template output languages.

Manage languages
================

The list shows installed languages, their versions and whether they are enabled. Enable a language before making it the default. Users choose their interface language in :doc:`/application/profile/settings/language`.

Use :guilabel:`Download PO` to export an installed translation. Use :guilabel:`Download POT` to obtain the message template for the running version. Untranslated messages fall back to English.

Prepare a custom translation
============================

#. Download the application or email POT file.
#. Open it in a gettext editor and save a PO file for the target language in UTF-8.
#. Set the ``Language`` header, such as ``cs``. Keep the ``Project-Id-Version`` header from the POT; it identifies the message set and version.
#. Translate messages while preserving placeholders, markup and plural forms.
#. :doc:`Upload the PO file <upload>`, review warnings and enable the language.

Application files use the DSW client message set; email files use the DSW mail-template message set. They cannot be interchanged. Greetings and footers may be shared by several email types.

Keep custom PO files and update them when the application's messages change. The old ZIP locale bundles are replaced by this PO workflow in 5.0.


.. figure:: /_static/screenshots/5.0/settings-locales.png
    :figclass: guide-screenshot
    :alt: Interface translations in DSW 5.0
    :width: 760

    Interface translations.

.. figure:: /_static/screenshots/5.0/settings-mail-template-locales.png
    :figclass: guide-screenshot
    :alt: Email translations in DSW 5.0
    :width: 760

    Email translations.


.. toctree::
   :maxdepth: 1

   Import from Registry <registry>
   Upload <upload>
