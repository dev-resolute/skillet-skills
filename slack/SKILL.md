---
name: slack
description: Search and read Slack conversations, threads, messages, users, files, reactions, pins, emoji and user groups via the Slack Web API, and post messages. Use for finding and reading Slack content or automating workspace messaging.
---

# Slack

Interact with Slack: search messages and files, read channels and threads, look
up users and user groups, inspect files, reactions and pins, and send messages.

## Setup

1. Create a Slack app and generate an OAuth access token: https://api.slack.com/authentication/basics (see "OAuth Tokens & Redirect URLs").
2. Add to your shell profile (`~/.profile` or `~/.zprofile`):

```bash
export SLACK_API_TOKEN="your-slack-oauth-token"
```

## list conversations

```bash
{baseDir}/list-conversations.sh [--exclude-archived true|false] [--types public_channel,private_channel,mpim,im] [--limit N] [--cursor CURSOR]
```

List all Slack conversations (channels, groups, DMs).

- `--exclude-archived`: Optional, true/false
- `--types`: Comma-separated list from `public_channel,private_channel,mpim,im`
- `--limit`: Optional, max 1000
- `--cursor`: For pagination

## get conversation history

```bash
{baseDir}/get-conversation-history.sh "CHANNEL_ID" [--latest TS] [--oldest TS] [--inclusive true|false] [--limit N] [--cursor CURSOR]
```

Fetch messages/events for a conversation.

- `CHANNEL_ID`: Required Slack channel ID
- `--latest`, `--oldest`: Limit time range by message ts
- `--inclusive`: Include boundary timestamps
- `--limit`: Max results
- `--cursor`: For pagination

## list users

```bash
{baseDir}/list-users.sh [--limit N] [--cursor CURSOR] [--include-locale true|false]
```

List all users in the workspace.

- `--limit`: Optional
- `--cursor`: For pagination
- `--include-locale`: true/false

## get user info

```bash
{baseDir}/get-user-info.sh "USER_ID" [--include-locale true|false]
```

Get information for a specific user.

- `USER_ID`: Required Slack user ID
- `--include-locale`: Optional, true/false

## post message

Generated from spec, not live-verified (mutating operation).

```bash
{baseDir}/post-message.sh "CHANNEL" "TEXT" [options]
```

Send a message to a channel or DM. Required: `CHANNEL` and `TEXT`.

- Options (as `--option value`):
  - `--as-user true|false`, `--attachments JSON`, `--blocks JSON`, `--icon-emoji ":emoji:"`, `--icon-url URL`, `--link-names true|false`, `--mrkdwn true|false`, `--parse FORMAT`, `--reply-broadcast true|false`, `--thread-ts TS`, `--unfurl-links true|false`, `--unfurl-media true|false`, `--username NAME`

## add reaction

Generated from spec, not live-verified (mutating operation).

```bash
{baseDir}/add-reaction.sh "CHANNEL" "NAME" "TIMESTAMP"
```

Add a reaction (emoji) to a message in a channel.

- `CHANNEL`: Channel ID
- `NAME`: Emoji name (without colons)
- `TIMESTAMP`: Message timestamp

## Operations

The scripts above cover the most common calls. The full surface is available as
operations, covering every read tool of Slack's official
[MCP server](https://docs.slack.dev/ai/slack-mcp-server/) plus the workspace
directory reads it does not expose.

Cursor-paginated methods take `cursor` and `limit` and return
`response_metadata.next_cursor`; keep following it until it comes back empty
rather than judging by the number of results.

### Conversations

- `list conversations` — filter by `types` (`public_channel`/`private_channel`/`mpim`/`im`, comma-separated), `exclude_archived`, `team_id`
- `get conversation info` — `include_locale`, `include_num_members`
- `get conversation history` — `channel` required; window with `oldest`/`latest`/`inclusive`
- `list thread replies` — `channel` and `ts` required
- `list conversation members`
- `list user conversations` — the channels one user belongs to

### Users

- `list users` — always pass `limit`; omitting it asks for the whole directory
- `get user info`
- `lookup user by email`
- `get user profile` — custom fields and current status
- `get user presence`

### Search

- `search messages` — `query` required; `sort` (`score`/`timestamp`), `sort_dir`, `count`, `page` or `cursor`, `highlight`
- `search files` — same filters, minus `cursor`

Both search operations need a **user** token with `search:read`. Slack rejects a
bot token with `not_allowed_token_type`.

### Reactions, pins and files

- `get message reactions` — pass one target: `channel` + `timestamp`, or `file`, or `file_comment`
- `list user reactions`
- `list pinned items` — `channel` required
- `list files` — filter by `channel`, `user`, `ts_from`/`ts_to`, `types`; paginates with `count`/`page`, not a cursor
- `get file info` — file metadata, shares, and a page of comments

### Workspace

- `get team info`
- `get team profile fields` — `visibility` (`all`/`visible`/`hidden`)
- `list emoji`
- `list usergroups` — `include_count`, `include_disabled`, `include_users`
- `list usergroup users`
- `get message permalink` — `channel` and `message_ts` required
- `get dnd info`
- `get team dnd info` — `users` required, comma-separated

### Messaging

- `post message` — the one write operation.

All read operations are `GET https://slack.com/api/<method>` with query
parameters. `bookmarks.list` and `auth.test` are omitted because Slack
documents them as `POST`; `channels.list`/`groups.list`/`im.list`/`mpim.list`
stopped working in February 2021 and are replaced by `list conversations`; and
`reminders.list` is deprecated.

## Output Format

All scripts return the Slack API JSON response as-is. Common fields:
- On success: `ok: true`, result object(s), e.g., `channels`, `members`, `messages`.
- On error: `ok: false`, `error` field with cause.
