#!/bin/bash

# Get the current organization from Grafana

set -e

if [ -z "$GRAFANA_URL" ] || [ -z "$GRAFANA_SERVICE_ACCOUNT_TOKEN" ]; then
  echo "GRAFANA_URL and GRAFANA_SERVICE_ACCOUNT_TOKEN must be set"
  exit 1
fi

curl -s -H "Authorization: Bearer ${GRAFANA_SERVICE_ACCOUNT_TOKEN}" \
  "${GRAFANA_URL}/api/org"
