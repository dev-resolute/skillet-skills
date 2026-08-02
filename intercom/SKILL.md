---
name: Intercom
description: Read contacts, companies, conversations, and admins from Intercom.
---

# Intercom

Read-side coverage of the Intercom REST API: the current admin and app
identity; admins (list/get); contacts (list/get, plus a contact's attached
companies, segments, and tags); companies (list/get); conversations
(list/get); teams (list/get); segments (list/get); tags (list/get); data
attributes (list); a contact's notes (list); ticket types (list/get); and a
single ticket (get).

Every call requires an `Intercom-Version` header pinning the response shape
to a specific API version — shipped as a required parameter with the
vendored spec's version (2.16) as its example.

Auth: workspace app access token as a Bearer header.
