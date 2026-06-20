#!/bin/bash

# Fetch the current user details from Jira

set -e

EXPAND="$1"

if [ -z "$JIRA_BASE_URL" ] || [ -z "$JIRA_EMAIL" ] || [ -z "$JIRA_API_TOKEN" ]; then
  echo "JIRA_BASE_URL, JIRA_EMAIL and JIRA_API_TOKEN must be set"
  exit 1
fi

URL="${JIRA_BASE_URL}/rest/api/3/myself"

if [ -n "$EXPAND" ]; then
  URL="${URL}?expand=${EXPAND}"
fi

curl -s -u "$JIRA_EMAIL:$JIRA_API_TOKEN" "$URL"
