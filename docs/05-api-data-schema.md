# API & Data Schema — St Francis PPT-Generator

**Status:** Draft v0.1

## 1. Core Data Model

### Deck (intermediate schema, produced by the Parser)

```json
{
  "title": "Q3 Business Review",
  "template": "modern-minimal",
  "slides": [
    {
      "type": "title",
      "title": "Q3 Business Review",
      "subtitle": "Prepared by Tel — July 2026"
    },
    {
      "type": "section_header",
      "title": "Revenue Overview"
    },
    {
      "type": "bullets",
      "title": "Key Highlights",
      "bullets": [
        "Revenue up 12% QoQ",
        "3 new enterprise clients signed",
        "Churn down to 2.1%"
      ]
    },
    {
      "type": "image_text",
      "title": "Growth Chart",
      "image_url": "assets/growth-chart.png",
      "text": "Steady month-over-month growth across all regions."
    }
  ]
}
```

### Slide Types (MVP)

| type | fields | notes |
|---|---|---|
| `title` | `title`, `subtitle` | first slide only |
| `section_header` | `title` | divider slide |
| `bullets` | `title`, `bullets[]` | most common content slide |
| `image_text` | `title`, `image_url`, `text` | image + supporting text |

## 2. REST API (if built as a web service)

### `POST /decks/generate`

Request:
```json
{
  "input": "raw text or markdown outline",
  "input_format": "markdown",
  "template": "modern-minimal",
  "options": {
    "max_bullets_per_slide": 5
  }
}
```

Response `202 Accepted`:
```json
{
  "job_id": "d3f1...",
  "status": "processing"
}
```

### `GET /decks/{job_id}`

Response `200 OK`:
```json
{
  "job_id": "d3f1...",
  "status": "completed",
  "download_url": "/decks/d3f1.../download",
  "slide_count": 8
}
```

### `GET /decks/{job_id}/download`

Returns the `.pptx` file binary (`Content-Type: application/vnd.openxmlformats-officedocument.presentationml.presentation`).

### `GET /templates`

Response `200 OK`:
```json
{
  "templates": [
    { "id": "modern-minimal", "name": "Modern Minimal", "preview_url": "..." },
    { "id": "corporate-blue", "name": "Corporate Blue", "preview_url": "..." }
  ]
}
```

## 3. Error Response Shape

```json
{
  "error": {
    "code": "INVALID_INPUT",
    "message": "No headings found — at least one section is required.",
    "field": "input"
  }
}
```

## 4. CLI Equivalent (if not building a web service)

```
pptgen generate --input notes.md --template modern-minimal --out deck.pptx
pptgen templates list
```
