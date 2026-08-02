---
name: Discord
description: Read servers, channels, members, and messages visible to your bot.
---

# Discord

Read-side coverage of the Discord REST API (v10): the current bot user and
the guilds (servers) it's in; a guild (get, plus channels, members, roles,
emojis, and invites lists, each paired with a matching get op); a channel
(get, plus its messages list/get and pinned messages list); a guild's active
threads (list); any Discord user (get); the bot's own application (get);
guild webhooks (list, plus get — metadata only, no execute); guild scheduled
events (list/get); and the guild audit log (get).

Auth: bot token as a static `Authorization: Bot <token>` header.
