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

## Output Format

Responses are JSON formatted, containing arrays like `services`, `incidents`, `escalation_policies`, and `teams`, each object includes attributes such as `id`, `name`, and `summary`.