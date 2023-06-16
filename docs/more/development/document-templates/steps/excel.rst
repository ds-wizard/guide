.. _document-template-step-excel:

Step: ``excel``
***************

|badge-status| |badge-metamodel|

Step producing Excel spreadsheets from JSON file with instructions.

Input
=====

JSON file containing instructions how to construct the desired Excel spreadsheet as described further in this section.

Properties
----------

It allows to set both `basic <https://xlsxwriter.readthedocs.io/workbook.html#set_properties>`__ and `custom <https://xlsxwriter.readthedocs.io/workbook.html#set_custom_property>`__ properties of the workbook / spreadsheet.

.. code:: json

   {
     "properties": {
       "document": {
         "title": "My example workbook",
         "subject": "",
         "author": "Albert Einstein",
         "manager": "",
         "company": "ACME",
         "category": "",
         "keywords": "test,example,foo,bar",
         "created": "2018-01-01",
         "comments": ""
       },
       "custom": [
         {
           "projectUuid": "...",
         }
       ]
     }
   }

Options
-------

It allows to specify various `workbook options <https://xlsxwriter.readthedocs.io/workbook.html#constructor>`__.

.. code:: json

   {
     "options": {
       "strings_to_numbers": true,
       "strings_to_urls": true,
       "use_future_functions": true,
       "max_url_length": 255,
       "nan_inf_to_errors": true,
       "default_date_format": null,
       "remove_timezone": true,
       "use_zip64": false,
       "date_1904": false,
       "calc_mode": "auto",
       "read_only_recommended": false,
       "active_sheet": 0,
       "vba_name": "foo",
       "size": {
         "width": 0,
         "height": 0
       },
       "tab_ratio": 50
     }
   }

Notes:

-  ``active_sheet`` is an index of sheet to be active when document is opened.
-  ``size`` sets the default `window size <https://xlsxwriter.readthedocs.io/workbook.html#set_size>`__.
-  ``tab_ratio`` sets `ratio <https://xlsxwriter.readthedocs.io/workbook.html#tab_ratio>`__ between the worksheet tabs and the horizontal slider.

Definitions
-----------

It allows to define a name to be then used as a variable (see `define_name <https://xlsxwriter.readthedocs.io/workbook.html#define_name>`__).

.. code:: json

   {
     "definitions": {
       "Exchange_rate": "=0.96"
     }
   }

Formats
-------

It specifies formats in the spreadsheets that can be then used for cells in sheets. Possible options can be found in the `documentation <https://xlsxwriter.readthedocs.io/format.html#format-methods-and-format-properties>`__.

.. code:: json

   {
     "formats": {
       "myBoldFormat": {
         "bold": true
       }
     }
   }

The example above creates a format named ``myBoldFormat`` that has bold text.

Charts
------

It specifies charts that can be then inserted inside sheets or used as chartsheets.

The options are documented `here <https://xlsxwriter.readthedocs.io/chart.html>`__. Basically, each chart must have a unique ``name`` and then can have some ``options``, `series <https://xlsxwriter.readthedocs.io/chart.html#chart-add-series>`__, and ``axis`` (e.g. `x axis <https://xlsxwriter.readthedocs.io/chart.html#chart-set-x-axis>`__).

Finally, there are some basic and advanced settings:

-  Basic:
   `size <https://xlsxwriter.readthedocs.io/chart.html#chart-set-size>`__,
   `title <https://xlsxwriter.readthedocs.io/chart.html#chart-set-title>`__,
   `legend <https://xlsxwriter.readthedocs.io/chart.html#chart-set-legend>`__,
   `chartarea <https://xlsxwriter.readthedocs.io/chart.html#chart-set-chartarea>`__,
   `plotarea <https://xlsxwriter.readthedocs.io/chart.html#chart-set-plotarea>`__,
   `style <https://xlsxwriter.readthedocs.io/chart.html#chart-set-style>`__,
   `table <https://xlsxwriter.readthedocs.io/chart.html#chart-set-table>`__
