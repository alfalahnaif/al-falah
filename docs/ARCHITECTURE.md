# Architecture — Proposed Baseline

## Proposed stack
- Flutter / Dart
- Riverpod for state management and dependency injection
- GoRouter for navigation — implemented as pinned `go_router` 18.1.4 with four tab branches and two secondary destinations; see [navigation architecture](architecture/NAVIGATION_ARCHITECTURE.md). Other proposed stack packages remain unapproved.
- SQLite + Drift for local writable user data
- just_audio for local audio playback
- flutter_test and integration_test
- dart analyze / flutter_lints
- GitHub Actions for CI

These are proposed choices. Before adding packages, check stable versions, maintenance, license, transitive dependencies, permissions, and Android/iOS compatibility. Owner approval is required for material changes.

## Architecture style
Feature-first organization with UI and data layers. Add a domain layer/use cases where business rules are non-trivial or reused; do not create boilerplate abstractions without value.

```text
lib/
  app/
    app.dart
    router/
    bootstrap/
  core/
    errors/
    logging/
    localization/
    storage/
    utilities/
  features/
    home/{data,domain,presentation}/
    quran/{data,domain,presentation}/
    bookmarks/{data,domain,presentation}/
    audio/{data,domain,presentation}/
    adhkar/{data,domain,presentation}/
    settings/{data,domain,presentation}/
  shared/
    widgets/
    models/
assets/
  content/
    quran/
    metadata/
    adhkar/
    manifest/
  fonts/
  icons/
test/
  unit/
  widget/
  integration/
  fixtures/
docs/
  decisions/
  content-provenance/
```

## Layer rules
- Presentation: screens, widgets, view state; no direct SQL/file access.
- Domain: feature rules and entities; no Flutter UI or storage-plugin dependency.
- Data: repositories, DAOs, asset loaders, file/audio storage.
- Repositories are feature data sources of truth.
- Keep bundled canonical content separate from writable user data.
- Use immutable models and unidirectional data flow.
- Use dependency injection; avoid global mutable state.
- Use typed errors and explicit failure states.

## Storage
Separate:
1. Bundled, read-only content assets/database.
2. Writable SQLite user database.

MVP user data:
- bookmarks
- reading_positions
- audio_downloads
- adhkar_progress
- preferences where structured persistence is needed

Later:
- memorization_plans
- memorization_items
- revision_schedule
- daily_goals
- progress_events

Use stable IDs, constraints, transactions, explicit migrations, and migration tests. Do not use display text as identifiers.

## Offline
Core app startup, Quran reading, search, bookmarks, and previously downloaded audio must work offline. Audio downloads require internet only when user-initiated. No runtime backend, remote Quran API, remote configuration, authentication, or analytics.

## References
- https://docs.flutter.dev/app-architecture/recommendations
- https://docs.flutter.dev/app-architecture/design-patterns/offline-first
- https://drift.simonbinder.eu/
- https://riverpod.dev/docs/how_to/testing
- https://pub.dev/packages/just_audio


## Mushaf page rendering and interaction

The MVP reader is a single-page-per-screen Madinah Mushaf experience with horizontal page turning. It is not a two-page facing spread and not a continuously reflowed text view.

Potential implementation models must be evaluated before selection:

1. **Licensed page images + verified hit regions:** preserves printed layout most directly. Each page image is accompanied by a separately validated mapping from page coordinates to canonical ayah/word IDs. Images alone are not interactive.
2. **Fixed-layout glyph/page rendering + verified layout data:** renders text and ornaments from a licensed Mushaf font and exact page/line/word layout metadata. This offers richer text interaction but requires rigorous rendering and layout validation.

Do not choose either model based on convenience. First verify source availability, edition identity, license/redistribution rights, exact page dimensions, word/ayah coordinate data, font license, and offline packaging rights. Never recreate page layout from a generic Quran text dataset.

Page interaction must resolve to canonical IDs (surah, ayah, optionally word), never by guessing from screen position. Coordinate maps must be tested across device sizes, pixel densities, safe areas, and zoom/scale behavior. If accurate word-level hit regions are unavailable, ship ayah-level interaction only or defer interaction; do not approximate word targets.

Horizontal page navigation must respect the selected edition's page order and preserve last-read page locally. The primary view shows one page at a time.


## Evidence-informed renderer direction (proposed, not yet approved)

Static APK analysis of Wahy and RoonFit suggests that Al-Falah should investigate a bundled SQLite content package plus glyph/page/line/word layout metadata and edition-matched QCF fonts. Wahy's reported `TB_Glyph`, `TB_Word`, `TB_Quran`, and `TB_Mushaf` tables illustrate a useful separation of concerns. This is an architectural reference only; do not copy the extracted database, fonts, mappings, or other assets.

Quran Foundation's public rendering documentation confirms the general QCF glyph model: words include page/line data, lines can span multiple ayahs, and words must be grouped by page and line to reproduce the printed Mushaf. See `docs/TECHNICAL_FINDINGS_ROONFIT_WAHY.md`.

Important: the official King Fahd Complex smart-device Unicode font is described as suitable for verse-level text, not for reproducing an entire printed Mushaf page. Do not confuse that Unicode font with page-faithful QCF glyph fonts.

Before implementation, approve the exact edition/year and verify redistribution rights for the matching glyph data, font files, surah ornaments, and content database. Keep Quran text, layout metadata, audio catalogue/timing, and writable user data as separate datasets.


## Approved implementation scope (2026-11-16)

The owner has selected the 1441H Madinah Mushaf, Hafs 'an Asim, as the target edition. This selection remains conditional on verification of exact source identity and permission to bundle and redistribute the matching text, QCF4 font files, glyph/layout data, and ornaments offline.

MVP interactions are ayah-level only. Word-level selection is explicitly deferred. Each ayah action must resolve through a verified page-coordinate/layout mapping to a canonical surah/ayah key; do not approximate touch regions.

MVP audio is limited to one reciter, not yet selected. The app must support user-initiated download to private local storage and offline playback. The reciter, recording source, riwayah, file segmentation, download rights, and timing availability must be verified before integration. No mandatory streaming/API dependency.

The MVP does not require Firebase, hosted databases, user accounts, or cloud sync. Bookmarks and last-read position remain local.
