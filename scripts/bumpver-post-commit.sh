#!/usr/bin/env bash

set -o pipefail # Fail a pipe if any sub-command fails.
set -o nounset  # Disallow the use of undefined variables.
set -o errexit  # Exit the script if any statement returns a non-true return value.

echo "Running bumpver-post-commit hook"

echo "Squashing changelog and bumping version commits"
# Squash last 2 commits into one
# The first one being the changelog commit
# And the second one being the bumpver commit
git reset --soft HEAD~2
git commit -m "[Release] $BUMPVER_NEW_VERSION" --no-verify

echo "Tagging new version"
# Tag the new version
git tag -a "$BUMPVER_NEW_VERSION" -m "[Release] $BUMPVER_NEW_VERSION"

echo "Pushing new version and tag to remote"
# Push the new commit to remote
git push origin "$(git rev-parse --abbrev-ref HEAD)"
# Push the new tag to remote
git push origin "refs/tags/$BUMPVER_NEW_VERSION"

echo "Writing new version and release notes to files"
# Write the new version to the VERSION file
echo "$BUMPVER_NEW_VERSION" >VERSION
# Write the new release notes to the RELEASE_NOTES file
poetry run kacl-cli get "$BUMPVER_NEW_VERSION" >RELEASE_NOTES
