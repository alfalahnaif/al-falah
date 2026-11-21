# Quran 1441H source audit

**Research date:** 2026-11-21 (Asia/Riyadh). **Scope:** public documentation, repository tree metadata, and read-only structural inspection of index.json, verses.json, and font-map.json in memory. No page JSON, Quran text, font, page image, or audio file was downloaded, copied into this repository, or validated. The approved product target is Madinah Mushaf 1441H, Hafs, 604 pages, one page at a time, with ayah-level interaction and offline reading [P1].

## Executive finding

**Conditional Go for a permission-gated feasibility study; No-Go for asset import or reader implementation now.** The QCF4 repository provides a plausible page/line/word data model and a 604-file page inventory. Its 1441H identity is an author claim, not an independently established edition match. The repository's MIT grant expressly excludes its font files. No verified, edition-matched reference pages, complete provenance chain, font redistribution permission, or qualified content review is recorded [R1–R4]. The official Complex's vector-page project is a separate candidate with published computer-use terms; its relationship to this QCF4 package and the target edition has not been shown [R5].

## Evidence register

All external sources below were retrieved on **2026-11-21**. File counts and byte totals are our calculations from the GitHub tree metadata at the pinned commit; they do not inspect or validate file contents.

| ID | Source and verifiable detail |
|---|---|
| P1 | Local owner decision: [Approved MVP decisions](../decisions/APPROVED_MVP_DECISIONS_2026-11-16.md), dated 2026-11-16; target and release gates. |
| R1 | [QCF4 README at pinned commit](https://github.com/MohamadHajjRabee/quran-qcf4/blob/5130511027e769f0a8f4eeb7f00f46bde3788d60/README.md): author claims 1441H Hafs, 604 pages, 47 main fonts plus QBSML, schema examples, 114 chapters/6236 verses, and third-party metadata credit. |
| R2 | [QCF4 license at pinned commit](https://github.com/MohamadHajjRabee/quran-qcf4/blob/5130511027e769f0a8f4eeb7f00f46bde3788d60/LICENSE.md): MIT is assigned to named JSON/schema files; fonts/ and fonts-woff2/ are excluded and require original rights-holder permission for redistribution, modification, or commercial use. |
| R3 | [Pinned commit](https://github.com/MohamadHajjRabee/quran-qcf4/commit/5130511027e769f0a8f4eeb7f00f46bde3788d60) and [recursive Git tree metadata](https://api.github.com/repos/MohamadHajjRabee/quran-qcf4/git/trees/5130511027e769f0a8f4eeb7f00f46bde3788d60?recursive=1). Git ls-remote and GitHub API both identified main as SHA 5130511027e769f0a8f4eeb7f00f46bde3788d60. Tree was not truncated: 604 files pages/001.json through pages/604.json, 48 TTF files, 48 WOFF2 files. JSON blobs total 21,204,468 bytes; TTF blobs 96,983,720 bytes; WOFF2 blobs 37,383,488 bytes. |
| R4 | [QCF4 package manifest at pinned commit](https://github.com/MohamadHajjRabee/quran-qcf4/blob/5130511027e769f0a8f4eeb7f00f46bde3788d60/package.json): package version 1.1.0, author Mohamad Hajj Rabee, license field points to LICENSE.md. README's index example says schema_version 1.0.0; these are different version identifiers. |
| R4a | Read-only structural inspection of pinned [index.json](https://raw.githubusercontent.com/MohamadHajjRabee/quran-qcf4/5130511027e769f0a8f4eeb7f00f46bde3788d60/index.json), [verses.json](https://raw.githubusercontent.com/MohamadHajjRabee/quran-qcf4/5130511027e769f0a8f4eeb7f00f46bde3788d60/verses.json), and [font-map.json](https://raw.githubusercontent.com/MohamadHajjRabee/quran-qcf4/5130511027e769f0a8f4eeb7f00f46bde3788d60/font-map.json): 114 chapter records, 6236 verse-key properties, 604 page-font properties and 47 distinct font names. All verse index values expose a scalar page and lines; line segments expose line, word_start, word_end. No text values or source files were saved. |
| R5 | [King Fahd Complex vector-page project and rights](https://qurancomplex.gov.sa/mushaf-printing): describes a reviewed digital vector Mushaf and permits the described Illustrator-format copy in computer applications, among other uses. It does not identify the QCF4 repository's files or establish their font rights. [Current Complex homepage](https://qurancomplex.gov.sa/) lists the developer platform as coming soon; the supplied [quran-dev URL](https://qurancomplex.gov.sa/quran-dev/) returned 404 during this audit. |
| R6 | [Quran Foundation font-rendering guide](https://api-docs.quran.com/docs/tutorials/fonts/font-rendering/): distinguishes QCF glyph and Unicode rendering, groups words by page/line, and describes separate heading slots. Its QCF V4 Tajweed label is not proof of equivalence to this repository's QCF4 files. |
| R7 | [Quran Foundation page-layout guide](https://api-docs.quran.com/docs/tutorials/fonts/page-layout/): describes edition-specific pagination and warns that verses can span pages. It is technical reference material, not a 1441H certification for R1. |
| R8 | [Quran Foundation developer terms](https://api-docs.quran.com/legal/developer-terms/), marked updated 2026-11-20: Content Sync and bundling restrictions, conditional in-app font/image bundling, and conditional end-user audio downloads. These terms govern Foundation resources, not the QCF4 repository by default. |
| R9 | [Tanzil text license](https://tanzil.net/docs/Text_License) and [download page](https://tanzil.net/download/): CC BY 3.0 notice, verbatim-copy requirement, attribution/link, version 1.1 (February 2021). No 1441H layout match is established. |

## What was verified, claimed, and not verified

| Topic | Status | Evidence and limit |
|---|---|---|
| Repository identity | **Verified metadata** | Main SHA, package version, and file inventory were checked using GitHub metadata [R3, R4]. No source assets were acquired. |
| 1441H Hafs edition | **Repository claim** | README names it; no official cross-reference, source manifest, production record, or independent side-by-side page comparison was found [R1, R5]. |
| 604 page files | **Verified inventory, not layout** | 604 correctly numbered JSON paths appear in the non-truncated tree [R3]. The JSON contents, page boundaries, and line positions were not checked. |
| 114 surahs and 6236 ayahs | **Verified index counts; validation target** | In-memory index inspection counted 114 chapter records and 6236 verse-key properties [R4a]. Their identities, text, and boundaries were not independently validated. |
| Font-to-page relationship | **Verified index counts; mapping not validated** | font-map.json has 604 properties with 47 distinct font names [R4a]. The actual font files' glyph coverage and page-faithfulness were not audited [R1, R3]. |
| Text provenance | **Unresolved** | README credits Quran.com for chapter metadata but does not give an original Quran text edition, extraction method, source checksums, or qualified reviewer record [R1]. |
| Official Complex materials | **Separate candidate** | The Complex publishes terms for a vector-page product; there is no demonstrated identity or rights bridge to R1's JSON/fonts [R5]. |

## Edition verification gates

1. Obtain a dated, authoritative reference for the exact 1441H Hafs print edition and its page artwork, line layout, headings, Bismillah treatment, ornaments, and font identity. Ask the Complex to identify whether its published vector product is that exact edition [R5, P1].
2. Ask the QCF4 maintainer for the original sources and generation method for pages, verse mapping, glyph mapping, and text; obtain any source checksums and a correction/version history [R1–R4].
3. Under an owner-approved rights and review plan, compare every generated page with the official reference. A matching count or sample screenshot alone does not establish edition identity [P1, R1, R5].
4. Do not mix Quran Foundation's QCF V4 Tajweed / code_v2 data with R1's QCF4 fonts merely because both use “V4”; their equivalence is not documented [R1, R6].

## Discrepancies and limits

- All 6236 inspected verses.json records have a single scalar page field, and their line segments have no page field. R7 describes verses spanning pages in some Mushafs. This is a **schema risk**, not proof of a defect in this 1441H data; per-page word records may cover it, but no page JSON was checked [R4a, R7].
- R1's word-type table says a Bismillah item uses a main QCF4 font, while its later QBSML section says QBSML is used for Bismillah. Resolve this documentation inconsistency against actual approved files and the print reference [R1].
- R1 documents page and line grouping but no per-word or per-ayah physical coordinates, page dimensions, or verified touch regions. Word IDs alone do not prove accurate hit-testing [R1].
- R1 credits third-party chapter metadata while R2 applies an MIT grant to index.json. The original metadata rights and any Foundation restrictions require separate verification [R1, R2, R8].
- The current Complex site and the supplied legacy developer URL differ in availability. Neither supplies a direct QCF4-to-1441H certification in this audit [R5].

## Recommendation and owner gates

Proceed only with permission requests and a narrowly scoped, local-only proof of concept **after** the owner accepts the exact source and rights plan. Do not import any candidate into app assets yet. The blocking items are exact edition linkage, rights for all fonts and ornaments, provenance of text/mappings/metadata, verified ayah touch mapping, and qualified independent Quran review [P1, R1–R8]. See [licensing](LICENSING_MATRIX.md), [data model](QCF4_DATA_MODEL.md), [rendering options](MUSHAF_RENDERING_OPTIONS.md), [validation](VALIDATION_PLAN.md), and [open questions](OPEN_QUESTIONS.md).
