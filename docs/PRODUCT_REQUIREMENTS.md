# Product Requirements — الفلاح (Al-Falah) MVP

## Product vision
An Arabic-first, offline-first Quran and daily worship companion for Android and iOS. The Quran is the product's core. The MVP validates reading, bookmarks, audio downloads/playback, and a small approved adhkar experience.

## MVP goals
1. Comfortable Quran reading.
2. Accurate resume-last-reading and bookmarks.
3. Downloadable recitations that play offline.
4. A small, verified adhkar collection with local counting.

## Quran reader product decision

The primary MVP reader is a **single-page Mushaf view** based on the Madinah Mushaf, Hafs 'an Asim. It displays one complete printed page at a time, not a two-page spread. The user turns pages horizontally with a natural swipe gesture.

- Preserve the exact approved printed-page layout and page boundaries.
- Do not reflow or regenerate the canonical Mushaf page layout.
- Page content and essential page assets must be available locally.
- Each ayah must be addressable and selectable.
- Word-level selection is a planned enhancement only if reliable word-region metadata is available and approved.
- An ayah action sheet may expose only implemented and approved actions.
- A continuous, reflowable reading mode is a later option, not the primary MVP reader.
- A page image must not be treated as selectable text by itself; interaction requires a verified mapping layer from page coordinates to canonical ayah/word identifiers.

The leading technical approach is glyph-based fixed-layout rendering (Wahy-inspired), using edition-matched page/line/word data and licensed fonts. The exact Madinah Mushaf edition/year, digital redistribution license, glyph/layout package, and word/ayah mapping remain owner-approval items. Do not copy extracted assets from Wahy or RoonFit. Do not assume the 1440H, 1441H, 1422H, or 1405H editions are interchangeable.

## MVP screens
- Splash / initialization
- Minimal onboarding
- Home
- Surah index
- Quran reading view
- Search
- Limited verse actions
- Bookmarks
- Audio catalogue
- Audio download manager
- Audio player / mini-player
- Adhkar categories
- Adhkar session / counter
- Settings
- Sources, licenses, and About

## Explicit exclusions
No accounts, backend, hosting, cloud sync, remote database, mandatory APIs, analytics, ads, social groups, leaderboards, AI religious assistant, AI tafsir, automated tajweed, public achievements, or advanced statistics.

## MVP acceptance
- First launch and core reading work offline.
- Bundled Quran content passes integrity validation.
- Search resolves to canonical verse IDs and displays canonical source text.
- Reading position and bookmarks persist after force-close/relaunch.
- Downloaded audio plays in airplane mode.
- Adhkar entries have approved provenance and licensing.
- Adhkar counter state persists locally.
- Sources/licenses are visible in app.
- No release-blocking content, privacy, security, crash, or data-loss defect remains.

## Phases
- Phase 1: MVP / closed beta.
- Phase 2: memorization, tafsir/translations, prayer times, qibla, local reminders, additional approved duas/adhkar.
- Phase 3: daily goals, local progress summaries, private achievements, export/import.
- Phase 4: optional speech assistance, carefully constrained AI study features, optional sync/groups only if user research justifies them.

A later phase is not an automatic commitment. Each feature requires owner approval.


## Approved MVP decisions (2026-11-16)

- Mushaf target: Madinah 1441H, Hafs 'an Asim, subject to source/edition/license verification.
- Reader: one complete page at a time, 604-page target, horizontal page turning.
- Interaction: ayah-level selection only in MVP. Word-level selection is deferred.
- Audio: one reciter in MVP, not yet named; download-on-demand and local playback only after rights verification.
- Mandatory gates: exact edition match, written offline redistribution rights, validated glyph/layout package, page and ayah mapping tests, and qualified Quran text review.
- No runtime API, hosted content database, Firebase dependency, or mandatory account for core Quran reading.
