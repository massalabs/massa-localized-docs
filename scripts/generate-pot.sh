#!/bin/bash +x

# This script generates a POT file for all the Massa documentation.

MASSA_DOCS_REPO_URL="https://github.com/massalabs/massa-docs.git"
POT_DIR="pot"

debug () {
    if [ "$DEBUG" = "1" ]; then
        echo -e "\033[1;34m$1\033[0m"
    fi
}

success () { echo -e "\033[1;32m$1\033[0m"; }

fatal () { echo -e "\033[1;31m$1\033[0m"; exit 1; }

# Prepare the environment
debug "Installing dependencies"
python3 -m pip install --user -r requirements.txt || fatal "Failed to install requirements"

if [ ! -d massa-docs ]; then
    debug "Cloning massa-docs repository"
    # We need to clone the repository in a subdirectory to avoid submodules circular dependencies
    git clone $MASSA_DOCS_REPO_URL || fatal "Failed to clone massa-docs"
else 
    debug "Updating massa-docs repository"
    cd massa-docs
    git pull || fatal "Failed to pull massa-docs"
    cd ..
fi

# Move existing POT files to a backup directory and make a copy of the `.pot` files 
# in the `massa-docs` repository to keep track of the changes using uuids
if [ ! -d $POT_DIR ]; then
    debug "Creating $POT_DIR"
    mkdir -p ./$POT_DIR
else
    rm -fr ./massa-docs/_build/
    mkdir -p ./massa-docs/_build/gettext/
    cp -r ./$POT_DIR/ ./massa-docs/_build/gettext
fi

cd massa-docs

# Generate POT file
sphinx-build -c .. -b gettext . _build/gettext || fatal "Failed to generate POT file"

# Move POT file to the root of the repository
cp -fr ./_build/gettext/ ../$POT_DIR/

success "POT file generated."
