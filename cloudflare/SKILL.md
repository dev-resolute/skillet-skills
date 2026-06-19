---
name: cloudflare
description: Cloudflare API integration for zone and account management. Use for retrieving information about zones and accounts.
---

# Cloudflare

Cloudflare API integration for managing and retrieving zones and account information.

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

## Output Format

JSON response containing relevant data depending on the operation, along with pagination info and query details.