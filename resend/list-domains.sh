#!/bin/bash

# Load environment variables
source ~/.profile

# Function to show usage
usage() {
  echo "Usage: {baseDir}/list-domains.sh"
}

# Check for required arguments
if [ -z "$RESEND_API_TOKEN" ]; then
  echo "Error: RESEND_API_TOKEN is not set."
  usage
  exit 1
fi

# Make API call to list domains
curl -s -X GET https://api.resend.com/domains \
  -H "Authorization: Bearer $RESEND_API_TOKEN" \
  -H "User-Agent: my-app/1.0"