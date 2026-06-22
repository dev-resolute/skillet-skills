---
name: grafana
description: Interact with Grafana's API to manage organizational data and configuration. Use for accessing organization details, data sources, folders, and users.
---

# Grafana

Interact with Grafana's API to manage organizational data and configuration.

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
{baseDir}/get-all-users-within-current-organization.sh [query] [limit]
```

- `query`: Filter users by search query (optional)
- `limit`: Limit the maximum number of users returned (optional)

## Output Format

JSON responses corresponding to each endpoint's standard output.