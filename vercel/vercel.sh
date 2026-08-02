#!/usr/bin/env bash
# Docs-only reference call — RuneSpace executes the manifest, not this script.
# Requires: VERCEL_API_TOKEN
curl -s \
  -H "Authorization: Bearer ${VERCEL_API_TOKEN}" \
  https://api.vercel.com/v2/user
