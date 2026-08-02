---
name: Vercel
description: Inspect projects, deployments, domains, and env metadata on Vercel.
---

# Vercel

Read-side coverage of the Vercel REST API: the authenticated user; a team's
teams (list); projects (list/get) and a project's domains; deployments
(list/get) plus deployment events and deployment files; checks — both
project-scoped and deployment-scoped check runs (list/get); domains (list/get)
and a domain's DNS records; a project's environment variables (list —
names/metadata only, values are encrypted by design and never decrypted by
this skill); aliases (list/get); and log drains (list/get).

Most operations accept an optional `teamId` (or `slug`) to scope the request
to a team; omit it to act on the caller's personal account.

Auth: Vercel access token as a Bearer header.
