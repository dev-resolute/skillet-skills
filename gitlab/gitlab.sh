#!/usr/bin/env bash
# Docs-only reference call — RuneSpace executes the manifest, not this script.
# Requires: GITLAB_PAT
curl -s \
  -H "PRIVATE-TOKEN: ${GITLAB_PAT}" \
  https://gitlab.com/api/v4/user
