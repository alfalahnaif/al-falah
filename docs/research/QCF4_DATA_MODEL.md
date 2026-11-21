# QCF4 candidate data model

**Research date:** 2026-11-21. This is a schema audit of published documentation, GitHub tree metadata, and in-memory structural inspection of three JSON indexes, not a Quran content audit. No page JSON, font, or Quran text was imported or verified. The candidate is pinned to [commit 5130511027e769f0a8f4eeb7f00f46bde3788d60](https://github.com/MohamadHajjRabee/quran-qcf4/commit/5130511027e769f0a8f4eeb7f00f46bde3788d60) [S1, S2].

## Sources (all retrieved 2026-11-21)

| ID | URL and use |
|---|---|
| S1 | [Pinned README](https://github.com/MohamadHajjRabee/quran-qcf4/blob/5130511027e769f0a8f4eeb7f00f46bde3788d60/README.md): example structures and type descriptions. These are maintainer claims, not checks of every JSON row. |
| S2 | [Pinned Git tree metadata](https://api.github.com/repos/MohamadHajjRabee/quran-qcf4/git/trees/5130511027e769f0a8f4eeb7f00f46bde3788d60?recursive=1) and [package manifest](https://github.com/MohamadHajjRabee/quran-qcf4/blob/5130511027e769f0a8f4eeb7f00f46bde3788d60/package.json): file inventory, package version 1.1.0. |
| S2a | Read-only structural inspection of pinned [index.json](https://raw.githubusercontent.com/MohamadHajjRabee/quran-qcf4/5130511027e769f0a8f4eeb7f00f46bde3788d60/index.json), [verses.json](https://raw.githubusercontent.com/MohamadHajjRabee/quran-qcf4/5130511027e769f0a8f4eeb7f00f46bde3788d60/verses.json), and [font-map.json](https://raw.githubusercontent.com/MohamadHajjRabee/quran-qcf4/5130511027e769f0a8f4eeb7f00f46bde3788d60/font-map.json): keys, types, counts only; no content fields saved. |
| S3 | [Pinned license](https://github.com/MohamadHajjRabee/quran-qcf4/blob/5130511027e769f0a8f4eeb7f00f46bde3788d60/LICENSE.md): stated scope of JSON MIT terms and font exclusion. |
| S4 | [Quran Foundation font-rendering guide](https://api-docs.quran.com/docs/tutorials/fonts/font-rendering/) and [page-layout guide](https://api-docs.quran.com/docs/tutorials/fonts/page-layout/): independent design cautions about line grouping, headings, and page-spanning verses. They describe Foundation datasets, not this candidate's correctness. |
| S5 | [Approved MVP decisions](../decisions/APPROVED_MVP_DECISIONS_2026-11-16.md), 2026-11-16: 1441H target and ayah-level MVP. |

## Inventory and version

The non-truncated pinned Git tree contains 604 numbered files under pages/, 48 TTFs under fonts/, 48 WOFF2s under fonts-woff2/, and the root JSON files index.json, verses.json, font-map.json, and qbsml.json [S2]. The README describes 47 main QCF4 font files plus one QBSML font in each format [S1]. Package version 1.1.0 and the README's index schema_version example 1.0.0 are different identifiers; neither is a source-content checksum [S1, S2].

The inspected index.json has schema_version 1.0.0 in meta and 114 chapter records. verses.json has 6236 verse-key properties: all records expose page and lines; page is a scalar integer; each line segment exposes line, word_start, and word_end. Per-verse segment counts range from 1 to 15. font-map.json has 604 page properties (1 through 604) using 47 distinct main font names. These are structural observations, not validation of the underlying page records or religious content [S2a].

## Documented records

| Record | Published fields or role | What is not established |
|---|---|---|
| pages/NNN.json | Page number, page font, a surahs array, and ordered lines; each line has a line number and words array [S1]. | Exact page dimensions, margins, line baselines, every page's line count, and official print correspondence. |
| Word-like item | Glyph code/character, font, text label, type. Items of type word and end are documented with verse_key and position [S1]. | Whether every item has all keys, whether position is globally unique, exact glyph bounding boxes, or canonical-text provenance. |
| surahs entry | Surah ID/name and verse_start/verse_end for that page's section in the README example [S1]. | Whether entries cover every partial surah and page boundary correctly. |
| verses.json | Actual 6236 records use one scalar page and lines with word_start/word_end [S2a]. | Whether a verse crossing a page is represented correctly, or whether all keys are semantically correct. |
| font-map.json | Actual 604 page entries and 47 distinct font names [S2a]. | Whether every referenced glyph exists in the mapped font and all font files are rights-cleared. |
| index.json | Actual 114 chapter records and schema_version 1.0.0; README example fields include chapter ID, verse count, page interval, bismillah_pre, and names [S1, S2a]. | Canonical source, exact edition of chapter metadata, semantic completeness, and permission from underlying source. |
| qbsml.json | Decoded QBSML glyph sets, codepoints, names, and metric examples; README claims 7 sets including surah/juz headings and ornaments [S1]. | Original glyph rights, exact layout/placement of ornaments, or proof that all decoded labels match the print edition. |

## Headers, markers, and ayah identity

The README lists item types word, end, surah_header, bismillah, and quarter. It documents surah_header as linked to a surah ID and the QBSML font, bismillah as a distinct item, end as a verse-end marker with verse_key, and quarter as a quarter-hizb marker. The QBSML set is described as including surah and juz labels and opening ornaments [S1]. **This is a representation description, not a verified inventory:** full juz/hizb placement, marker order, ornament geometry, and Bismillah exceptions remain to be checked against an approved reference [S1, S5].

The README is internally inconsistent about the Bismillah font: its word-type table names a main QCF4 font, while its QBSML section says that font handles Bismillah. Do not resolve this by assumption; inspect the authorized source records and compare them with the official page [S1, S5].

The intended stable ayah key is verse_key, with position for items within an ayah; the end item can mark an ayah boundary. A line can contain items from more than one ayah, so a renderer cannot treat line identity as ayah identity [S1, S4]. Quran Foundation's guide explicitly warns that verses may span pages in some Mushafs. The inspected verses.json has only one scalar page per ayah and no page field in line segments; cross-page behavior must therefore be tested against actual page records rather than assumed sufficient [S2a, S4].

## Ayah-level touch feasibility

**Insufficient evidence for production touch mapping.** The candidate describes an ordered sequence of glyph items but publishes no x/y hit regions or page coordinate system in its README [S1]. A future renderer could associate its own measured glyph boxes with verse_key, group boxes by ayah, and reject taps on non-ayah items; this is an engineering hypothesis, not validated hit data. It requires exact edition-matched rendering, device-scale tests, and independent review before enabling ayah actions [S5]. Word-level selection is deferred in the MVP [S5].

## Proposed read-only local model, pending approval

This is a **design proposal**, not an import or schema migration:

1. A content manifest records source URL, pinned commit, original per-file SHA-256, edition ID, permissions, attribution, reviewer, and allowed transformations. Keep the original bytes in a controlled provenance archive; no transformation is approved yet [S3, S5].
2. Immutable read-only records separate canonical verse text, page/line/glyph placement, font mapping, and headings/ornaments. A glyph item references a stable surah/ayah key and its exact source record. Never derive canonical text by joining glyph labels [S1, S5].
3. If owners approve conversion, parse the container only and preserve canonical Quran code points exactly. Record source-to-local identifiers and hashes so every local row is traceable; do not normalize, correct, or regenerate text [S5; see also ../CONTENT_POLICY.md].
4. Keep user bookmarks and reading position in a different writable store, as required by [architecture](../ARCHITECTURE.md). Missing or invalid manifest data must fail safely, without substituting another edition or generated text.

## Required dataset checks before use

After source and permission approval, verify every page and every referenced font, all verse_key/position/end relationships, missing/duplicate keys, line order, headings/Bismillah exceptions, and ayahs spanning lines or pages. Independently compare the rendered layout with an authoritative 1441H reference; the 604/114/6236 expected totals are only structural gates [S1, S4, S5]. See [validation plan](VALIDATION_PLAN.md).
