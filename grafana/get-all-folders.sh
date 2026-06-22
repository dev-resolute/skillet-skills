#!/bin/bash

# Get all folders from Grafana

set -e

if [ -z "$GRAFANA_URL" ] || [ -z "$GRAFANA_SERVICE_ACCOUNT_TOKEN" ]; then
  echo "GRAFANA_URL and GRAFANA_SERVICE_ACCOUNT_TOKEN must be set"
  exit 1
fi

LIMIT="${1:-1000}"
PAGE="${2:-1}"
PARENT_UID="$3"
PERMISSION="${4:-View}"

QUERY_STRING="limit=${LIMIT}&page=${PAGE}&permission=${PERMISSION}"
if [ -n "$PARENT_UID" ]; then
  QUERY_STRING="${QUERY_STRING}&parentUid=${PARENT_UID}"
fi

curl -s -H "Authorization: Bearer ${GRAFANA_SERVICE_ACCOUNT_TOKEN}" \
  "${GRAFANA_URL}/api/folders?${QUERY_STRING}"
