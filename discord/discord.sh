#!/usr/bin/env bash
# Docs-only reference call — RuneSpace executes the manifest, not this script.
# Requires: DISCORD_BOT_TOKEN
curl -s \
  -H "Authorization: Bot ${DISCORD_BOT_TOKEN}" \
  https://discord.com/api/v10/users/@me
