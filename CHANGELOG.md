# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

This is the Flawless Workflow fork of [snok/django-auth-adfs](https://github.com/snok/django-auth-adfs),
published as `flawless-django-auth-adfs`. Patch releases are fork changes; a minor or major
release marks a sync with a new upstream release. Upstream's own history lives in its
[release notes](https://github.com/snok/django-auth-adfs/releases).

## [Unreleased]

### Added

- `ENABLE_MULTIPLE_TENANTS` setting: use the `common` endpoints and skip issuer validation so one
  app registration can sign in users from any Entra ID tenant.
- Published to the Flawless Python registry with a CI test matrix (Python 3.12, Django 5.1 to 6.0)
  and a `workflow_dispatch` release pipeline.

### Changed

- Forked from upstream 1.16.0. Python 3.12 and Django 5.1 are the minimum supported versions.

[Unreleased]: https://github.com/Flawless-Workflow/django-auth-adfs/tree/main
