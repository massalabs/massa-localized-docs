# Configuration file for the Sphinx documentation builder.
#
# This file only contains a selection of the most common options. For a full
# list see the documentation:
# https://www.sphinx-doc.org/en/master/usage/configuration.html

# -- Path setup --------------------------------------------------------------

# If extensions (or modules to document with autodoc) are in another directory,
# add these directories to sys.path here. If the directory is relative to the
# documentation root, use os.path.abspath to make it absolute, like shown here.
#
# import os
# import sys
# sys.path.insert(0, os.path.abspath('.'))


# -- Project information -----------------------------------------------------

project = 'Massa Localized Docs'
copyright = '2022, Massa Labs'
author = 'Massa Labs'

# -- Internationalization Configurations -------------------------------------

# If true, a document’s text domain is its docname if it is a top-level project
# file and its very base directory otherwise.
# By default, the document markup/code.rst ends up in the markup text domain. 
# With this option set to False, it is markup/code.
gettext_compact = False

# If true, Sphinx generates uuid information for version tracking in message
# catalogs. It is used for:
# - Add uid line for each msgids in .pot files.
# - Calculate similarity between new msgids and previously saved old msgids.
#   This calculation takes a long time.
gettext_uuid = True

