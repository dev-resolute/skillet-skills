#!/bin/bash

# List incidents from PagerDuty

set -e

if [ -z "$PAGERDUTY_API_KEY" ]; then
  echo "PAGERDUTY_API_KEY must be set"
  exit 1
fi

curl -s \
  -H "Authorization: Token token=${PAGERDUTY_API_KEY}" \
  -H "Accept: application/vnd.pagerduty+json;version=2" \
  "https://api.pagerduty.com/incidents"
