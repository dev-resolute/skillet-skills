#!/usr/bin/env bash
# Docs-only reference call — RuneSpace executes the manifest, not this script.
# Requires: AIRTABLE_API_TOKEN
curl -s \
  -H "Authorization: Bearer ${AIRTABLE_API_TOKEN}" \
  https://api.airtable.com/v0/meta/bases
