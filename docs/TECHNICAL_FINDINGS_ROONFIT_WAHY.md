# Al-Falah — Technical Findings from Static APK Analysis (RoonFit & Wahy)

**Date:** 2026-11-16  
**Evidence basis:** User-provided static APK analysis report (`quran_sources_report.md`) plus public technical documentation cited below.  
**Scope limitation:** Static APK inspection only. No app execution, runtime traffic interception, server verification, source-code access, or license verification was performed.

## 1. Executive decision

The findings strongly support a **glyph-based, fixed-layout Mushaf renderer** as the leading technical direction for Al-Falah, rather than:
- ordinary Unicode Quran text reflowed into paragraphs, or
- page screenshots with approximate tap regions.

The leading candidate architecture is:
1. Bundled, read-only Quran content database.
2. Page/line/word glyph-layout metadata for one explicitly selected Madinah Mushaf edition.
3. Matching licensed page-specific or QCF glyph fonts and surah/ornament assets.
4. A renderer that groups words by page and line and draws the exact page.
5. Stable verse/word IDs attached to each rendered word so taps resolve to canonical content IDs.
6. Local user database for bookmarks, last-read position, and preferences.
7. Audio metadata and downloaded audio handled separately from canonical Quran content.

This is a **direction to validate**, not yet permission to import Wahy's extracted database, fonts, glyphs, or other assets.

## 2. Findings from the user's static APK analysis

### RoonFit (`com.roonfit.fitness`, v4.28.0)
The report states:
- Quran text is bundled offline in TSV files.
- `quran_hafs_v2.tsv`: 2.18 MB, 6,236 Hafs Uthmani verses, with page and juz metadata.
- `quran_muyassar_v3.tsv`: 1.94 MB, 6,236 entries of Tafsir al-Muyassar.
- `quran_suras.tsv`: 114 surahs.
- `uthmanic_hafs_v20.ttf`: 795 KB.
- No network request is used to retrieve verse text.
- Reciter metadata and ayah timing are fetched from mp3quran.net APIs at runtime.

Interpretation:
- This is a useful lightweight model for offline verse text and metadata.
- The presence of a Unicode Uthmani font and a verse TSV does not, by itself, provide the fixed printed-page layout required by Al-Falah's primary Mushaf reader.
- The online audio API approach does not meet Al-Falah's preference for user-initiated downloads followed by fully local playback unless audio metadata is also cached and the actual audio is downloaded locally.

### Wahy (`com.logicdev.quran_reader`, v1.4.9)
The report states:
- Flutter application.
- Bundled SQLite database `The_Holy_Quran.db`, approximately 14.11 MB, inside a ZIP asset.
- 28 tables.
- `TB_Quran`: 12,472 rows, comprising 6,236 Arabic verses and 6,236 Sahih International translation rows.
- `TB_Glyph`: 83,895 rows described as page-rendering glyph data.
- `TB_Word`: 77,432 rows, words and reader timing data.
- `TB_WordArabic`: 17,603 rows, word lexicon.
- `TB_Translations`: 181 rows, including 133 translations and 48 tafsir entries (downloaded on demand according to the report).
- `TB_Reader`: 75 readers.
- `TB_Mushaf`: four Mushaf variants, reported as Madinah 1422H / 1439H / 1405H (Hafs) and 1428H (Warsh).
- `TB_JuzaHizb`: 270 rows.
- `TB_TafseelMawdoey`: 965 rows.
- QCF4 font archives and QCF4 Tajweed font archives are bundled.
- Five audio source domains are used, covering 75 reciters.
- Twelve reciters have word-level timing; timing is stored offline in `TB_Word`.
- Tafsir/translation content is downloaded from the app developer's Firebase Storage.
- Firebase Analytics, Crashlytics, Facebook SDK, and Sentry are present.

Interpretation:
- Wahy's data model is the closest technical reference for the page-faithful, interactive Mushaf experience.
- Its key idea is not simply “SQLite”; it is the combination of Quran words, glyph/layout information, page/line placement, fonts, and stable content identifiers.
- Word-level timing can be bundled locally, but only for specific reciters for whom timing data exists and is verified.
- The five-source audio aggregator and Firebase-hosted tafsir system are not appropriate defaults for Al-Falah's local-first MVP.

## 3. Important edition/version discrepancy to resolve

The report identifies four `TB_Mushaf` variants (1422H, 1439H, 1405H, and Warsh 1428H), while it also reports QCF4 font archives. Do not assume these all belong to the same page edition or that QCF4 is interchangeable with older QCF/QPC font families.