-  Advanced:
   `combine <https://xlsxwriter.readthedocs.io/chart.html#chart-combine>`__,
   `up_down_bars <https://xlsxwriter.readthedocs.io/chart.html#chart-set-up-down-bars>`__,
   `drop_lines <https://xlsxwriter.readthedocs.io/chart.html#chart-set-drop-lines>`__,
   `high_low_lines <https://xlsxwriter.readthedocs.io/chart.html#chart-set-high-low-lines>`__,
   `show_blanks_as <https://xlsxwriter.readthedocs.io/chart.html#chart-show-blanks-as>`__,
   `show_hidden_data <https://xlsxwriter.readthedocs.io/chart.html#chart-show-hidden-data>`__

.. code:: json

   {
     "name": "myChartA",
     "combine": "myChartB",
     "options": {
       "type": "bar",
       "subtype": "percent_stacked"
     },
     "series": [
       {
         "name": "=Sheet1!$B$1",
         "categories": "=Sheet1!$A$2:$A$7",
         "values": "=Sheet1!$B$2:$B$7"
       }
     ],
     "axis": {
       "x": {"name": "Test number"},
       "y": {"name": "Sample length (mm)"}
     }
   }

``sheets``
----------

It is the main part specifying a list of sheets in the workbook, where each sheet has ``name`` (optional), ``type`` (optional, ``work`` or ``chart``), ``options`` and then based on the ``type`` it has either ``chart`` (for chartsheet) or ``data`` (for worksheet). Some of the ``options`` are common for both chartsheet and datasheet. The order of sheets in the list corresponds to the order in the Excel spreadsheet.

Chartsheet
^^^^^^^^^^

A chartsheet simply refers to a ``chart`` (by its ``name``) that should be placed in this chartsheet.

The possible ``options`` are:

-  Basic:
   `first_sheet <https://xlsxwriter.readthedocs.io/worksheet.html#worksheet-set-first-sheet>`__,
   `protect <https://xlsxwriter.readthedocs.io/worksheet.html#worksheet-protect>`__,
   `zoom <https://xlsxwriter.readthedocs.io/worksheet.html#worksheet-set-zoom>`__,
   `tab_color <https://xlsxwriter.readthedocs.io/worksheet.html#worksheet-set-tab-color>`__,
   `page_view <https://xlsxwriter.readthedocs.io/page_setup.html#set-page-view>`__,
   `select <https://xlsxwriter.readthedocs.io/worksheet.html#select>`__,
   `hide <https://xlsxwriter.readthedocs.io/worksheet.html#hide>`__
-  Print: ``orientation``
   (`landspace <https://xlsxwriter.readthedocs.io/page_setup.html#set-landscape>`__
   or
   `portrait <https://xlsxwriter.readthedocs.io/page_setup.html#set-portrait>`__),
   `paper <https://xlsxwriter.readthedocs.io/page-setup.html#set-paper>`__,
   `margins <https://xlsxwriter.readthedocs.io/page_setup.html#set-margins>`__,
   `header <https://xlsxwriter.readthedocs.io/page_setup.html#set-header>`__,
   `footer <https://xlsxwriter.readthedocs.io/page_setup.html#set-footer>`__,
   `center_horizontally <https://xlsxwriter.readthedocs.io/page_setup.html#worksheet-center-horizontally>`__,
   `center_vertically <https://xlsxwriter.readthedocs.io/page_setup.html#worksheet-center-vertically>`__

.. code:: json

   {
     "name": "Nice chart",
     "type": "chart",
     "chart": "myChartA",
     "options": {
       "tab_color": "red"
     }
   }

Worksheet
^^^^^^^^^

Traditional worksheet with many options and data placed into cells. There are more options when compared to chartsheets.

The possible ``options`` are:

-  Basic (common):
   `first_sheet <https://xlsxwriter.readthedocs.io/worksheet.html#worksheet-set-first-sheet>`__,
   `protect <https://xlsxwriter.readthedocs.io/worksheet.html#worksheet-protect>`__,
   `zoom <https://xlsxwriter.readthedocs.io/worksheet.html#worksheet-set-zoom>`__,
   `tab_color <https://xlsxwriter.readthedocs.io/worksheet.html#worksheet-set-tab-color>`__,
   `page_view <https://xlsxwriter.readthedocs.io/page_setup.html#set-page-view>`__,
   `select <https://xlsxwriter.readthedocs.io/worksheet.html#select>`__,
   `hide <https://xlsxwriter.readthedocs.io/worksheet.html#hide>`__
