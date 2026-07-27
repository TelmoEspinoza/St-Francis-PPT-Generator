# Technical Design Document (TDD) — St Francis PPT-Generator

**Status:** Draft v0.1
**Related:** [Functional Requirements](02-functional-requirements.md)

## 1. Overview

Web application, single-vendor-friendly stack. Angular SPA frontend talks to an ASP.NET Core Web API backend, which owns all Psalter data and `.pptx` rendering against SQL Server.

- **Frontend**: Angular 22 SPA — calendar/day picker, Psalter item CRUD, slide preview, download.
- **Backend**: ASP.NET Core Web API (C#) — Psalter data access, deck assembly, `.pptx` rendering.
- **Database**: SQL Server — system of record for Psalter items, templates, and generation jobs.

## 2. Proposed Stack

| Layer | Choice | Why |
| --- | --- | --- |
| Frontend | Angular 22, standalone components, Signals | Modern Angular baseline — no `NgModules`, no third-party state library needed for MVP-scale state |
| UI components | Angular Material + Angular CDK | Native Angular ecosystem, Material 3 theming, accessible out of the box — avoids pulling in a non-Angular design system |
| Templating/control flow | Native control flow (`@if`, `@for`, `@switch`), Signal Forms | Built-in Angular primitives; Signal Forms (experimental) keeps form state as signals, consistent with the rest of the component state model instead of mixing in Reactive Forms' Observable-based model |
| HTTP/data access | Angular `HttpClient` (`provideHttpClient` + `withFetch`) | Native Angular client, no axios/fetch wrapper |
| Routing | Angular Router | Native, supports lazy-loaded standalone routes |
| Backend/API | ASP.NET Core Web API (.NET, C#) | Native pairing with SQL Server and EF Core; keeps the whole non-frontend stack in one language/runtime; built-in OpenAPI support |
| Core generation | ShapeCrawler (built on the Open XML SDK) | .NET-native `.pptx` (OOXML) authoring with a clean, fluent API over raw OOXML; actively maintained and can edit existing template files directly |
| Parsing | Structured Psalter items read from SQL Server via EF Core (primary); Markdig for freeform Markdown paste input | Most content now comes from the Psalter database (FR-01), not raw text |
| Database | SQL Server | Relational store for Psalter items (hymns, antiphons, psalms, prayers), templates, and generation job history |
| DB access | Entity Framework Core (SQL Server provider) | Native .NET ORM, migrations, strongly-typed queries |
| File storage | Local filesystem (MVP) → Azure Blob Storage (v2) | Generated `.pptx` binaries only — structured data lives in SQL Server, not the filesystem |
| Templates | `.pptx` files used as base layouts, edited via ShapeCrawler | Avoids building a layout engine from scratch |

## 3. High-Level Architecture

```text
[Angular Frontend: day/time picker, Psalter item input]
        │
        ▼
[ASP.NET Core Web API]
        │
        ▼
  [Parser] ── reads Psalter items (SQL Server via EF Core) → normalized Document schema (JSON)
        │
        ▼
 [Slide Mapper] ── maps schema sections to template layouts
        │
        ▼
 [Renderer (ShapeCrawler)] ── builds .pptx from mapped content + template
        │
        ▼
  [Output: .pptx file] ──► [Preview / Download]
```

## 4. Component Responsibilities

- **Parser**: reads Psalter items from SQL Server (or parses freeform Markdown paste input) into a normalized `Document` object (see [schema doc](05-api-data-schema.md)).
- **Slide Mapper**: decides layout per section (title vs. bullets vs. image+text) based on content shape and template capabilities.
- **Renderer**: uses ShapeCrawler to write slides into a copy of the chosen template file.
- **API layer (ASP.NET Core Web API)**: exposes `POST /documents/generate` and related endpoints (see [API/data schema doc](05-api-data-schema.md)); orchestrates Parser → Slide Mapper → Renderer.
- **Angular Frontend**: calendar/day/time picker, Psalter item CRUD forms (Signal Forms), slide preview, download trigger.

## 5. Sequence — Generate Document

```text
User → Angular Frontend: pick calendar day + time, choose Psalter items
Angular Frontend → ASP.NET Web API: POST /documents/generate
ASP.NET Web API → SQL Server (EF Core): fetch Psalter items for day/time
SQL Server → ASP.NET Web API: Psalter item rows
ASP.NET Web API → Parser: parse(items)
Parser → ASP.NET Web API: Document schema
ASP.NET Web API → Renderer: render(Document, template)
Renderer → ASP.NET Web API: file path / bytes
ASP.NET Web API → Angular Frontend: 200 + download URL
Angular Frontend → User: preview + download button
```

## 6. Key Design Decisions

- Keep parsing and rendering as separate, independently testable modules.
- Templates are just `.pptx` files with named placeholder layouts — no custom template format to invent.
- Start single-threaded/synchronous; only add a job queue if generation time or concurrent load requires it.
- Angular frontend uses standalone components, Signals for local/shared state, and Signal Forms instead of Reactive Forms, keeping the whole component model signal-based rather than mixing in RxJS-based forms.
- Backend is ASP.NET Core Web API + EF Core against SQL Server, not the previously proposed Python/FastAPI stack — this pairs naturally with SQL Server and keeps parsing/mapping/rendering in one language (C#).
- Rendering library is ShapeCrawler, not the raw Open XML SDK or a commercial option (e.g. Aspose.Slides, Syncfusion) — it wraps the Open XML SDK with a fluent API and can open/edit existing `.pptx` template files directly, avoiding both low-level OOXML boilerplate and commercial licensing costs.

## 7. Error Handling

- Invalid input → 400-level error with a clear message, no partial file written.
- Rendering failure → log details, return a generic user-facing error, keep raw input for debugging.

## 8. Future Considerations (not MVP)

- Async job queue for large documents or batch generation.
- Multiple export formats (Google Slides via API, Keynote).
- Template marketplace / user-uploaded templates.
