#!/bin/bash

# Load environment variables
source ~/.profile

# Function to show usage
usage() {
  echo "Usage: {baseDir}/list-api-keys.sh"
}

# Check for required arguments
if [ -z "$RESEND_API_TOKEN" ]; then
  echo "Error: RESEND_API_TOKEN is not set."
  usage
  exit 1
fi

# Make API call to list API keys
curl -s -X GET https://api.resend.com/api-keys \
  -H "Authorization: Bearer $RESEND_API_TOKEN" \
  -H "User-Agent: my-app/1.0"