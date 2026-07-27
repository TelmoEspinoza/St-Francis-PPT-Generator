# API & Data Schema — St Francis PPT-Generator

**Status:** Draft v0.1

## 1. Core Data Model

### Deck (intermediate schema, produced by the Parser)

```json
{
  "title": "Morning Prayer of the Church ",
  "template": "Morning Prayer OT",
  "slides": [
    {
      "type": "title",
      "title": "Morning Prayer of the Church (the Divine Office) ",
      "subtitle": "Week 16 – Tuesday Ordinary Time "
    },
    {
      "type": "bullets",
      "title": "Introduction",
      "bullets": [
        "Leader: Lord, open our lips. ",
        "All: And we shall praise your name.  "        
      ]
    },
    {
      "type": "title",
      "title": "Invitatory Antiphon",
      "subtitle": "Response:",
      "text": "A mighty God is the Lord: 
          come, let us adore him."
    },
    {
      "type": "bullets",
      "title": "Hymn",
      "text": "Father, we praise you, now the night is over,
                active and watchful, stand we all before you;
                singing, we offer prayer and meditation: thus we adore you.

                Monarch of all things, fit us for your mansions;
                banish our weakness, health and wholeness sending;
                bring us to heaven, where your saints united joy without ending.

                All-holy Father, Son and equal Spirit,
                Trinity blessed, send us your salvation;
                yours is the glory, gleaming and resounding through all creation."
    },
    {....}
  ]
}
```

### Slide Types (MVP)

| type | fields | notes |
| --- | --- | --- |
| `title` | `title`, `subtitle` | first slide only |
| `section_header` | `title` | divider slide |
| `bullets` | `title`, `bullets[]` | most common content slide |
| `image_text` | `title`, `image_url`, `text` | image + supporting text |

## 2. REST API (built as a microservice)

### `POST /documents/generate`


### `GET /documents/{calendar_id}`

Response `200 OK`:

```json
{
  "calendar_id": "d3f1...",
  "status": "completed",
  "download_url": "/documents/d3f1.../download",
  "slide_count": 8
}
```

### `GET /documents/{job_id}/download`

Returns the `.pptx` file binary (`Content-Type: application/vnd.openxmlformats-officedocument.presentationml.presentation`).

## 3. Error Response Shape

```json
{
  "error": {
    "code": "INVALID_INPUT",
    "message": "No info was found — at least one section is required.",
    "field": "input"
  }
}
```
