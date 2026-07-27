---
name: github
description: Official GitHub API operations for repositories, issues, and pull requests. Use for interacting with GitHub repositories, issues, pull requests, and searching repositories.
---

# GitHub

Interact directly with GitHub repositories, issues, pull requests, and search using the GitHub REST API v3.

## Setup

1. Create a GitHub account at https://github.com/join
2. Generate a personal access token by following https://docs.github.com/en/github/authenticating-to-github/creating-a-personal-access-token
3. Add to your shell profile (`~/.profile` or `~/.zprofile`):

```bash
export GITHUB_API_TOKEN="your-github-token"
```

## Get repository details

```bash
{baseDir}/get-repository-details.sh owner repo
```

- `owner`: GitHub username or org
- `repo`: Repository name (no .git)

## List issues

```bash
{baseDir}/list-issues.sh owner repo [options]
```

Options (all optional, in key=value format):
  milestone=... state=... assignee=... type=... creator=... mentioned=... issue_field_values=... labels=... sort=... direction=... since=... per_page=... page=...

## List pull requests

```bash
{baseDir}/list-pull-requests.sh owner repo [options]
```

Options (all optional, in key=value format):
  state=... head=... base=... sort=... direction=... per_page=... page=...

## Search repositories

```bash
{baseDir}/search-repositories.sh "search query" [options]
```

- Search query required (see https://docs.github.com/rest/search/search#constructing-a-search-query)
Options (all optional, in key=value format):
  sort=... order=... per_page=... page=...

## Create issue

Generated from spec, not live-verified (mutating operation).

```bash
{baseDir}/create-issue.sh owner repo title [body] [assignees] [milestone] [labels]
```

- `title`: Issue title (required)
- `body`: Issue body/description
- `assignees`: Comma-separated list (usernames)
- `milestone`: Milestone number or string
- `labels`: Comma-separated labels

## Add issue comment

Generated from spec, not live-verified (mutating operation).

```bash
{baseDir}/add-issue-comment.sh owner repo issue_number "comment body"
```

- `owner`, `repo`: As above
- `issue_number`: Numeric issue number
- `comment body`: The comment text

## Operations

The scripts above cover the most common lookups. The full read surface — every
read tool of GitHub's official
[MCP server](https://github.com/github/github-mcp-server) that maps to a REST
`GET` — is available as operations, alongside the one write operation this
skill has always shipped.

### Repositories and code

- `list repositories` — filter by `visibility`, `affiliation`, `type`, `sort`, `direction`, `since`, `before`, `per_page`, `page`
- `list starred repositories`
- `get repository`
- `list branches`
- `list commits` — filter by `sha`, `path`, `author`, `committer`, `since`, `until`
- `get commit`
- `get file contents`
- `get repository tree`
- `get git reference`
- `get tag`
- `list tags`
- `list releases`
- `get latest release`
- `get release by tag`
- `list repository collaborators`

### Issues

- `list issues` — filter by `state`, `labels`, `assignee`, `creator`, `mentioned`, `milestone`, `type`, `since`, `sort`, `direction`, `per_page`, `page`
- `get issue`
- `list issue comments`
- `list sub-issues`
- `get parent issue`
- `list issue labels`
- `list labels`
- `get label`
- `list issue types`
- `create issue` — the only write operation

### Pull requests

- `list pull requests` — filter by `state`, `head`, `base`, `sort`, `direction`
- `get pull request`
- `list pull request files`
- `list pull request commits`
- `list pull request review comments`
- `list pull request reviews`
- `get commit status`
- `list check runs`

### Search

- `search issues` — GitHub issue/PR search syntax in `q`
- `search repositories`
- `search code`
- `search commits`
- `search users`

### Actions

- `list workflows`
- `get workflow`
- `list workflow runs` — filter by `actor`, `branch`, `event`, `status`, `created`, `head_sha`
- `list repository workflow runs`
- `get workflow run`
- `list workflow run jobs`
- `list workflow run artifacts`
- `get workflow run usage`
- `get workflow job`

### Security

- `list code scanning alerts`
- `get code scanning alert`
- `list secret scanning alerts`
- `get secret scanning alert`
- `list dependabot alerts`
- `get dependabot alert`
- `list code quality findings`
- `get code quality finding`
- `list global security advisories`
- `get global security advisory`
- `list org repository security advisories`
- `list repository security advisories`

### Account, notifications, and gists

- `get authenticated user`
- `list teams`
- `list team members`
- `list notifications`
- `get notification`
- `list gists`
- `get gist`

Every operation except `create issue` is read-only (`GET`). GitHub's
Discussions and Projects MCP tools have no REST equivalent — they are
GraphQL-only — so they are not part of this surface.

## Output Format

All scripts print JSON as returned by the GitHub API. For lists (issues, PRs, search), output will be an array or an object with array fields. For single-entity (details, create), output is the object for that entity.