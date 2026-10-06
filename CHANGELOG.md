# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [Unreleased]

### Added
- CONTRIBUTING.md: PR-flow discipline (draft PR → verified → owner merges; no
  direct pushes to `main`; CHANGELOG entry per PR; semver; tagged releases).
- CHANGELOG.md (this file).
- NOTICE.md: project attribution.

### Notes
- No LICENSE file exists in this repo yet; the owner has not selected one.
  Tracked as an open flag, not added by this PR.
- No version file exists in the repo; no semver bump applied.
- `scripts/deploy-rancher.sh` is a local Helm/K8s provisioning script, not a
  Cloudflare Worker/Pages deploy — no signed-deploy rewire was possible.