Before selecting assets, inspect the actual `TB_Mushaf` schema and rows, font archive names and internal metadata, page counts, glyph encoding, and page/line mapping. Record exact relationships in a source manifest.

For Al-Falah, the product owner has selected the Madinah Mushaf, Hafs 'an Asim, 604-page experience. The exact edition/year must still be explicitly approved. Do not silently mix page data, text, glyph encoding, or fonts from different editions.

## 4. Public technical documentation confirms the rendering pattern

Quran Foundation's public font-rendering documentation distinguishes:
- Unicode Quran text (QPC Hafs) for ordinary verse rendering.
- QCF glyph-based fonts for pixel-faithful Mushaf page layout.

It describes the QCF approach as page-oriented and notes that words carry page and line numbers. It instructs implementers to group words by page and line, because a single printed line can contain words from multiple verses. It also notes that surah headings and basmala require separate handling. This supports a page/line/word rendering architecture rather than paragraph reflow.

Source: https://api-docs.quran.com/docs/tutorials/fonts/font-rendering/

Important limitation: Quran Foundation's documented API examples retrieve data online and use credentials. Al-Falah must not make that API a runtime dependency. It may be investigated as a possible source for a permitted, prebuilt local snapshot only after its applicable terms and redistribution permissions have been checked.

## 5. Official King Fahd Complex source and rights caution

The King Fahd Complex developer platform describes a digital Madinah Mushaf computer font and developer data in formats such as Excel, CSV, HTML5, SQL, XML, JSON, and TXT. It distinguishes the smart-device Unicode Uthmanic font—which is for verse-level display and is not intended to reproduce a complete printed Mushaf page—from page-faithful Mushaf rendering resources.

The Complex's website terms state that its website content, including texts, graphics, images, and databases, is protected unless specific content/software is expressly made available for public use. Therefore:
- Do not infer that every font, database, page asset, or extracted APK resource is freely redistributable.
- Obtain the exact official usage terms for the selected digital Mushaf resource.
- Preserve attribution and copyright notices.
- Save evidence of the exact asset's permission in `docs/content-provenance/`.

Sources:
- https://qurancomplex.gov.sa/quran-dev/
- https://policy.qurancomplex.gov.sa/index.html

## 6. Proposed Al-Falah data architecture

Keep four distinct datasets:

### A. Canonical Quran content (read-only)
- Surah ID and name.
- Ayah ID / canonical key (`surah:ayah`).
- Canonical Uthmani text from the approved source.
- Required verse markers and metadata.
- Source edition/version and checksum.

### B. Mushaf layout package (read-only, edition-specific)
- Mushaf edition ID and exact edition/year.
- Page number (1–604).
- Line number within page.
- Word order within line and verse.
- Glyph code(s) or page-specific font mapping.
- Surah heading / basmala / ornament placement metadata.
- Stable link from each rendered word to canonical surah/ayah/word IDs.
- Package version and checksums.

### C. Audio catalogue and timing (read-only metadata)
- Reciter ID and approved display name.
- Riwayah.
- Audio source and exact license/permission.
- Surah/ayah file segmentation.
- Optional word/ayah timing records with provenance.
- Download URL only as metadata; downloaded files stored in app-private local storage.
- Explicit status: not downloaded / downloading / downloaded / failed.

### D. User data (writable local database)
- Last-read page and last-read ayah.
- Bookmarks.
- Audio download state.
- User preferences.
- Later: memorization plans, notes, and progress.

Never merge user state into canonical Quran/layout source tables.

## 7. Rendering and interaction model

### Page rendering
- Display one page at a time.
- Use a horizontal page-turn interaction.
- Render the exact selected edition's page and line layout.
- Load only the required font subset/page font where appropriate, with a local fallback strategy.
- Bundle the complete required font/layout package for offline use.
- Do not use a network CDN or runtime API for page rendering.

### Ayah selection
Each rendered word must carry a canonical verse key. Tapping a word can select its parent ayah. Ayah actions must operate on the canonical verse ID, not on a guessed character range.

### Word selection
Enable long-press word selection only if the layout data supports reliable word-level hit-testing. If the source uses one glyph per word, map the glyph element directly to the word ID. If a line is rendered as a combined glyph string, require verified per-word boundaries before enabling word selection.

