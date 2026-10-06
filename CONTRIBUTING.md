# Contributing to multi-cloud-rag-free

## Workflow (PR-flow discipline)

1. Work on a topic branch off `main`. **Never push directly to `main`.**
2. Open a **draft** PR against `main`.
3. CI/tests must be green (or manually verified — state this in the PR).
4. The repository owner reviews and merges. **Only the owner merges.**

## Changelog & versioning

- Every PR adds an entry under `## [Unreleased]` in `CHANGELOG.md`.
- Patch = fix, minor = feature, major = breaking change (semver).
- Merge commits reference the PR number (e.g. `Merge pull request #12`).
- Releases are tagged `vX.Y.Z` after merge.

## What to check before opening the PR

- README quickstart commands are accurate against the repo contents.
- No secrets, credentials, or provider key material committed.
- Keep PRs focused: one concern per PR.
