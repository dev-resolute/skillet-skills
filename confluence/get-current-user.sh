#!/bin/bash

# Fetch the current user details from Confluence

set -e

EXPAND="$1"

if [ -z "$CONFLUENCE_BASE_URL" ] || [ -z "$CONFLUENCE_EMAIL" ] || [ -z "$CONFLUENCE_API_TOKEN" ]; then
  echo "CONFLUENCE_BASE_URL, CONFLUENCE_EMAIL and CONFLUENCE_API_TOKEN must be set"
  exit 1
fi

URL="${CONFLUENCE_BASE_URL}/wiki/rest/api/user/current"

if [ -n "$EXPAND" ]; then
  URL="${URL}?expand=${EXPAND}"
fi

curl -s -u "$CONFLUENCE_EMAIL:$CONFLUENCE_API_TOKEN" "$URL"
