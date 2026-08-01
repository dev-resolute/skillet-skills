#!/usr/bin/env bash
# Docs-only reference call — RuneSpace executes the manifest, not this script.
# Requires: SENTRY_API_TOKEN
curl -s \
  -H "Authorization: Bearer ${SENTRY_API_TOKEN}" \
  https://sentry.io/api/0/organizations/