### Audio highlighting
Ayah highlighting requires verified ayah timing. Word highlighting requires verified word timing for that exact reciter and recording. Do not interpolate or fabricate timing. When timing is unavailable, provide normal playback without word-level highlighting.

## 8. Audio strategy for MVP

Do not reproduce Wahy's five-source aggregator.

Prefer:
- A small, curated set of approved reciters.
- A source with clear permission for in-app download and offline playback.
- Download-on-demand to app-private storage.
- A clear download manager, retry, cancellation, and storage cleanup.
- Local playback after download.
- Optional ayah segmentation and timing only when the provider's data is reliable and licensed.

The RoonFit pattern of fetching reciter metadata/timing from an API is not sufficient for an offline-first release. Metadata may be imported into a local manifest only if permitted; actual audio must be downloaded by explicit user action and then play offline.

## 9. What Al-Falah should reuse vs. avoid

### Reuse as architectural patterns
- Wahy: local SQLite content bundle; glyph/page/word separation; local word timing; distinct Mushaf edition records.
- RoonFit: lightweight offline verse dataset; separation of Quran text from translations; simple local assets.
- Both: stable verse identity and explicit source attribution.

### Do not copy
- Extracted `The_Holy_Quran.db` from Wahy.
- Extracted QCF/QCF4 fonts or font archives from either APK.
- Proprietary glyph mappings, page assets, tafsir packages, audio catalogues, or code.
- Firebase project identifiers, endpoints, or hosted content.
- Analytics, Facebook SDK, or Sentry integrations merely because Wahy uses them.
- Any audio source URL or recording until permission for offline redistribution is confirmed.

The APK report is reverse-engineering evidence, not a license grant.

## 10. Implementation decision gates

### Gate 1 — Source and edition approval
- Exact 604-page Hafs edition/year approved.
- Official source identified.
- Font/layout data source identified.
- Redistribution and offline-bundling permission documented.
- Attribution requirements recorded.

### Gate 2 — Technical feasibility prototype
Create a local-only prototype for a small representative sample:
- Page 1 and 2 (decorated opening pages).
- A page containing a surah heading and basmala.
- A page with multiple surahs or a surah heading near a page break.
- A page with an ayah crossing a line boundary.
- A page with an ayah crossing a page boundary.

Verify rendering against the approved reference, line order, word/ayah mapping, font fallback, RTL, and page-turn behavior.

### Gate 3 — Content integrity
- Validate 604 pages and expected page/line counts for the chosen edition.
- Validate all canonical verse keys.
- Validate every word-to-ayah mapping.
- Validate page/line ordering.
- Compare rendered output against reference pages.
- Record hashes and source provenance.
- Conduct independent qualified Quran text review.

### Gate 4 — MVP implementation
Only after gates 1–3 pass:
- Implement local content repository.
- Implement page renderer.
- Implement horizontal page navigation.
- Implement ayah selection and action sheet.
- Implement bookmarks and last-read persistence.
- Add audio downloads/playback after separate audio rights approval.

## 11. Open questions requiring owner approval

1. Which exact edition/year should be the single MVP edition: 1439H, 1440H, 1441H, or another officially sourced 604-page Hafs edition? The previous decision selected the Madinah Mushaf but did not conclusively approve a year.
2. Is word-level selection mandatory in MVP, or is ayah-level selection sufficient for the first beta?
3. Which one or two reciters should be considered for MVP, after license verification?
4. Should the MVP ship only Quran reading, bookmarks, and audio first, with adhkar added once its source is approved?

## 12. Final recommendation

Adopt a **Wahy-inspired glyph/page rendering architecture**, but implement it independently using officially sourced, licensed, edition-matched assets and data. Keep the app fully offline for Quran reading, use a bundled local database, and separate canonical text, Mushaf layout, audio metadata, and user data.

Do not begin by copying Wahy's SQLite schema or extracting its APK assets. Begin by obtaining and approving the correct source package, then build a renderer proof-of-concept and validate it before building the complete reader.


## 13. Owner-approved MVP decisions (2026-11-16)

- Target Mushaf: Madinah 1441H, Hafs 'an Asim. This remains subject to exact edition/source and offline redistribution-rights verification.
- Interaction: ayah-level selection only in MVP; word-level selection is deferred.
- Audio: one reciter in MVP; reciter selection and recording integration remain pending source, riwayah, segmentation, and offline-use permission checks.
- Audio delivery: user-initiated download to local app storage, then local playback.
- No mandatory cloud backend, Firebase, login, or runtime API for core Quran reading.
