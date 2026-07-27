# Roadmap & Milestones — St Francis PPT-Generator

**Status:** Draft v0.1

## Phase 0 — Foundations (1–2 weeks)

- Finalize Product Brief and FRD.
- Choose CLI-first vs. web-first approach.
- Pick and build one base template (`.pptx`).
- Spike: parser (text/Markdown → Deck schema) + renderer (Deck schema → `.pptx` via `python-pptx`).

**Exit criteria:** a hardcoded sample input reliably produces a valid `.pptx`.

## Phase 1 — MVP (2–4 weeks)

- Parser handles real Markdown outlines (headings, bullets, images).
- Slide Mapper supports the 4 core slide types.
- CLI command: `pptgen generate --input file.md --out deck.pptx`.
- Basic error handling + validation.
- Unit tests for parser and renderer.

**Exit criteria:** FR-01 through FR-05 satisfied; 3 real users can self-serve generate a deck.

## Phase 2 — Usable Product (3–5 weeks)

- Minimal web UI (upload/paste input, pick template, preview, download).
- Second template added (proves template system is truly pluggable).
- Slide preview before export.

**Exit criteria:** non-technical user can generate a deck without touching a terminal.

## Phase 3 — Polish & Extend (ongoing)

- Regenerate single slide (FR-07).
- Image upload support.
- Template gallery / user-selectable themes.
- Consider: AI-assisted content suggestions (out of MVP scope, revisit later).

## Milestone Summary

| Milestone | Target | Depends on |
|---|---|---|
| M0 — Working spike | End of Phase 0 | — |
| M1 — MVP CLI | End of Phase 1 | M0 |
| M2 — Web MVP | End of Phase 2 | M1 |
| M3 — v1.0 | End of Phase 3 | M2 |
