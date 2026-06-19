---
name: stripe
description: Interact with the Stripe API to list customers, list charges, and retrieve balance information. Use for managing and viewing Stripe data.
---

## Setup

1. Sign in to your Stripe account and retrieve your API key from [Stripe Dashboard](https://dashboard.stripe.com/login?redirect=/apikeys).
2. Add to your shell profile (`~/.profile` or `~/.zprofile` for zsh):

```bash
export STRIPE_API_TOKEN="sk_live_or_test_your_api_token_here"
```

## List customers

```bash
{baseDir}/list-customers.sh
```

## List charges

```bash
{baseDir}/list-charges.sh
```

## Retrieve balance

```bash
{baseDir}/retrieve-balance.sh
```

### Options
- This operation accepts an optional `expand` parameter.

## Output Format

JSON formatted data in response to the API call, typically containing details of the requested information.
