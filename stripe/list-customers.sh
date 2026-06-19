#!/bin/bash

# List Customers Script

set -e

if [ -z "$STRIPE_API_TOKEN" ]; then
  echo "Error: STRIPE_API_TOKEN is not set."
  exit 1
fi

curl -s -X GET "https://api.stripe.com/v1/customers" \
  -H "Authorization: Bearer $STRIPE_API_TOKEN" \
  -H "Content-Type: application/x-www-form-urlencoded"
