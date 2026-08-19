# Current Feature: Dashboard UI Phase 1 (PPT Generation)

## Status

Not Started

## Goals
<!-- Goals and Requirements -->

- Install ShapeCrawler package
- Create `Services/PresentationBuilder.cs`
- `PresentationBuilder.cs` generates a .pptx with two slides for now: "cover" and "good bye"
- Apply these styling properties to the generated ppt:
  - BodyFont = "Arial Narrow"
  - LabelFont = "Century Gothic"
  - TagColor = "FFFF00"
  - SlideBackgroundColor = "000000"
  - BodyX = 30, BodyY = 40, BodyWidth = 900, BodyHeight = 500
  - LabelX = 354, LabelY = 22, LabelWidth = 567, LabelHeight = 40
- Add placeholder content for sidebar and main area (just an h2 with "Sidebar" and "Main" for now)

## Notes
<!-- Any extra note -->

- This is phase 1 of 3 for ppt file generation; two more phases will follow.
- Reference sample for target look: @context/ppt-samples/245MP-OTWeek 16Tuesday.pptx
- Spec source: @context/PrototypePtt.md

## History
<!-- Keep this updated. Earliest to latest -->
