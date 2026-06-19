#!/bin/bash

# List Zones
auth_header="Authorization: Bearer ${CLOUDFLARE_API_TOKEN}"

curl -s -G \
  --url "https://api.cloudflare.com/client/v4/zones" \
  -H "$auth_header" \
  --data-urlencode "name=${1}" \
  --data-urlencode "status=${2}" \
  --data-urlencode "type=${3}" \
  --data-urlencode "account.id=${4}" \
  --data-urlencode "account.name=${5}" \
  --data-urlencode "page=${6:-1}" \
  --data-urlencode "per_page=${7:-20}"
