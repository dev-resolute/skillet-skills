---
name: Sentry
description: Inspect issues, events, releases, and projects across your Sentry organization.
---

# Sentry

Read-side coverage of the Sentry API: organizations (list/get), an
organization's projects, teams, and members; team detail and its members and
projects; project detail, teams, client keys (DSNs), and environments; issue
detail, an issue's events, and a single event by ID (including Sentry's
`latest`/`oldest`/`recommended` aliases); releases (list/get) plus release
files, commits, and deploys; per-project event-count stats; organization
tags; and the GET-only Discover "events in table format" query.

Auth: organization auth token as a Bearer header.
