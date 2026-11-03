.. _markdown-cheatsheet:

Markdown Cheatsheet
*******************

Use the field's preview to check formatting. Rendering can depend on where the text is displayed and on the document template used for an export.

Various text fields can be formatted using Markdown. The examples below cover the basic and extended syntax used in the application.

Basic Syntax
============

.. list-table::
   :header-rows: 1
   :widths: 30 70

   * - Formatting
     - Markdown syntax
   * - Heading 1
     - ``# Heading 1``
   * - Heading 2
     - ``## Heading 2``
   * - Heading 3
     - ``### Heading 3``
   * - Heading 4
     - ``#### Heading 4``
   * - Heading 5
     - ``##### Heading 5``
   * - Heading 6
     - ``###### Heading 6``
   * - **Bold text**
     - ``**Bold text**``
   * - *Italic text*
     - ``*Italic text*``
   * - Blockquote
     - ``> Blockquote``
   * - Inline code
     - `` `Code` ``
   * - Horizontal rule
     - ``---``
   * - Link
     - ``[DS Wizard](https://ds-wizard.org)``
   * - Image
     - ``![Meaningful image description](https://example.org/image.png)``

Use one item per line for lists:

.. code-block:: markdown

   1. First item
   2. Second item
   3. Third item

   - First item
   - Second item
   - Third item

Extended Syntax
===============

Use a header and separator row for a table:

.. code-block:: markdown

   | Name | Value |
   | --- | --- |
   | Dataset 1 | 123 |
   | Dataset 2 | 211 |

Use a fenced code block for a longer code example:

.. code-block:: markdown

   ```
   Codeblock
   ```

.. list-table::
   :header-rows: 1

   * - Formatting
     - Markdown syntax
   * - Strikethrough
     - ``~~Strikethrough~~``
   * - Completed task
     - ``- [x] Task 1``
   * - Remaining task
     - ``- [ ] Task 2``

Available rendering can depend on where the field is displayed, including the document template used for an export. Images should have a meaningful description for readers who cannot see them.
