#!/bin/bash

# Fetch groups from Confluence

set -e

START="$1"
LIMIT="$2"
ACCESS_TYPE="$3"

if [ -z "$CONFLUENCE_BASE_URL" ] || [ -z "$CONFLUENCE_EMAIL" ] || [ -z "$CONFLUENCE_API_TOKEN" ]; then
  echo "CONFLUENCE_BASE_URL, CONFLUENCE_EMAIL and CONFLUENCE_API_TOKEN must be set"
  exit 1
fi

URL="${CONFLUENCE_BASE_URL}/wiki/rest/api/group"

PARAMS=""

if [ -n "$START" ]; then
  PARAMS="start=${START}"
fi

if [ -n "$LIMIT" ]; then
  PARAMS="${PARAMS}&limit=${LIMIT}"
fi

if [ -n "$ACCESS_TYPE" ]; then
  PARAMS="${PARAMS}&accessType=${ACCESS_TYPE}"
fi

if [ -n "$PARAMS" ]; then
  URL="${URL}?${PARAMS}"
fi

curl -s -u "$CONFLUENCE_EMAIL:$CONFLUENCE_API_TOKEN" "$URL"
