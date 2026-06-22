#!/bin/bash

# Get all users within the current organization from Grafana

set -e

if [ -z "$GRAFANA_URL" ] || [ -z "$GRAFANA_SERVICE_ACCOUNT_TOKEN" ]; then
  echo "GRAFANA_URL and GRAFANA_SERVICE_ACCOUNT_TOKEN must be set"
  exit 1
fi

QUERY="$1"
LIMIT="$2"

QUERY_STRING=""
if [ -n "$QUERY" ]; then
  QUERY_STRING="query=${QUERY}"
fi
if [ -n "$LIMIT" ]; then
  QUERY_STRING="${QUERY_STRING}&limit=${LIMIT}"
fi

URL="${GRAFANA_URL}/api/org/users"
if [ -n "$QUERY_STRING" ]; then
  URL="${URL}?${QUERY_STRING}"
fi

curl -s -H "Authorization: Bearer ${GRAFANA_SERVICE_ACCOUNT_TOKEN}" "$URL"
