# DSW User Guide

[![License](https://img.shields.io/github/license/ds-wizard/guide)](LICENSE)
[![CII Best Practices](https://bestpractices.coreinfrastructure.org/projects/4975/badge)](https://bestpractices.coreinfrastructure.org/projects/4975)

## Usage

### Install Requirements

```
pip install -r docs/requirements.txt
```

Extra requirements only for development:

```
pip install -r docs/requirements.dev.txt
```

### Generate Guide

```
cd docs
make help
make html
```

### Develop Guide

```
make watch
```

Use [Python Developer’s Guide](https://devguide.python.org/documentation/markup/) as a reference for writing RST, specific rules are listed in the [CONTRIBUTING](CONTRIBUTING.md) file.

### Refresh Dependencies

```
rm -r env
python -m venv env
source env/bin/activate

pip install -r docs/requirements.direct.txt
pip freeze > docs/requirements.txt
```


### Regenerate Document Context Diagrams

The diagrams on the Document Context page are generated from `graph.py` in `dsw-models`, which is only parsed, not executed. Regenerate them when the document context metamodel changes. The script fails if a class is missing from its groups.

```
python3 maintenance/generate_document_context_diagrams.py ../engine-tools/packages/dsw-models/dsw/models/document_context/graph.py
```

Then render each `.mmd` file in `docs/more/development/document-templates/document-context/` to a light and a dark SVG for the HTML guide and a PDF for the LaTeX build, because ImageMagick cannot convert these SVGs. Use [mermaid-cli](https://github.com/mermaid-js/mermaid-cli), which needs a Chrome browser:

```
cd docs/more/development/document-templates/document-context
for g in context knowledge-model questions replies; do
  npx -y -p @mermaid-js/mermaid-cli@11.4.2 mmdc -i "$g.mmd" -o "$g-light.svg" -t default -b transparent -c ../../../../../maintenance/mermaid-config.json
  npx -y -p @mermaid-js/mermaid-cli@11.4.2 mmdc -i "$g.mmd" -o "$g-dark.svg" -t dark -b transparent -c ../../../../../maintenance/mermaid-config.json
  npx -y -p @mermaid-js/mermaid-cli@11.4.2 mmdc -i "$g.mmd" -o "$g-light.pdf" -t default -b white --pdfFit -c ../../../../../maintenance/mermaid-config.json
done
```

### Preparing the 5.0 Guide

Work on `develop`; retain the existing release-branch and Read the Docs version cycle. This update does not publish a release or change hosted settings.

Screenshots are temporarily replaced by visible native Sphinx TODOs. Their inventory is in `maintenance/screenshot-todos.json`. Once the DSW screenshot environment is ready, replace each TODO with a reviewed screenshot and descriptive alt text. Do not reuse FAIR Wizard screenshots for DSW.

For local checks:

```sh
sphinx-build -b html -n -W --keep-going docs docs/_build/html
sphinx-build -b latex -n -W --keep-going docs docs/_build/latex
```

The guide uses Furo, locally bundled Nunito headings and DSW orange branding. Body text uses system fonts; no additional theme extension is required.

## References

* [Sphinx Documentation](https://www.sphinx-doc.org/en/master/)
* [reStructuredText Markup Specification](https://docutils.sourceforge.io/docs/ref/rst/restructuredtext.html)
* [RST Cheatsheet](https://github.com/ralsina/rst-cheatsheet)
* [Git Basics](https://www.atlassian.com/git)
* [How to Write a Git Commit Message](https://cbea.ms/git-commit/)

## License

This project is licensed under the  Creative Commons Attribution-ShareAlike (CC BY-SA) - see the
[LICENSE](LICENSE) file for more details.

When changing toctree labels or navigation order, use `sphinx-build -E -a -b html docs docs/_build/html` to refresh the sidebar on every page.
