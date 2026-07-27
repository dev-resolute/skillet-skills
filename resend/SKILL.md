---
name: resend
description: Send transactional email with Resend and read its entire API — sent and received emails with attachments, domains, API keys, webhooks, contacts, segments, topics, broadcasts, templates, automations, events, suppressions, and request logs.
---

# Resend

Send transactional email through Resend and read back everything the API
exposes: delivery records, domains, contacts, broadcasts, and request logs.

## Setup

1. Create an account at https://resend.com/.
2. Create an API key for your subscription.
3. Add to your shell profile (`~/.profile` or `~/.zprofile` for zsh):

```bash
export RESEND_API_TOKEN="your-api-key-here"
```

## List Domains

```bash
{baseDir}/list-domains.sh
```

## List API Keys

```bash
{baseDir}/list-api-keys.sh
```

## List Audiences

```bash
{baseDir}/list-audiences.sh
```

## Operations

The scripts above cover three common lookups. Resend has no read MCP server to
mirror — the official [resend/mcp-send-email](https://github.com/resend/mcp-send-email)
exposes only a send tool — so coverage is measured against the
[API reference](https://resend.com/docs/api-reference/introduction) instead and
is exhaustive: every documented `GET` endpoint is available as an operation,
alongside the one write operation this skill has always shipped.

List operations page with `limit` plus an `after` or `before` cursor.

### Email

- `send email` — the only write operation; `from`, `to`, `subject`, `html`
- `list emails`
- `get email`
- `list email attachments`
- `get email attachment`

### Received email

- `list received emails`
- `get received email`
- `list received email attachments`
- `get received email attachment`

### Domains, keys, and webhooks

- `list domains`
- `get domain`
- `get domain claim`
- `list api keys`
- `list webhooks`
- `get webhook`

### Contacts

- `list contacts` — filter by `segment_id`
- `get contact` — by ID or email address
- `list contact segments`
- `list contact topics`
- `list contact properties`
- `get contact property`

### Segments, audiences, and topics

- `list segments`
- `get segment`
- `list segment contacts`
- `list audiences`
- `get audience`
- `list topics`
- `get topic`

### Broadcasts and templates

- `list broadcasts`
- `get broadcast`
- `list templates`
- `get template`

### Automations and events

- `list automations` — filter by `status` (`enabled` / `disabled`)
- `get automation`
- `list automation runs` — filter by `status`
- `get automation run`
- `list events`
- `get event`

### Suppressions and logs

- `list suppressions`
- `get suppression` — by ID or suppressed email address
- `list logs`
- `get log`

Every operation except `send email` is read-only (`GET`). Resend is migrating
Audiences to Segments; both lookups are exposed so existing scripts keep
working. The OAuth endpoints are not exposed — they belong to the authorization
code flow, not the API-key authentication this skill uses.

## Output Format

JSON responses corresponding to each endpoint's standard output.
