#!/bin/bash

# Fetch available fields from Jira

set -e

if [ -z "$JIRA_BASE_URL" ] || [ -z "$JIRA_EMAIL" ] || [ -z "$JIRA_API_TOKEN" ]; then
  echo "JIRA_BASE_URL, JIRA_EMAIL and JIRA_API_TOKEN must be set"
  exit 1
fi

curl -s -u "$JIRA_EMAIL:$JIRA_API_TOKEN" "${JIRA_BASE_URL}/rest/api/3/field"
