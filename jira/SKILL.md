---
name: jira
description: Provides access to Jira user details, fields, recent projects, and issue types. Use for managing and querying Jira project data.
---

# Jira

Access Jira resources including user details, fields, recent projects, and issue types.

## Setup

1. Create an account and generate an API token at [Atlassian](https://id.atlassian.com/manage/api-tokens)  
2. Add to your shell profile (`~/.profile` or `~/.zprofile` for zsh):

```bash
export JIRA_BASE_URL="https://your-site.atlassian.net"
export JIRA_EMAIL="your-email@example.com"
export JIRA_API_TOKEN="your-api-token-here"
```

## Get current user

```bash
{baseDir}/get-current-user.sh [expand]    # Optional expand information
```

## Get fields

```bash
{baseDir}/get-fields.sh
```

## Get recent projects

```bash
{baseDir}/get-recent-projects.sh [expand] [properties]  # Optional expansion and properties
```

## Get all issue types for user

```bash
{baseDir}/get-all-issue-types.sh
```

## Operations

The scripts above cover four common lookups. The full read surface — every
read tool of Atlassian's official
[Remote MCP Server](https://support.atlassian.com/atlassian-rovo-mcp-server/docs/supported-tools/)
that maps to a REST `GET`, plus the core read surface those tools imply — is
available as operations, alongside the one write operation this skill has
always shipped.

Every operation takes `base_url` (your site host, e.g. `yourteam.atlassian.net`)
as a parameter.

### Issues

- `search issues` — JQL in `jql`, paged with `nextPageToken`/`maxResults`, projected with `fields`, `expand`, `properties`
- `get issue`
- `list issue comments`
- `get issue comment`
- `list issue changelog`
- `list issue transitions`
- `list issue worklogs`
- `list issue watchers`
- `get issue votes`
- `get issue edit metadata`
- `list issue remote links`
- `find issues by text`
- `get issue link`
- `list issue link types`
- `get attachment metadata`
- `list project issue types metadata`
- `list issue type field metadata`
- `create issue` — the only write operation

### Projects

- `list projects` — filter by `query`, `keys`, `typeKey`, `categoryId`, `status`, `action`, `orderBy`, `startAt`, `maxResults`
- `get project`
- `list recent projects`
- `list project components`
- `list project versions`
- `list project statuses`
- `list project roles`

### Configuration

- `list issue types`
- `get issue type`
- `list fields`
- `list statuses`
- `get status`
- `list priorities`
- `list resolutions`
- `list labels`
- `get jql reference data`

### People

- `get current user`
- `get user`
- `search users`
- `find assignable users`
- `list users`
- `list group members`
- `find groups`

### Saved views

- `search filters`
- `get filter`
- `list my filters`
- `list dashboards`
- `get dashboard`

### Instance

- `get my permissions`
- `get instance info`

Every operation except `create issue` is read-only (`GET`). `search issues`
uses Jira's enhanced JQL search (`/rest/api/3/search/jql`); the older
`/rest/api/3/search` endpoint, with its `startAt` paging, is being removed by
Atlassian and is deliberately not exposed.

## Output Format

JSON responses with relevant Jira information according to the endpoint, such as user details, field metadata, recent project details, or issue type data.
