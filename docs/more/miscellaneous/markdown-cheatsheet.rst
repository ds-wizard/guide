.. _markdown-cheatsheet:

Markdown Cheatsheet
*******************

Various text fields in |project_name| can be formatted by using Markdown formatting language. Here you can get a basic overview of what can be achieved with Markdown.

Basic Syntax
============

These are the basic Markdown elements supported by all applications.


.. raw:: html

    <div class="table-wrapper docutils container">
        <table class="docutils align-default markdown-table">
            <thead>
                <tr>
                    <th>Formatting</th>
                    <th>Markdown Syntax</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>
                        <h1>Heading 1</h1>
                    </td>
                    <td class="td-markdown-code">
                        # Heading 1
                    </td>
                </tr>
                <tr>
                    <td>
                        <h2>Heading 2</h2>
                    </td>
                    <td class="td-markdown-code">
                        ## Heading 2
                    </td>
                </tr>
                <tr>
                    <td>
                        <h3>Heading 3</h3>
                    </td>
                    <td class="td-markdown-code">
                        ### Heading 3
                    </td>
                </tr>
                <tr>
                    <td>
                        <h4>Heading 4</h4>
                    </td>
                    <td class="td-markdown-code">
                        #### Heading 4
                    </td>
                </tr>
                <tr>
                    <td>
                        <h5>Heading 5</h5>
                    </td>
                    <td class="td-markdown-code">
                        ##### Heading 5
                    </td>
                </tr>
                <tr>
                    <td>
                        <h6>Heading 6</h6>
                    </td>
                    <td class="td-markdown-code">
                        ###### Heading 6
                    </td>
                </tr>
                <tr>
                    <td>
                        <strong>Bold text</strong>
                    </td>
                    <td class="td-markdown-code">
                        **Bold text**
                    </td>
                </tr>
                <tr>
                    <td>
                        <em>Italic text</em>
                    </td>
                    <td class="td-markdown-code">
                        *Italic text*
                    </td>
                </tr>
                <tr>
                    <td>
                        <blockquote>Blockquote</blockquote>
                    </td>
                    <td class="td-markdown-code">
                        > Blockquote
                    </td>
                </tr>
                <tr>
                    <td>
                        <ol>
                            <li>First item</li>
                            <li>Second item</li>
                            <li>Third item</li>
                        </ol>
                    </td>
                    <td class="td-markdown-code">
                        1. First item<br>
                        2. Second item<br>
                        3. Third item
                    </td>
                </tr>
                <tr>
                    <td>
                        <ul>
                            <li>First item</li>
                            <li>Second item</li>
                            <li>Third item</li>
                        </ul>
                    </td>
                    <td class="td-markdown-code">
                        - First item<br>
                        - Second item<br>
                        - Third item
                    </td>
                </tr>
                <tr>
                    <td>
                        <code>Code</code>
                    </td>
                    <td class="td-markdown-code">
                        `Code`
                    </td>
                </tr>
                <tr>
                    <td>
                        <hr>
                    </td>
                    <td class="td-markdown-code">
                        ---
                    </td>
                </tr>
                <tr>
                    <td>
                        <a href="https://ds-wizard.org" target="_blank">DS Wizard</a>
                    </td>
                    <td class="td-markdown-code">
                        [DS Wizard](https://ds-wizard.org)
                    </td>
                </tr>
                <tr>
                    <td>
                        <img src="https://ds-wizard.org/static/dsw-logo-horizontal-color-transparent.svg" style="height: 50px">
                    </td>
                    <td class="td-markdown-code">
                        ![](https://ds-wizard.org/static/dsw-logo-horizontal-color-transparent.svg)
                    </td>
                </tr>
            </tbody>
        </table>
    </div>



Extended Syntax
===============

These elements extending the basic syntax are supported in |project_name|.


.. raw:: html

    <div class="table-wrapper docutils container">
        <table class="docutils align-default markdown-table">
            <thead>
                <tr>
                    <th>Formatting</th>
                    <th>Markdown Syntax</th>
                </tr>
            </thead>
            <tbody>
                <tr>
                    <td>
                        <table><thead><tr><th>Name</th><th>Value</th></tr></thead><tbody><tr><td>Dataset 1</td><td>123</td></tr><tr><td>Dataset 2</td><td>211</td></tr></tbody></table>
                    </td>
                    <td class="td-markdown-code">
                        | Name | Value |<br>
                        | --- | --- |<br>
                        | Dataset 1 | 123 |<br>
                        | Dataset 2 | 211 |
                    </td>
                </tr>
                <tr>
                    <td>
                        <pre><code>Codeblock</code></pre>
                    </td>
                    <td class="td-markdown-code">
                        ```<br>
                        Codeblock<br>
                        ```
                    </td>
                </tr>
                <tr>
                    <td>
                        <del>Strikethrough</del>
                    </td>
                    <td class="td-markdown-code">
                        ~~Strikethrough~~
                    </td>
                </tr>
                <tr>
                    <td>
                        <ul><li><input disabled checked type="checkbox">Task 1</li><li><input disabled type="checkbox">Task 2</li></ul>
                    </td>
                    <td class="td-markdown-code">
                        - [x] Task 1<br>
                        - [ ] Task 2
                    </td>
                </tr>
            </tbody>
        </table>
    </div>