-  Print (common): ``orientation``
   (`landspace <https://xlsxwriter.readthedocs.io/page_setup.html#set-landscape>`__
   or
   `portrait <https://xlsxwriter.readthedocs.io/page_setup.html#set-portrait>`__),
   `paper <https://xlsxwriter.readthedocs.io/page-setup.html#set-paper>`__,
   `margins <https://xlsxwriter.readthedocs.io/page_setup.html#set-margins>`__,
   `header <https://xlsxwriter.readthedocs.io/page_setup.html#set-header>`__,
   `footer <https://xlsxwriter.readthedocs.io/page_setup.html#set-footer>`__,
   `center_horizontally <https://xlsxwriter.readthedocs.io/page_setup.html#worksheet-center-horizontally>`__,
   `center_vertically <https://xlsxwriter.readthedocs.io/page_setup.html#worksheet-center-vertically>`__
-  Basic:
   `comments_author <https://xlsxwriter.readthedocs.io/worksheet.html#set_comments_author>`__,
   `hide_zero <https://xlsxwriter.readthedocs.io/worksheet.html#hide_zero>`__,
   `hide_row_col_headers <https://xlsxwriter.readthedocs.io/page_setup.html#hide_row_col_headers>`__,
   `right_to_left <https://xlsxwriter.readthedocs.io/worksheet.html#right_to_left>`__,
   `hide_gridlines <https://xlsxwriter.readthedocs.io/page_setup.html#hide_gridlines>`__,
   `ignore_errors <https://xlsxwriter.readthedocs.io/worksheet.html#ignore_errors>`__,
   `vba_name <https://xlsxwriter.readthedocs.io/workbook.html#set_vba_name>`__
-  Print (advanced):
   `print_row_col_headers <https://xlsxwriter.readthedocs.io/page_setup.html#print_row_col_headers>`__,
   `print_area <https://xlsxwriter.readthedocs.io/page_setup.html#print_area>`__,
   `print_across <https://xlsxwriter.readthedocs.io/page_setup.html#print_across>`__,
   `fit_to_pages <https://xlsxwriter.readthedocs.io/page_setup.html#fit_to_pages>`__,
   `start_page <https://xlsxwriter.readthedocs.io/page_setup.html#set_start_page>`__,
   `print_scale <https://xlsxwriter.readthedocs.io/page_setup.html#set_print_scale>`__,
   `print_black_and_white <https://xlsxwriter.readthedocs.io/page_setup.html#print_black_and_white>`__
-  Special ranges:
   `unprotect_ranges <https://xlsxwriter.readthedocs.io/worksheet.html#unprotect_range>`__,
   `top_left_cell <https://xlsxwriter.readthedocs.io/worksheet.html#set_top_left_cell>`__,
   `selection <https://xlsxwriter.readthedocs.io/worksheet.html#set_selection>`__
-  Repeats:
   `repeat_rows <https://xlsxwriter.readthedocs.io/page_setup.html#repeat_rows>`__,
   `repeat_columns <https://xlsxwriter.readthedocs.io/page_setup.html#repeat_columns>`__,
   `default_row <https://xlsxwriter.readthedocs.io/worksheet.html#set_default_row>`__
-  Paging:
   `h_pagebreaks <https://xlsxwriter.readthedocs.io/page_setup.html#set_h_pagebreaks>`__,
   `v_pagebreaks <https://xlsxwriter.readthedocs.io/page_setup.html#set_v_pagebreaks>`__,
   `outline_settings <https://xlsxwriter.readthedocs.io/worksheet.html#outline_settings>`__
-  Panes:
   `split_panes <https://xlsxwriter.readthedocs.io/worksheet.html#split_panes>`__,
   `freeze_panes <https://xlsxwriter.readthedocs.io/worksheet.html#freeze_panes>`__
