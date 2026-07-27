# Technical Design Document (TDD) — St Francis PPT-Generator

**Status:** Draft v0.1
**Related:** [Functional Requirements](02-functional-requirements.md)

## 1. Overview

Small, modern stack. Two deployment shapes are viable at this scale — pick one for MVP:

- **CLI/local tool**: script takes input file → outputs `.pptx`. Fastest to build, no hosting.
- **Web app**: simple frontend + API backend, generation happens server-side.

Recommendation for MVP: start CLI/library core, wrap with a minimal web UI once the core is proven.

## 2. Proposed Stack

| Layer | Choice | Why |
|---|---|---|
| Core generation | Python + `python-pptx` | Mature, well-documented library for `.pptx` creation |
| Parsing | Markdown parser (`markdown-it` / `mistune`) | Reuse existing outline → structure conversion instead of writing a custom parser |
| API (if web) | FastAPI (Python) | Lightweight, async, easy OpenAPI docs |
| Frontend (if web) | React + Vite, or plain HTML/Tailwind for MVP | Minimal footprint, fast to ship |
| Storage | Local filesystem (MVP) → S3-compatible bucket (v2) | No DB needed until multi-user/history features land |
| Templates | `.pptx` files used as base layouts, edited via `python-pptx` | Avoids building a layout engine from scratch |

## 3. High-Level Architecture

```
[User Input: text/outline]
        │
        ▼
  [Parser] ── converts input → intermediate slide schema (JSON)
        │
        ▼
 [Slide Mapper] ── maps schema sections to template layouts
        │
        ▼
 [Renderer (python-pptx)] ── builds .pptx from mapped content + template
        │
        ▼
  [Output: .pptx file] ──► [Preview / Download]
```

## 4. Component Responsibilities

- **Parser**: turns raw text/Markdown into a normalized `Deck` object (see [schema doc](05-api-data-schema.md)).
- **Slide Mapper**: decides layout per section (title vs. bullets vs. image+text) based on content shape and template capabilities.
- **Renderer**: uses `python-pptx` to write slides into a copy of the chosen template file.
- **API/CLI layer**: thin wrapper exposing `generate(input, template, options) -> file`.

## 5. Sequence — Generate Deck (Web variant)

```
User → Frontend: submit text + template choice
Frontend → API: POST /decks/generate
API → Parser: parse(input)
Parser → API: Deck schema
API → Renderer: render(Deck, template)
Renderer → API: file path / bytes
API → Frontend: 200 + download URL
Frontend → User: preview + download button
```

## 6. Key Design Decisions

- Keep parsing and rendering as separate, independently testable modules (see ADR-0001 as an example of documenting future decisions like this).
- Templates are just `.pptx` files with named placeholder layouts — no custom template format to invent.
- Start single-threaded/synchronous; only add a job queue if generation time or concurrent load requires it.

## 7. Error Handling

- Invalid input → 400-level error with a clear message, no partial file written.
- Rendering failure → log details, return a generic user-facing error, keep raw input for debugging.

## 8. Future Considerations (not MVP)

- Async job queue for large decks or batch generation.
- Multiple export formats (Google Slides via API, Keynote).
- Template marketplace / user-uploaded templates.
