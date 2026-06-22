#!/bin/bash

# Fetch blueprint templates from Confluence

set -e

SPACE_KEY="$1"
START="$2"
LIMIT="$3"

if [ -z "$CONFLUENCE_BASE_URL" ] || [ -z "$CONFLUENCE_EMAIL" ] || [ -z "$CONFLUENCE_API_TOKEN" ]; then
  echo "CONFLUENCE_BASE_URL, CONFLUENCE_EMAIL and CONFLUENCE_API_TOKEN must be set"
  exit 1
fi

URL="${CONFLUENCE_BASE_URL}/wiki/rest/api/template/blueprint"

PARAMS=""

if [ -n "$SPACE_KEY" ]; then
  PARAMS="spaceKey=${SPACE_KEY}"
fi

if [ -n "$START" ]; then
  PARAMS="${PARAMS}&start=${START}"
fi

if [ -n "$LIMIT" ]; then
  PARAMS="${PARAMS}&limit=${LIMIT}"
fi

if [ -n "$PARAMS" ]; then
  URL="${URL}?${PARAMS}"
fi

curl -s -u "$CONFLUENCE_EMAIL:$CONFLUENCE_API_TOKEN" "$URL"
