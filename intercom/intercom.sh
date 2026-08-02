#!/usr/bin/env bash
# Docs-only reference call — RuneSpace executes the manifest, not this script.
# Requires: INTERCOM_ACCESS_TOKEN
curl -s \
  -H "Authorization: Bearer ${INTERCOM_ACCESS_TOKEN}" \
  -H "Intercom-Version: 2.16" \
  https://api.intercom.io/me
