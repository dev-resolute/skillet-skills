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

## Output Format

Each operation returns JSON data specific to the request, such as details about users, groups, or templates.