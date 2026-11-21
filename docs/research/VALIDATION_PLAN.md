# 1441H source and reader validation plan

**Research date:** 2026-11-21. This is a proposed plan for later, permission-cleared work. No Quran dataset, font, image, or recitation was downloaded or tested in Task 002. Expected totals are acceptance checks, never proof of religious or edition correctness [V1].

## Sources (external pages retrieved 2026-11-21)

| ID | URL and relevance |
|---|---|
| V1 | [Approved MVP decisions](../decisions/APPROVED_MVP_DECISIONS_2026-11-16.md), 2026-11-16; [content policy](../CONTENT_POLICY.md); [testing policy](../TESTING.md): owner gates and human review. |
| V2 | [Pinned QCF4 README](https://github.com/MohamadHajjRabee/quran-qcf4/blob/5130511027e769f0a8f4eeb7f00f46bde3788d60/README.md), [license](https://github.com/MohamadHajjRabee/quran-qcf4/blob/5130511027e769f0a8f4eeb7f00f46bde3788d60/LICENSE.md), and [tree metadata](https://api.github.com/repos/MohamadHajjRabee/quran-qcf4/git/trees/5130511027e769f0a8f4eeb7f00f46bde3788d60?recursive=1): documented counts/types and pinned inventory. |
| V3 | [Quran Foundation font-rendering](https://api-docs.quran.com/docs/tutorials/fonts/font-rendering/) and [page-layout](https://api-docs.quran.com/docs/tutorials/fonts/page-layout/) guides: cross-verse lines, special headings, page-spanning verses, and scale cautions. These are not certification of V2's edition. |
| V4 | [King Fahd Complex vector-page project](https://qurancomplex.gov.sa/mushaf-printing): potential official print reference, subject to exact edition confirmation. |
| V5 | [Flutter accessibility guidance](https://docs.flutter.dev/ui/accessibility) and [custom-font guidance](https://docs.flutter.dev/cookbook/design/fonts): later device and semantics checks. |

## Gate 0 — rights and provenance before acquisition

The product owner must approve the exact source/edition, asset classes, terms, attribution, allowed transformations, and reviewer plan. Obtain a rights statement for the specific QCF4/QBSML fonts, ornaments, text, mapping, and reference pages. If a source cannot satisfy these items, do not import it [V1, V2, V4].

For each approved original file, record source URL/bibliographic identity, publisher, commit or edition/version, acquisition date, exact byte length, SHA-256, license evidence, required notices, reviewer, and approval date. Preserve original bytes separately from any derived package. A Git commit SHA identifies repository state; it is **not** a SHA-256 checksum for each content file [V1, V2].

## Gate 1 — structural validation after approved acquisition

| Check | Proposed automated assertion | Human/reference check |
|---|---|---|
| Page coverage | Exactly 604 unique numbered page records, contiguous 1–604; each source file's declared page equals its filename; no missing/extra page [V1, V2]. | Confirm the selected 1441H reference has these page boundaries [V1, V4]. |
| Surah/ayah identity | Exactly 114 unique surah IDs and an expected 6236 unique ayah keys, with no duplicates, gaps, or out-of-range IDs. Compare per-surah counts with an approved independent reference [V1, V2]. | Qualified reviewer signs off on identity/count convention; count alone proves nothing [V1]. |
| Page and line order | All item references point to existing pages/lines; line numbers and item order are monotonic within each page; shared lines may contain multiple ayahs [V2, V3]. | Compare every page's actual line breaks and special slots with exact-edition art [V1, V4]. |
| Verse spans | Rebuild every ayah's list of page/line segments from individual items. Verify cross-line segments and detect any cross-page segment; compare against verses.json rather than trusting its single-page example [V2, V3]. | Inspect all detected boundary cases against the reference [V1, V4]. |
| Ayah boundaries | Every word/end item maps to a valid ayah; positions do not duplicate unexpectedly; end markers are placed correctly, with no guessed boundaries [V2]. | Qualified reviewer checks boundary and marker placement [V1]. |
| Font mapping | Every page resolves to an existing, approved font; every referenced codepoint renders in that font; QBSML references use the approved QBSML file. Hash actual font files [V2]. | Compare glyph forms, diacritics, pause signs, verse ends, and visual spacing to the 1441H reference [V1, V4]. |
| Headers/ornaments | Inventory surah headers, Bismillah items, quarter-hizb and juz/hizb markers, and opening ornaments. Flag absent/unexpected/duplicate entries; test known exception categories against the approved edition rather than silently inserting them [V2, V3]. | Review all special-page cases and any discrepancy [V1, V4]. |
| Canonical text | Byte/codepoint-preserving container parse; immutable canonical field; no normalization, substitution, reordering, or generated fallback. Compare exact source hashes and independently approved text [V1]. | Qualified Quran reviewer compares text/marks and signs; automated checks cannot certify correctness [V1]. |

The 604, 114, and 6236 figures are **validation expectations** from the approved target and repository claim, not a statement that the QCF4 contents passed. The 15-line/8-line examples in Foundation documentation belong to its Mushaf models and must not be imposed on the 1441H candidate without a reference match [V1–V3].

## Gate 2 — renderer and touch proof of concept

Only after Gate 0, build a local-only prototype with a small owner-approved representative subset. Include opening pages, ordinary pages, a surah heading and Bismillah exception, a line containing multiple ayahs, an ayah spanning lines, a detected page-boundary case if present, and juz/hizb markers [V1–V4]. Record each selected reference page and why it was selected.

Compare rendered screenshots with the exact reference at a fixed page coordinate system. Measure text baselines, glyph spacing, headings, ornaments, and margins; log every discrepancy without altering source content. On Android and iOS, test different aspect ratios, pixel densities, safe areas, landscape, zoom, RTL page order, and font scaling. At large accessibility scales, document any conflict between faithful page geometry and readable text; do not silently reflow the primary Mushaf page [V1, V3, V5].

For ayah touch, derive on-screen hit boxes only from actually rendered, verse-key-linked elements or an independently validated region map. Transform between page coordinates and viewport coordinates at every zoom and orientation. Test first/last word, adjacent ayahs on one line, cross-line/page ayahs, headers, ornaments, margins, and taps in empty space. The expected result must be a stable surah:ayah key or no selection. Word-level selection stays outside MVP [V1, V2].

## Gate 3 — whole-set and release review

- Generate structural and visual-regression reports for all 604 pages and retain per-page results. A change to any font, data file, layout algorithm, or scale transform invalidates affected baselines [V1, V2, V4].
- Have qualified independent Quran reviewer(s) inspect the entire approved corpus and all 604 rendered pages against the authoritative edition, recording reviewer identity, review date, discrepancy disposition, and approval scope. Preserve discrepant originals; do not auto-correct [V1].
- Test airplane-mode first launch and page navigation after installation; verify no runtime API, font CDN, authentication, or network fallback. Test missing/corrupt manifest as a visible safe failure, not a substitute edition [V1].
- Confirm package and installed size, startup memory, page-turn latency, font-load behavior, screen-reader semantics, zoom/large-text behavior, and Android/iOS builds on representative devices [V1, V5].
- Before release, independently review license notices and attribution in the app, original file SHA-256 manifest, owner authorization, and any source-specific update obligations [V1; see LICENSING_MATRIX.md].

No test in this plan was executed in Task 002.
