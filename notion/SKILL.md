---
name: Notion
description: Read pages, databases, blocks, and users from your Notion workspace.
---

# Notion

Read-side coverage of the Notion public API: users, pages and page
properties, databases, block trees (page content), and comments, plus
search and database query (POST; require writes to be enabled).

Auth: internal integration token as a Bearer header. Every call sends the Notion-Version header — pass 2022-06-28 (each operation's description states it).
