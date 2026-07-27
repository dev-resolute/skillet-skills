---
name: cloudflare
description: Read Cloudflare zones, DNS records and analytics, Workers, KV/R2/D1/Hyperdrive/Queues, Pages, AI Gateway, audit and Logpush logs, rulesets, firewall and load balancers, and purge zone cache. Use for inspecting Cloudflare configuration and traffic.
---

# Cloudflare

Read the Cloudflare account: zones and their settings, DNS records and query
analytics, Workers and their routes, the storage and data products (KV, R2, D1,
Hyperdrive, Queues), Pages, AI Gateway, audit and Logpush logs, rulesets,
firewall rules and load balancers — plus a cache purge.

## Setup

1. Create an account or log in to [Cloudflare](https://dash.cloudflare.com/sign-up)
2. Obtain an API Token from your account's API Tokens section
3. Add to your shell profile (`~/.profile` or `~/.zprofile` for zsh):

```bash
export CLOUDFLARE_API_TOKEN="your-api-token-here"
```

## List Zones

```bash
{baseDir}/list-zones.sh [options]
```

### Options
- `name`: Filter by domain name
- `status`: Filter by zone status
- `type`: Filter by zone type (e.g., full, partial)
- `account.id`: Filter by account ID
- `account.name`: Filter by account name
- `page`: Page number for paginated results (default: 1)
- `per_page`: Results per page (default: 20, max: 50)

## List Accounts

```bash
{baseDir}/list-accounts.sh [options]
```

### Options
- `name`: Filter by account name
- `page`: Page number for paginated results (default: 1)
- `per_page`: Results per page (default: 20, max: 50)
- `direction`: Order direction (asc or desc)

## Operations

The two scripts above cover the most common lookups. The full surface is
available as operations: every read tool of Cloudflare's official
[product MCP servers](https://github.com/cloudflare/mcp-server-cloudflare) that
maps to a REST `GET`, plus the core zone, DNS and account reads that only
Cloudflare's [API MCP server](https://github.com/cloudflare/mcp) reaches.

Account-scoped operations take an `account_id`; zone-scoped operations take a
`zone_id`. Most list endpoints paginate with `page` / `per_page`; KV keys, R2
buckets and rulesets use a `cursor` instead.

### Identity and accounts

- `get current user`
- `verify api token` — confirm the token is valid and active
- `list accounts` — filter by `name`, `direction`
- `get account`
- `list account members` — filter by `status`, `order`
- `list account roles`
- `list account api tokens` — filter by `include_expired`

### Zones

- `list zones` — filter by `name`, `status` (`initializing`/`pending`/`active`/`moved`), `type`, `account.id`, `account.name`, `order`, `direction`, `match`, `page`, `per_page`
- `get zone`
- `list zone settings`
- `get zone setting`
- `list zone plans`

### DNS

- `list dns records` — filter by `type` (21-value enum), `name`, `content`, `comment`, `tag`, `proxied`, `search`, `match`, `order`, `direction`, `page`, `per_page`; `name`, `content`, `comment` and `tag` each also take `.exact`, `.contains`, `.startswith`, `.endswith` variants
- `get dns record`
- `get zone dns settings`
- `get account dns settings`
- `get dns analytics report` — `metrics`, `dimensions`, `since`, `until`, `filters`, `sort`, `limit`
- `get dns analytics report by time` — same, plus `time_delta`

### Workers

- `list workers` — filter by `tags`
- `download worker script` — returns raw JavaScript, not JSON; long scripts are truncated in chat
- `get worker settings`
- `list worker domains` — filter by `zone_id`, `zone_name`, `service`, `hostname`, `environment`
- `get workers subdomain`
- `list worker routes`
- `get worker route`

### Storage and data

- `list kv namespaces` — `order`, `direction`, `page`, `per_page`
- `get kv namespace`
- `list kv keys` — `prefix`, `limit`, `cursor`
- `list r2 buckets` — `name_contains`, `start_after`, `order`, `direction`, `per_page`, `cursor`
- `get r2 bucket`
- `list d1 databases` — filter by `name`
- `get d1 database` — `fields`
- `list hyperdrive configs`
- `get hyperdrive config`
- `list queues`
- `get queue`

### Pages

- `list pages projects`
- `get pages project`
- `list pages deployments` — filter by `env` (`preview`/`production`)
- `get pages deployment`

### AI Gateway

- `list ai gateways` — filter by `search`
- `list ai gateway logs` — filter by `search`, `start_date`/`end_date`, cost and token ranges, `order_by`, `filters`
- `get ai gateway log`
- `get ai gateway log request`
- `get ai gateway log response`

### Logs

- `list audit logs` — `since` and `before` are required; filters cover `actor_*`, `action_type`, `action_result`, `resource_*`, `raw_*`, `zone_*`, each with a `.not` negation, plus `direction`, `limit`, `cursor`
- `list account logpush jobs`
- `list zone logpush jobs`

### Security and traffic

- `list zone rulesets`
- `get zone ruleset`
- `list account rulesets`
- `list ip access rules` — filter by `mode`, `configuration.target`, `configuration.value`, `notes`, `match`
- `list page rules` — filter by `status`, `order`, `direction`, `match`
- `list certificate packs` — filter by `status`, `deploy`
- `list custom hostnames` — filter by `hostname` (plus `.exact`/`.startsWith`/`.contain`), `ssl_status`, `hostname_status`, `certificate_authority`, `wildcard`
- `get argo smart routing setting`

### Load balancing

- `list load balancers`
- `list load balancer pools` — filter by `monitor`
- `list load balancer monitors`

### Cache

- `purge cache` — the one write operation: purges a zone's entire cache.

## Output Format

JSON. Cloudflare wraps every response as `{"success": bool, "errors": [],
"messages": [], "result": …}`; paginated lists add `result_info` with `page`,
`per_page`, `count` and `total_count`. On failure `success` is `false` and
`errors` carries `{code, message}` entries. `download worker script` is the
exception — it returns the Worker's JavaScript source, not JSON.