-  Filters: `filter_column_lists <https://xlsxwriter.readthedocs.io/worksheet.html#filter_column_list>`__ each with ``col`` and ``filters``, `filter_columns <https://xlsxwriter.readthedocs.io/worksheet.html#filter_column>`__ each with ``col`` and ``criteria``, `autofilter <https://xlsxwriter.readthedocs.io/worksheet.html#worksheet-autofilter>`__ with range directly or ``first_row``, ``first_col``, ``last_row``, ``last_col`` attributes (see `docs <https://xlsxwriter.readthedocs.io/working_with_autofilters.html>`__)
-  Merge ranges: `merge_ranges <https://xlsxwriter.readthedocs.io/worksheet.html#merge_range>`__ list can be used to merge cells (``range`` or combination of ``first_row``, ``first_col``, ``last_row``, ``last_col`` attributes) together and apply a format (via ``format`` reference attribute), also contents can be set via ``data`` attribute
-  Data validations: `data_validations <https://xlsxwriter.readthedocs.io/worksheet.html#data_validation>`__ list can be used to validate data in cell ranges (see `docs <https://xlsxwriter.readthedocs.io/working_with_data_validation.html>`__)
-  Conditional formats: `conditional_formats <https://xlsxwriter.readthedocs.io/worksheet.html#worksheet-conditional-format>`__ list can be used to define conditional formats on cell ranges (see `docs <https://xlsxwriter.readthedocs.io/example_conditional_format.html#ex-cond-format>`__)
-  Tables: `tables <https://xlsxwriter.readthedocs.io/worksheet.html#add_table>`__ list can be used to define formatted tables (see `docs <https://xlsxwriter.readthedocs.io/working_with_tables.html>`__)
-  Sparklines: `sparklines <https://xlsxwriter.readthedocs.io/worksheet.html#add_sparkline>`__ list (see `docs <https://xlsxwriter.readthedocs.io/working_with_sparklines.html>`__)
-  Row/col sizing: `columns <https://xlsxwriter.readthedocs.io/worksheet.html?highlight=column_pixels#set_column>`__, `column_pixels <https://xlsxwriter.readthedocs.io/worksheet.html#set_column_pixels>`__, `rows <https://xlsxwriter.readthedocs.io/worksheet.html?highlight=column_pixels#set_row>`__, and `row_pixels <https://xlsxwriter.readthedocs.io/worksheet.html#set_row_pixels>`__ lists can be used to adjust cell sizing (unfortunately automatic sizing is not possible)
-  Background: `background <https://xlsxwriter.readthedocs.io/worksheet.html#set_background>`__ can be used to set worksheet background via ``filename`` or ``b64bytes`` attributes

Inserting data
^^^^^^^^^^^^^^

In JSON as part of worksheet's attribute ``data``, you can in the list specify data to be inserted to cells in four ways (``type``):

-  ``cell`` `writes cell <https://xlsxwriter.readthedocs.io/worksheet.html#worksheet-write>`__ according to the possibly specified\ ``subtype`` (see below)
-  ``row`` `writes row <https://xlsxwriter.readthedocs.io/worksheet.html#worksheet-write-row>`__ using provided data as a list
-  ``column`` `writes column <https://xlsxwriter.readthedocs.io/worksheet.html#worksheet-write-column>`__ using provided data as a list
-  ``grid`` `writes rows <https://xlsxwriter.readthedocs.io/worksheet.html#worksheet-write-row>`__ using provided data as a list of lists (list of rows)

For data, there are the following subtypes possible (for ``type`` set to ``cell``):

-  (unspecified) tries to directly all `write <https://xlsxwriter.readthedocs.io/worksheet.html#worksheet-write>`__ with provided arguments, type should be then decided based on provided values and attributes
-  ``string`` `writes string <https://xlsxwriter.readthedocs.io/worksheet.html#worksheet-write-string>`__ from ``value``
-  ``number`` `writes number <https://xlsxwriter.readthedocs.io/worksheet.html#worksheet-write-number>`__ from numeric ``value``
-  ``datetime`` `writes datetime <https://xlsxwriter.readthedocs.io/worksheet.html#worksheet-write-datetime>`__; it tries to parse date/datetime ``value`` from string as JSON does not have a format for datetime, standard ISO formats are recommended (e.g. ``2022-12-24`` or ``2022-12-24T12:00:00Z``)
-  ``formula`` `writes formula <https://xlsxwriter.readthedocs.io/worksheet.html#worksheet-write-formula>`__ with formula in ``value`` and optional ``result`` value
-  ``blank`` `writes blank value <https://xlsxwriter.readthedocs.io/worksheet.html#worksheet-write-blank>`__ (no attributes except ``format``)
-  ``boolean`` `writes boolean value <https://xlsxwriter.readthedocs.io/worksheet.html#worksheet-write-boolean>`__ with boolean ``value`` (i.e. ``true`` or ``false``)
-  ``url`` `writes URL value <https://xlsxwriter.readthedocs.io/worksheet.html#worksheet-write-url>`__ with ``url``, ``value``, and ``tip`` attributes
-  ``rich_string`` `writes rich string <https://xlsxwriter.readthedocs.io/worksheet.html#worksheet-write-rich-string>`__ that allows formatting; for using format in the ``string_parts`` use prefix ``!fmt::`` before name of the desired format

