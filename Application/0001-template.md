# ADR-0001: Use python-pptx for slide rendering

**Status:** Accepted
**Date:** 2026-07-27

## Context

We need to programmatically generate `.pptx` files from a structured slide schema. Options considered: build a raw OOXML writer, use a paid API service, or use an existing open-source library.

## Decision

Use `python-pptx` as the rendering engine. It directly manipulates `.pptx` files (which are OOXML/zip under the hood), supports templates, placeholders, and images, and has an active community.

## Consequences

- Positive: no need to hand-write OOXML; templates are just `.pptx` files we can design in PowerPoint itself.
- Positive: fast to prototype (Phase 0 spike achievable in days, not weeks).
- Negative: tied to Python for the rendering layer — if the rest of the stack moves to Node/Go later, rendering stays a Python service or subprocess.
- Negative: `python-pptx` has limited support for some advanced layouts (e.g., complex animations) — acceptable since animations are out of MVP scope.

## Alternatives Considered

| Option | Why not (for MVP) |
|---|---|
| Raw OOXML generation | Too much complexity/time for a small project |
| Third-party paid API (e.g., a slide-generation SaaS) | Adds cost + external dependency for a core feature |
| Google Slides API | Ties output format to Google's ecosystem, not `.pptx`-native |

---

## Template (copy this file for new decisions)

```markdown
# ADR-XXXX: <short decision title>

**Status:** Proposed | Accepted | Superseded by ADR-YYYY
**Date:** YYYY-MM-DD

## Context
<What's the problem/situation forcing this decision?>

## Decision
<What did we decide?>

## Consequences
<Positive and negative outcomes, tradeoffs accepted>

## Alternatives Considered
<What else was on the table and why it lost>
```
