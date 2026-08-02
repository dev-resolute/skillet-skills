---
name: SendGrid
description: Review email stats, suppressions, templates, and senders in SendGrid.
---

# SendGrid

Read-side coverage of the Twilio SendGrid v3 API: global email statistics
plus stats broken down by category, browser, and mailbox provider;
suppressions — unsubscribe groups, blocks, bounces, spam reports, and
invalid emails, each with a list and a get-by-id/email operation;
transactional template list/get; verified senders list; API key metadata
list; marketing contact lists plus total contact count; and a full read of
mail settings. Plus one write operation, `Send mail` (POST — runs only when
writes are allowed), for sending transactional email.

Auth: SendGrid API key as a Bearer header. A read-scoped key is enough for
every operation except `Send mail`, which needs Mail Send permission.