All options above may specify ``format`` (refer to defined format via its ``name``).

.. code:: json

   {
     "type": "cell",
     "subtype": "string",
     "cell": "A1",
     "value": "X"
   }

.. code:: json

   {
     "type": "column",
     "subtype": "string",
     "cell": "A3",
     "data": [
       "ID",
       "Name",
       "Created at",
       "Author"
     ],
     "format": "myBoldFormat"
   }

.. code:: json

   {
     "type": "grid",
     "row": 5,
     "col": 5,
     "data": [
       ["A", "B", "C"],
       ["D", "E", "F"]
     ]
   }

Inserting other elements
^^^^^^^^^^^^^^^^^^^^^^^^

Aside from data in cell, there is also possibility to insert other elements to the worksheet (``type`` vales):

-  ``button`` with `options <https://xlsxwriter.readthedocs.io/worksheet.html#insert_button>`__ such as ``macro`` or ``caption``
-  ``textbox`` with ``text`` and `options <https://xlsxwriter.readthedocs.io/worksheet.html#insert_textbox>`__ such as styling or offset in pixels
-  ``comment`` with ``comment`` text and `options <https://xlsxwriter.readthedocs.io/worksheet.html#write_comment>`__ such as ``color`` or ``author``
-  ``chart`` with ``chart`` (name) and `options <https://xlsxwriter.readthedocs.io/worksheet.html#insert_chart>`__
-  ``image`` with ``filename``, ``b64bytes``, and `options <https://xlsxwriter.readthedocs.io/worksheet.html#insert_image>`__

All of these are used with corresponding ``type`` and are placed to desired ``cell`` (or ``col``/``row`` indices).

.. code:: json

   {
     "type": "button",
     "cell": "B5",
     "options": {
       "caption": "Press Me"
     }
   }

Header, Footer, Images
^^^^^^^^^^^^^^^^^^^^^^

To allow easily add figures, those can be supplied as BASE64 encoded data directly via JSON as shown in the examples below.

For header and footer, the syntax of ``content`` is according to the
`documentation <https://xlsxwriter.readthedocs.io/page_setup.html#set_header>`__.

.. code:: json

   {
     "header": {
       "content": "&L&G &CExample Excel Document",
       "options": {
         "image_left": "logo.png",
         "image_data_left": "data:image/png;base64,iVBORw0KGgoAA..."
       }
     }
   }

.. code:: json

   {
     "name": "bg-test",
     "options": {
       "background": { "b64bytes": "data:image/png;base64,iVBORw0KGgoAA..." }
     }
   }

.. code:: json

   {
     "type": "image",
     "cell": "D2",
     "filename": "logo.png",
     "b64bytes": "data:image/png;base64,iVBORw0KGgoAA...",
     "options": {
       "x_scale": 0.6,
       "y_scale": 0.6,
       "url": "https://ds-wizard.org"
     }
   }

``vba_projects``
----------------

List of VBA projects (with macros) to be embedded in the spreadsheet.

.. code:: json

   {
     "vba_projects": [
       {
         "project": "./vbaProject.bin",
         "is_stream": false
       }
     ]
   }

Output
======

Desired Excel spreadsheet based on instructions from input JSON, it can be one the following formats (whether it uses macros or not):

-  ``application/vnd.openxmlformats-officedocument.spreadsheetml.sheet`` (extension ``.xlsx``)
-  ``application/vnd.ms-excel.sheet.macroEnabled.12`` (extension ``.xlsm``)

Options
=======

*No options, everything comes from the input JSON file*

Notes
=====

-  `XlxsWriter <https://xlsxwriter.readthedocs.io/>`__ library is used to construct Excel spreadsheet.
-  Most likely this step will follow ``jinja`` step that constructs the JSON file.

Example
=======

.. code:: json

   {
     "name": "excel",
     "options": {}
   }

.. |badge-status| image:: https://img.shields.io/badge/status-stable-green
.. |badge-metamodel| image:: https://img.shields.io/badge/metamodel%20version-%E2%89%A5%2011-blue

