---
name: stripe
description: Read payments, customers, billing, and Connect data from Stripe — charges, payment intents, refunds, disputes, payouts, invoices, subscriptions, products, prices, coupons, Checkout Sessions, and events. Use for inspecting and reporting on Stripe account activity.
---

# Stripe

Read the Stripe account: payments and money movement, customers, billing and
subscriptions, the product catalog, Checkout, and Connect.

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

## Operations

The scripts above cover the three most common lookups. The full read surface is
available as operations, covering every core payments, billing, catalog and
Connect object reachable through the read tools of Stripe's official
[MCP server](https://docs.stripe.com/mcp).

Every list operation paginates with `limit` (1–100, default 10) plus the
`starting_after` / `ending_before` object-ID cursors, and accepts `expand` to
inline related objects.

### Balance and money movement

- `retrieve balance`
- `list balance transactions` — filter by `type`, `currency`, `source`, `payout`, `created`
- `get balance transaction`
- `list payouts` — filter by `status`, `destination`, `created`, `arrival_date`
- `get payout`
- `list transfers` — filter by `destination`, `transfer_group`, `created`
- `get transfer`
- `list application fees` — filter by `charge`, `created`
- `get application fee`

### Payments

- `list charges` — filter by `customer`, `payment_intent`, `transfer_group`, `created`
- `get charge`
- `list payment intents` — filter by `customer`, `customer_account`, `created`
- `get payment intent`
- `list setup intents` — filter by `customer`, `payment_method`, `attach_to_self`, `created`
- `get setup intent`
- `list refunds` — filter by `charge`, `payment_intent`, `created`
- `get refund`
- `list disputes` — filter by `charge`, `payment_intent`, `created`
- `get dispute`
- `list payment methods` — filter by `type` (55-value enum), `customer`, `allow_redisplay`
- `get payment method`

### Customers

- `list customers` — filter by `email`, `created`, `test_clock`
- `get customer`
- `list customer payment methods` — filter by `type`, `allow_redisplay`
- `list customer balance transactions` — filter by `invoice`, `created`

### Billing — invoices

- `list invoices` — filter by `status` (`draft`/`open`/`paid`/`uncollectible`/`void`), `customer`, `subscription`, `collection_method`, `created`, `due_date`
- `get invoice`
- `list invoice line items`
- `list invoice items` — filter by `customer`, `invoice`, `pending`, `created`
- `get invoice item`

### Billing — subscriptions

- `list subscriptions` — filter by `status` (10-value enum incl. `all`), `customer`, `price`, `collection_method`, `created`, `current_period_start`, `current_period_end`
- `get subscription`
- `list subscription items`
- `get subscription item`
- `list subscription schedules` — filter by `customer`, `scheduled`, `released_at`, `canceled_at`, `completed_at`, `created`
- `get subscription schedule`
- `list credit notes` — filter by `customer`, `invoice`, `created`
- `get credit note`
- `list quotes` — filter by `status` (`accepted`/`canceled`/`draft`/`open`), `customer`, `test_clock`
- `get quote`

### Catalog

- `list products` — filter by `active`, `ids`, `shippable`, `url`, `created`
- `get product`
- `list prices` — filter by `active`, `currency`, `product`, `type` (`one_time`/`recurring`), `lookup_keys`, `created`
- `get price`
- `list plans` — filter by `active`, `product`, `created`
- `get plan`
- `list coupons` — filter by `created`
- `get coupon`
- `list promotion codes` — filter by `active`, `code`, `coupon`, `customer`, `created`
- `get promotion code`
- `list tax rates` — filter by `active`, `inclusive`, `created`
- `get tax rate`
- `list tax codes`
- `get tax code`

### Checkout and payment links

- `list checkout sessions` — filter by `status` (`complete`/`expired`/`open`), `customer`, `payment_intent`, `payment_link`, `subscription`, `created`
- `get checkout session`
- `list checkout session line items`
- `list payment links` — filter by `active`
- `get payment link`
- `list payment link line items`

### Account and Connect

- `get account` — the account the API key belongs to
- `list connected accounts` — filter by `created`
- `get connected account`

### Platform

- `list events` — filter by `type`, `types`, `delivery_success`, `created`
- `get event`
- `list files` — filter by `purpose` (21-value enum), `created`
- `get file`
- `list webhook endpoints`
- `get webhook endpoint`

All operations are read-only (`GET`). Stripe's write endpoints — create a
customer, create or finalize an invoice, refund a charge, cancel a subscription
— are not part of this surface.

Date filters (`created`, `due_date`, `arrival_date`, `current_period_start`,
`current_period_end`, `canceled_at`, `completed_at`, `released_at`) take a Unix
timestamp in seconds and match exactly. Stripe's bracketed range form —
`created[gte]`, `created[lte]` — is a deepObject and cannot be expressed as a
single operation parameter.

## Output Format

JSON. List endpoints return `{"object": "list", "data": [...], "has_more":
bool, "url": "..."}`; page forward by passing the last object's `id` as
`starting_after`. Retrieve endpoints return the object itself. Errors return
HTTP 4xx with `{"error": {"type", "code", "message"}}`.
