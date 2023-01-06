#!/bin/bash +x

# This script updates the PO files for translations in ./locales.

PO_DIR="locales"

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

find $PO_DIR -type d -name 'LC_MESSAGES' | sed "s/$PO_DIR\/\(.*\)\/LC_MESSAGES/\1/" | while read -r locale; do
    debug "Updating $locale"
    sphinx-intl update -p pot -l $locale || fatal "Failed to update $locale"
done || fatal "Failed to update PO files"

success "PO files updated."
