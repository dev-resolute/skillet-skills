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

## Output Format

JSON responses with relevant Jira information according to the endpoint, such as user details, field metadata, recent project details, or issue type data.
