---
name: pagerduty
description: Access and manage PagerDuty resources like services, incidents, escalation policies, and teams. Use for managing incident response and team alerts.
---

# PagerDuty

Access and manage resources using the official PagerDuty API.

## Setup

1. Create an account or log in at [PagerDuty](https://www.pagerduty.com/)
2. Generate an API token [here](https://support.pagerduty.com/docs/api-access-keys)
3. Add to your shell profile (`~/.profile` or `~/.zprofile` for zsh):

```bash
export PAGERDUTY_API_KEY="your-api-key-here"
```

## List services

```bash
{baseDir}/list-services.sh    # Retrieve a list of services
```

## List incidents

```bash
{baseDir}/list-incidents.sh    # Retrieve a list of incidents
```

## List escalation policies

```bash
{baseDir}/list-escalation-policies.sh    # Retrieve a list of escalation policies
```

## List teams

```bash
{baseDir}/list-teams.sh    # Retrieve a list of teams
```

## Operations

The scripts above cover the four most common lookups. The full read surface —
every read tool of PagerDuty's official
[MCP server](https://github.com/PagerDuty/pagerduty-mcp-server) that maps to a
REST `GET`, plus incident log entries — is available as operations:

### Incidents

- `list incidents` — filter by `statuses[]`, `urgencies[]`, `service_ids[]`, `team_ids[]`, `user_ids[]`, `since`/`until`, `sort_by`, `limit`, `offset`
- `get incident`
- `list incident notes`
- `list incident log entries`
- `list alerts for incident`
- `get alert for incident`
- `get past incidents`
- `get related incidents`
- `get outlier incident`
- `list incident change events`

### Services

- `list services` — filter by `query`, `team_ids[]`, `name`
- `get service`
- `list service change events`
- `list business services`
- `get business service dependencies`
- `get technical service dependencies`

### Directory

- `list teams`
- `get team`
- `list team members`
- `list users`
- `get user`
- `get current user`

### On-call

- `list schedules`
- `get schedule`
- `list schedule users`
- `list oncalls`
- `list escalation policies`
- `get escalation policy`

### Activity

- `list log entries`
- `get log entry`
- `list change events`
- `get change event`

### Routing and automation

- `list alert grouping settings`
- `get alert grouping setting`
- `list event orchestrations`
- `get event orchestration`
- `get event orchestration router`
- `get event orchestration global`
- `get service event orchestration`
- `list incident workflows`
- `get incident workflow`
- `list priorities`
- `list webhook subscriptions`
- `get webhook subscription`
- `list extension schemas`
- `get extension schema`

### Status pages

- `list status pages`
- `list status page impacts`
- `list status page severities`
- `list status page statuses`
- `get status page post`
- `list status page post updates`

All operations are read-only (`GET`). PagerDuty's Analytics endpoints are
`POST` and are therefore not part of this surface.

## Output Format

Responses are JSON formatted, containing arrays like `services`, `incidents`,
`escalation_policies`, and `teams`, each object includes attributes such as
`id`, `name`, and `summary`. List endpoints paginate with `limit`/`offset` and
report `more` plus, when `total=true` is passed, `total`.
