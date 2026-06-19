---
name: resend
description: Interact with Resend API to manage domains, API keys, and audiences. Use for listing domains, API keys, and audiences.
---

# Resend

Interact with Resend API to manage domains, API keys, and audiences.

## Setup

1. Create an account at https://resend.com/.
2. Create an API key for your subscription.
3. Add to your shell profile (`~/.profile` or `~/.zprofile` for zsh):

```bash
export RESEND_API_TOKEN="your-api-key-here"
```

## List Domains

```bash
{baseDir}/list-domains.sh
```

## List API Keys

```bash
{baseDir}/list-api-keys.sh
```

## List Audiences

```bash
{baseDir}/list-audiences.sh
```

## Output Format

All operations return a JSON object with relevant details about domains, API keys, or audiences.