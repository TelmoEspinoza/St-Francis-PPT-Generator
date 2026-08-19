# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Context Files

Read the following to get the full context of the project:
-@context/project-overview.md

## Overview

PsalterApi is an ASP.NET Core 10.0 minimal-API backend (project root: `PsalterApi/`, no `.sln` file — it's a single project). It serves prayer/psalter/liturgical-calendar data ("SFPPTS") from a SQL Server database via Entity Framework Core.

## Commands

Run all commands from `PsalterApi/` (the project directory).

- Build: `dotnet build`
- Run (dev, hot to `http://localhost:5185`): `dotnet run` — or `dotnet watch run` for hot reload
- Restore packages: `dotnet restore`
- There is no test project in this repo yet.

### Database connection

The `ConSFPPTS` connection string (SQL Server) is **not** in `appsettings.json` — it's supplied via .NET user-secrets (`UserSecretsId` in `PsalterApi.csproj`). To set it locally:

```
dotnet user-secrets set "ConnectionStrings:ConSFPPTS" "<connection string>"
```

### EF Core model updates

The `Models/` classes and `Data/SfpptsContext.cs` are scaffolded from the database (DB-first: note the `PK__Table__<hash>` constraint names and partial classes). After a schema change, re-scaffold rather than hand-editing the generated shape:

```
dotnet ef dbcontext scaffold Name=ConnectionStrings:ConSFPPTS Microsoft.EntityFrameworkCore.SqlServer -o Models -c SfpptsContext --context-dir Data -f
```

Use the `OnModelCreatingPartial` partial method / partial classes for any hand-written additions so they survive re-scaffolding.

## Architecture

Three-layer, per-entity structure, wired together in `Program.cs`:

- **`Endpoints/`** — static classes with `Map<Entity>()` extension methods on `IEndpointRouteBuilder`, registered in `Program.cs` (e.g. `app.MapPrayers()`, `app.MapPsalters()`). Each defines the minimal-API routes for one resource (GET/POST/PUT/DELETE), calls into the matching service, and translates `KeyNotFoundException` into `404`.
- **`Services/`** — one `I<Entity>Service` interface + `<Entity>Service` implementation per resource, injected as scoped DI services (registered in `Program.cs`). Services hold all business/query logic and talk to `SfpptsContext` directly; they throw `KeyNotFoundException` for missing entities rather than returning null.
- **`Dtos/<Entity>/`** — request/response DTOs per resource (e.g. `Dtos/Psalters/CreatePsalterRequest.cs`, `Dtos/PsalterDetail/GetPsalterDetailResponse.cs`). Services map between EF entities and DTOs; entities are never returned directly from endpoints. Nested resources (e.g. `PsalterDetail`) get their own Dtos folder even though they're only ever created/read through their parent (`Psalter`).
- **`Models/` + `Data/SfpptsContext.cs`** — EF Core entities and `DbContext`, scaffolded from the SQL Server database (see above). Relationships are configured in `SfpptsContext.OnModelCreating`, not via Fluent API elsewhere.

### Data model

Core entities and relationships: `Psalter` (has many `PsalterDetail`, has many `Calendar`, belongs to one `Template`) → `PsalterDetail` (belongs to `Psalter`, `Prayer`, `TypePrayer`) ; `Calendar` (belongs to `Ordo` and `Psalter`) → `Ordo` (belongs to `Season`, has many `Calendar`). When loading a `Psalter` for a response DTO, related navigation properties (`IdTemplateNavigation`, and each detail's `IdTypePrayerNavigation`/`IdPrayerNavigation`) must be `.Include()`d or otherwise loaded from the context before mapping — EF only auto-fixes-up navigations for entities already tracked in the same `DbContext` instance, so building/mapping an entity graph by hand (as in `CreatePsalter`) leaves unloaded navigations `null`.

### API surface

OpenAPI/Scalar docs are only mapped in Development (`/scalar` via `app.MapScalarApiReference()`, `AddOpenApi()`/`MapOpenApi()`).

Several endpoints and service methods are still stubs (`throw new NotImplementedException()`), including `GetAllPsalters`, `UpdatePsalter`, and `DeletePsalter` — check `Services/IPsalterService.cs` implementations before assuming a route is functional.
