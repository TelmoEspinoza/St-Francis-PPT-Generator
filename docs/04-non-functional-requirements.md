# Non-Functional Requirements (NFR) — St Francis PPT-Generator

**Status:** Draft v0.1

## 1. Performance

| Requirement | Target |
| --- | --- |
| Generate a 10-slide deck | < 30 seconds end-to-end |
| Generate a 50-slide deck | < 2 minutes |
| API response for status check | < 200ms |

## 2. Reliability

- Generation failures must not leave corrupt/partial `.pptx` files on disk or delivered to the user.
- If run as a service: 99% uptime is sufficient at this stage (no SLA needed for MVP).

## 3. Scalability

- MVP: single-user or low-concurrency (CLI or small team web app) — no horizontal scaling required.
- Design generation logic to be stateless so it can move behind a queue/worker later without rework.

## 4. Security

- No sensitive data expected in MVP (user-provided text/outline only) — still avoid logging full input content in plaintext logs.
- If web-hosted: validate/sanitize all uploaded files (template `.pptx`, images) before processing.
- File uploads capped (e.g., 10MB) to prevent abuse.

## 5. Usability

- A first-time user should be able to generate a deck within 2 minutes of arriving, no documentation required.
- Error messages must be actionable ("heading missing on line 4" not "parse error").

## 6. Maintainability

- Parser, mapper, and renderer stay as separate modules with unit tests (see [Test/QA Plan](07-test-qa-plan.md)).
- Template files are data, not code — adding a new template should not require code changes.

## 7. Compatibility

- Output `.pptx` must open correctly in Microsoft PowerPoint (desktop + web) and Google Slides.
- Support macOS/Windows/Linux if distributed as a CLI tool.

## 8. Cost

- MVP should run on free/low-cost tiers (no managed DB, no GPU, minimal storage) given small-project scope.
