#!/usr/bin/env bash
#
set -o pipefail # Fail a pipe if any sub-command fails.
set -o nounset  # Disallow the use of undefined variables.
set -o errexit  # Exit the script if any statement returns a non-true return value.

# Generate all the reference links
poetry run kacl-cli link generate --modify

# Fix kacl's issue with changelogs without releases
sed -i '/^\[Unreleased\]/ s|\(.*\)master|\1main|' CHANGELOG.md

# Bump the version in the changelog
poetry run kacl-cli release "$BUMPVER_NEW_VERSION" --modify
