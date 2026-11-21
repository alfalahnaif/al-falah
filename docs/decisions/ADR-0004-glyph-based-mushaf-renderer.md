# ADR-0004: Glyph-based fixed-layout Mushaf renderer

- Status: Proposed — requires source, license, and edition approval
- Date: 2026-11-16

## Context
The product requires one complete Madinah Mushaf page at a time, horizontally turned, with accurate ayah and eventually word interactions. Static APK analysis of Wahy reports a bundled SQLite database with glyph and word layout data; RoonFit reports a simpler offline verse text dataset.

## Proposed decision
Investigate a Wahy-inspired glyph/page/line/word renderer using a fully bundled, licensed, edition-matched data package and fonts. Do not copy Wahy's or RoonFit's extracted assets.

## Rationale
A fixed-layout glyph model can preserve printed page breaks and line positions while associating rendered words with canonical verse and word identifiers. Public Quran Foundation rendering documentation describes grouping words by page and line and using QCF glyph data for page-faithful Mushaf rendering.

## Constraints
- Exact Mushaf edition/year must be approved.
- Font, layout, text, ornaments, and metadata rights must be verified independently.
- No runtime API/CDN dependency for Quran reading.
- No approximate word hit-testing.
- If word mapping cannot be validated, expose ayah-level selection only.
- Automated validation does not replace qualified Quran review.

## Alternatives
1. Page images plus verified hit-region metadata.
2. Unicode verse text with reflow (not suitable for primary fixed-page mode).
3. Glyph-based fixed-layout rendering (preferred candidate).

## Consequences
More complex data preparation and renderer QA than paragraph text, but best alignment with the approved Mushaf reading experience.

## Approval
Do not implement until the product owner approves the exact edition and licensed source package.


## Approved product constraints (2026-11-16)
- Target edition: Madinah 1441H, Hafs 'an Asim (subject to source and license verification).
- MVP selection granularity: ayah only; word selection deferred.
- MVP audio: one reciter, not yet selected; offline download and playback after rights verification.
