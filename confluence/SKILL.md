---
name: confluence
description: Access Confluence API for user, group, and template information. Use for querying user, group, and template data in Confluence.
---

# Confluence

Interact with Confluence to retrieve information about users, groups, and templates.

## Setup

1. Create an account and generate an API token at [Atlassian](https://id.atlassian.com/manage/api-tokens)
2. Add to your shell profile (`~/.profile` or `~/.zprofile` for zsh):

```bash
export CONFLUENCE_BASE_URL="https://your-site.atlassian.net"
export CONFLUENCE_EMAIL="your-email@example.com"
export CONFLUENCE_API_TOKEN="your-api-token-here"
```

## Get current user

```bash
{baseDir}/get-current-user.sh [operations,personalSpace,isExternalCollaborator]
```
### Options
- Optional query param: `expand` (e.g., operations, personalSpace)

## Get groups

```bash
{baseDir}/get-groups.sh [start] [limit] [accessType]
```
### Options
- `start`: The starting index of the groups.
- `limit`: Maximum number of groups per page.
- `accessType`: Group permission level (e.g., user, admin).

## Get content templates

```bash
{baseDir}/get-content-templates.sh [spaceKey] [start] [limit]
```
### Options
- `spaceKey`: Space key to query for templates.
- Pagination supported with `start` and `limit`.

## Get blueprint templates

```bash
{baseDir}/get-blueprint-templates.sh [spaceKey] [start] [limit]
```
### Options
- `spaceKey`: Space key to query for templates.
- Pagination supported with `start` and `limit`.

## Operations

The scripts above cover four admin lookups. The full read surface — every read
tool of Atlassian's official
[Remote MCP Server](https://support.atlassian.com/atlassian-rovo-mcp-server/docs/supported-tools/)
that maps to a REST `GET`, plus the core read surface those tools imply — is
available as operations, alongside the one write operation this skill has
always shipped.

Every operation takes `base_url` (your site host, e.g. `yourteam.atlassian.net`)
as a parameter. Reads use the Confluence Cloud v2 API; `search content` uses
the v1 CQL endpoint, which v2 has no replacement for.

### Pages

- `list pages` — filter by `space-id`, `status`, `title`, `subtype`, `sort`, `cursor`, `limit`
- `get page` — `body-format`, `version`, and `include-*` flags for labels, properties, versions, likes, operations, collaborators, direct children
- `list page ancestors`
- `list page descendants`
- `list page children`
- `list page versions`
- `list page labels`
- `list page attachments`
- `list page footer comments`
- `list page inline comments`

### Spaces

- `list spaces` — filter by `ids`, `keys`, `type`, `status`, `labels`, `favorited-by`, `sort`, `cursor`, `limit`
- `get space`
- `list pages in space`
- `list blog posts in space`
- `list space labels`

### Blog posts

- `list blog posts`
- `get blog post`
- `list blog post footer comments`
- `list blog post inline comments`
- `list blog post labels`

### Comments

- `list footer comments`
- `get footer comment`
- `list footer comment replies`
- `list inline comments`
- `get inline comment`
- `list inline comment replies`

### Attachments, labels, and tasks

- `list attachments`
- `get attachment`
- `list labels`
- `list pages for label`
- `list tasks` — filter by `space-id`, `page-id`, `status`, `assigned-to`, `created-by`, and created/due/completed date ranges
- `get task`

### Search and authoring

- `search content` — CQL in `cql`, with `cqlcontext`, `expand`, `cursor`, `limit`
- `create page` — the only write operation

Every operation except `create page` is read-only (`GET`).

## Output Format

Each operation returns JSON data specific to the request, such as details about users, groups, or templates.