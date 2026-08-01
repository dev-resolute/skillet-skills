#!/usr/bin/env bash
# Docs-only reference call — RuneSpace executes the manifest, not this script.
# Requires: HUBSPOT_ACCESS_TOKEN
curl -s \
  -H "Authorization: Bearer ${HUBSPOT_ACCESS_TOKEN}" \
  https://api.hubapi.com/crm/v3/objects/contacts
