#!/usr/bin/env bash
# Docs-only reference call — RuneSpace executes the manifest, not this script.
# Requires: NOTION_API_TOKEN
curl -s \
  -H "Authorization: Bearer ${NOTION_API_TOKEN}" \
  -H "Notion-Version: 2022-06-28" \
  https://api.notion.com/v1/users
