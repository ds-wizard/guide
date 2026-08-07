# Minimal makefile for Sphinx documentation
#

# You can set these variables from the command line.
SPHINXOPTS    =
SPHINXBUILD   = $(shell if [ -x .venv/bin/sphinx-build ]; then echo .venv/bin/sphinx-build; else echo sphinx-build; fi)
SPHINXAUTOBUILD = $(shell if [ -x .venv/bin/sphinx-autobuild ]; then echo .venv/bin/sphinx-autobuild; else echo sphinx-autobuild; fi)
SOURCEDIR     = .
BUILDDIR      = _build

# Put it first so that "make" without argument is like "make help".
help:
	@$(SPHINXBUILD) -M help "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)

.PHONY: help Makefile


.PHONY: watch
watch:
	$(SPHINXAUTOBUILD) "$(SOURCEDIR)" "$(BUILDDIR)/html"


# Catch-all target: route all unknown targets to Sphinx using the new
# "make mode" option.  $(O) is meant as a shortcut for $(SPHINXOPTS).
%: Makefile
	@rm -rf ./_build
	@$(SPHINXBUILD) -M $@ "$(SOURCEDIR)" "$(BUILDDIR)" $(SPHINXOPTS) $(O)
