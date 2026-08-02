#!/usr/bin/env bash
# Docs-only reference call — RuneSpace executes the manifest, not this script.
# Requires: SENDGRID_API_KEY
curl -s \
  -H "Authorization: Bearer ${SENDGRID_API_KEY}" \
  https://api.sendgrid.com/v3/templates
