# Test / QA Plan — St Francis PPT-Generator

**Status:** Draft v0.1

## 1. Test Levels

| Level | Scope | Tooling |
|---|---|---|
| Unit | Parser (text → Deck schema), Slide Mapper logic | `pytest` |
| Integration | Deck schema → rendered `.pptx` via `python-pptx` | `pytest` + file assertions |
| End-to-end | Full flow: raw input → downloadable file | `pytest` (CLI) or Playwright (web) |
| Manual/exploratory | Open generated `.pptx` in real PowerPoint/Google Slides | Manual, each release |

## 2. Key Test Cases

| ID | Scenario | Expected Result |
|---|---|---|
| TC-01 | Input with 3 headings, bullets under each | Output has 4 slides (title + 3 content) |
| TC-02 | Empty input | Clear validation error, no file produced |
| TC-03 | Input with an image URL | Image appears on correct slide |
| TC-04 | Input with >5 bullets on one section | Bullets split across slides per `max_bullets_per_slide` option |
| TC-05 | Generated file opened in PowerPoint desktop | Opens without repair prompt or corruption warning |
| TC-06 | Generated file opened in Google Slides | Opens and renders layout correctly |
| TC-07 | Switch template mid-generation (if UI) | Correct template applied to new deck, no bleed from previous |
| TC-08 | Large input (50+ sections) | Completes within NFR performance target, no crash |

## 3. Definition of Done (per feature)

- Unit tests pass for new/changed logic.
- At least one integration test covers the new behavior end-to-end.
- Manually verified in one real presentation app (PowerPoint or Slides).
- No regressions in existing test suite.

## 4. Release Checklist

- [ ] All Must-priority FRs covered by at least one test.
- [ ] Performance targets from NFR doc verified on a realistic input size.
- [ ] Generated file validated with a `.pptx` structure checker (e.g., re-open with `python-pptx` after generation).
- [ ] Manual smoke test: generate → open → visually confirm layout.
