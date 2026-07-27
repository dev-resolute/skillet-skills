---
name: grafana
description: Read a Grafana instance over its HTTP API — search dashboards, inspect datasources and folders, read alert rules and notification routing, query annotations, and look up teams, users, organizations, and access-control roles.
---

# Grafana

Read dashboards, datasources, folders, alerting, annotations, and directory data
from a Grafana instance over its HTTP API.

## Setup

1. In Grafana, create a service account and token (Administration → Service accounts).
2. Add to your shell profile (`~/.profile` or `~/.zprofile` for zsh):

```bash
export GRAFANA_URL="https://your-grafana-instance.example.com"
export GRAFANA_SERVICE_ACCOUNT_TOKEN="your-service-account-token-here"
```

## Get current organization

```bash
{baseDir}/get-current-organization.sh
```

## Get all data sources

```bash
{baseDir}/get-all-data-sources.sh
```

## Get all folders

```bash
{baseDir}/get-all-folders.sh [limit] [page] [parentUid] [permission]
```

- `limit`: Maximum number of folders to return (default 1000)
- `page`: Page index to start fetching folders (default 1)
- `parentUid`: UID of the parent folder (optional)
- `permission`: Type of folders to return (Edit/View; default View)

## Get all users within the current organization

```bash
{baseDir}/get-all-users-within-the-current-organization.sh [query] [limit]
```

- `query`: Filter users by search query (optional)
- `limit`: Limit the maximum number of users returned (optional)

## Operations

The scripts above cover four common lookups. The full read surface — every read
tool of Grafana's official [MCP server](https://github.com/grafana/mcp-grafana)
that maps to a `GET` on the core Grafana HTTP API, plus the read core those
tools imply — is available as operations.

Every operation takes `base_url` (your Grafana host, e.g. `yourorg.grafana.net`)
as a parameter.

### Search and dashboards

- `search dashboards` — filter by `query`, `tag`, `type`, `dashboardUIDs`, `folderUIDs`, `starred`, `deleted`, `permission`, `sort`, `limit`, `page`
- `list search sort options`
- `get dashboard`
- `list dashboard tags`
- `get home dashboard`
- `list dashboard versions`
- `get dashboard version`
- `list dashboard permissions`

### Folders

- `list folders` — filter by `limit`, `page`, `parentUid`, `permission`
- `get folder`
- `get folder descendant counts`
- `list folder permissions`

### Datasources

- `list datasources`
- `get datasource` — by UID
- `get datasource by name`

### Alerting

- `list alert rules`
- `get alert rule`
- `get alert rule group`
- `list contact points`
- `get notification policy tree`
- `list mute timings`
- `get mute timing`
- `list notification templates`
- `get notification template`

### Annotations

- `list annotations` — filter by `from`/`to` (epoch milliseconds), `tags`, `matchAny`, `type`, `dashboardUID`, `panelId`, `alertUID`, `userUID`, `limit`
- `get annotation`
- `list annotation tags`

### Snapshots

- `list dashboard snapshots`
- `get dashboard snapshot`

### Teams

- `list teams` — filter by `query`, `name`, `sort`, `page`, `perpage`
- `get team`
- `list team members`
- `get team preferences`

### Organization and signed-in user

- `get current org`
- `get org preferences`
- `list org users`
- `lookup org users`
- `get current user`
- `list my orgs`
- `list my teams`
- `get my preferences`

### Access control

- `list roles`
- `get role`
- `get role assignments`
- `list user roles`
- `list team roles`
- `list resource permissions`
- `get resource description`

Every operation is read-only (`GET`). The MCP server's datasource query tools
(Prometheus, Loki, ClickHouse, CloudWatch and the rest) are not exposed here:
they `POST` datasource-specific query payloads rather than read a `GET`
endpoint. Neither are the Grafana Incident, OnCall, and Sift tools, which live
behind their own plugin APIs.

## Output Format

JSON responses corresponding to each endpoint's standard output.
