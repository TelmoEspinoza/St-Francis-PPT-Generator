# Dashboard UI Phase 1 Spec

## Overview

This is phase 1 of 3 for the ppt file generation. Use the ppt-sample referenced below for how it should look.

## Requirements for phase 1

- ShapeCrawler installation
- Create a service in /Services called PresentationBuilder.cs
- PresentationBuilder.cs in this phase will genereate a ppt of two slides: "cover" and "good bye" pages for now.
- Use the following properties for the ppt file:

- BodyFont = "Arial Narrow";
- LabelFont = "Century Gothic";
- TagColor = "FFFF00";
- SlideBackgroundColor = "000000";
- BodyX = 30, BodyY = 40, BodyWidth = 900, BodyHeight = 500;
- LabelX = 354, LabelY = 22, LabelWidth = 567, LabelHeight = 40;

- Placeholder for sidebar and main area. Just add an h2 with "Sidebar" and "Main" for now.

## References

- @context/ppt-samples/245MP-OTWeek 16Tuesday.pptx
