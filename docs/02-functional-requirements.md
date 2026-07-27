# Functional Requirements Document (FRD) — St Francis PPT-Generator

**Status:** Draft v0.1
**Related:** [Product Brief](01-product-brief.md)

## 1. Scope

Defines what the system must do (user-facing behavior). Non-functional targets live in the [NFR doc](04-non-functional-requirements.md).

## 2. User Stories (user = priests, sacristans, helpers)

| ID | As a... | I want to... | So that... |
|---|---|---|---|
| US-01 | user | write or paste psalter content | I can generate a document without starting from a blank slide |
| US-02 | user | choose in a calendar a day template for morning or evening prayer | the document matches a consistent visual template |
| US-03 | user | preview the generated slides before export | I can catch obvious issues early |
| US-04 | user | download the result as a `.pptx` file | I can open and edit it in PowerPoint/Keynote |
| US-05 | user | update various templates od a single week | I don't have to redo the same part of the document one by one in the hole week |

## 3. Functional Requirements

| ID | Requirement | Priority |
|---|---|---|
| FR-01 | System shall contain a database to record Pslater information. | Must |
| FR-02 | System shall generate a single document with the Psalter templeate according to the calendar y and time of the day | Must |
| FR-03 | System shall support at least: Foreword, title header, content and Afterword | Must |
| FR-04 | System shall export a valid, openable `.pptx` file | Must |
| FR-05 | System shall create a template/theme according to the day of the calendar | Must |
| FR-06 | System shall show a preview (thumbnails or slide list) before export | Should |
| FR-07 | System shall allow regenerating a single slide without full re-run | Could |

## 4. Acceptance Criteria (example — FR-01/FR-02/FR-04)

Given a selected day and time of the day,
When the user requests generation,
Then the output `.pptx` contains exactly the structure and slides,
And the file opens without corruption in PowerPoint and Google Slides.

## 6. Out of Scope (MVP)

- Speech-to-text or voice input.
- AI-generated slide content/summarization (may be a v2 feature).
- Multi-user real-time editing.
