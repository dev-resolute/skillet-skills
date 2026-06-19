# skillet-skills

Curated, verified pi skills for popular public APIs — the data source for the
[Skillet Gallery](https://skillet.resolute.dev).

Each top-level directory is one skill (one API surface): `SKILL.md`, one bash
script per operation, and `.skillet/gallery-entry.json` with pre-computed
metadata the gallery reads at build time.

Generated and verified offline with `@resolutedev/skillet` (`skillet curate --out .`).
