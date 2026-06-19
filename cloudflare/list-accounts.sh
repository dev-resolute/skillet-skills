#!/bin/bash

# List Accounts
auth_header="Authorization: Bearer ${CLOUDFLARE_API_TOKEN}"

curl -s -G \
  --url "https://api.cloudflare.com/client/v4/accounts" \
  -H "$auth_header" \
  --data-urlencode "name=${1}" \
  --data-urlencode "page=${2:-1}" \
  --data-urlencode "per_page=${3:-20}" \
  --data-urlencode "direction=${4}"
