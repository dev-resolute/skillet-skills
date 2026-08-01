#!/usr/bin/env bash
# Docs-only reference call — RuneSpace executes the manifest, not this script.
# Requires: ASANA_ACCESS_TOKEN
curl -s \
  -H "Authorization: Bearer ${ASANA_ACCESS_TOKEN}" \
  https://app.asana.com/api/1.0/users/me
