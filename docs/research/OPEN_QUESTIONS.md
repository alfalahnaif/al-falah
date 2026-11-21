# Open questions and proposed Task 003

**Research date:** 2026-11-21. “Open” means no evidence or owner authorization was found in this audit; it is not an invitation to guess. No message was sent to an outside party.

## Source anchors (external pages retrieved 2026-11-21)

| ID | URL and relevance |
|---|---|
| Q1 | [Approved MVP decisions](../decisions/APPROVED_MVP_DECISIONS_2026-11-16.md), 2026-11-16; owner-selected target and release gates. |
| Q2 | [Pinned QCF4 README](https://github.com/MohamadHajjRabee/quran-qcf4/blob/5130511027e769f0a8f4eeb7f00f46bde3788d60/README.md), [license](https://github.com/MohamadHajjRabee/quran-qcf4/blob/5130511027e769f0a8f4eeb7f00f46bde3788d60/LICENSE.md), and [tree metadata](https://api.github.com/repos/MohamadHajjRabee/quran-qcf4/git/trees/5130511027e769f0a8f4eeb7f00f46bde3788d60?recursive=1). |
| Q3 | [King Fahd Complex vector-page project](https://qurancomplex.gov.sa/mushaf-printing) and [homepage](https://qurancomplex.gov.sa/): official candidate and current developer-platform status. |
| Q4 | [Quran Foundation font-rendering guide](https://api-docs.quran.com/docs/tutorials/fonts/font-rendering/), [page-layout guide](https://api-docs.quran.com/docs/tutorials/fonts/page-layout/), and [terms](https://api-docs.quran.com/legal/developer-terms/). |
| Q5 | [Tanzil text license](https://tanzil.net/docs/Text_License) and [download page](https://tanzil.net/download/). |

## Questions for the product owner

1. Which authoritative **1441H Hafs print reference** will be used for whole-page comparison, and who will qualify and sign the independent Quran review? The target is selected, but source identity and review remain mandatory [Q1, Q3].
2. Should the team request rights for the GitHub QCF4 fonts and JSON, the Complex's separate vector-page product, or both as parallel candidates? This audit does not select either source [Q1–Q3].
3. What app distribution and commercial scope must permission cover (closed beta, public stores, free/paid, territories), and what attribution surface will the owner accept? These details affect the license request [Q1, Q2, Q3].
4. Is a separate, accessible Unicode text presentation in scope for the MVP if fixed-page glyphs/images cannot support large text or screen readers, or should that decision wait? It must never replace the approved primary page experience by assumption [Q1, Q4].

## Questions for source and rights holders

1. **King Fahd Complex:** Does its published vector-page product identify the same 1441H Hafs edition and exact pages as the repository? Are the named QCF4 and QBSML font binaries, ornaments, and any conversions/subsets licensed for bundling inside Android and iOS apps with no network connection? What are the official source filenames, versions, notices, and checksums [Q2, Q3]?
2. **QCF4 maintainer:** What original files and method generated pages/, verses.json, font-map.json, qbsml.json, and each text field? Which source edition and review records support the 1441H claim? Can the maintainer document the original font-rights chain and all upstream metadata sources? Are there known mapping/heading/page errors [Q2]?
3. **Quran Foundation, if considered:** Do its particular font/image files identify the exact 1441H edition? What is required for an active developer account and integrated offline bundling, and would any text/metadata route meet Al-Falah's offline-after-install policy without an unacceptable runtime dependency [Q4, Q1]?
4. **Tanzil, if considered:** Which exact text release/type would be proposed, and how would its unchanged code points be independently verified against the 1441H source and glyph rendering? Its license does not settle edition identity [Q5, Q1].

## Technical unknowns to resolve with a permission-cleared snapshot

- Does every page JSON record actually match the README schema, and do all 604 pages map to existing font files and glyphs [Q2]?
- Does verses.json represent an ayah that spans two pages, or only its starting page? The published example uses one page field; Foundation warns such spans can occur in some Mushafs [Q2, Q4].
- What coordinate system, page dimensions, line baselines, and validated ayah regions exist, if any? The README gives order and line numbers but not exact touch rectangles [Q2].
- How are Bismillah exceptions, surah headings split across pages, juz/hizb labels, verse-end markers, and ornaments encoded in this **specific** 1441H package [Q2, Q4]?
- Are Quran Foundation's “QCF V4 Tajweed” and the repository's “QCF4” related at all beyond naming? Do not combine their mappings without direct evidence [Q2, Q4].
- What are the measured Android/iOS binary size, memory, font-loading, visual, and accessibility costs after the exact licensed assets are known [Q2, Q4]?

## Proposed Task 003: source and rights closure

**Objective:** establish a reviewable, owner-approved source dossier before any reader or asset implementation. This does not change the 1441H decision [Q1].

**Acceptance criteria:**

1. A named official 1441H Hafs reference edition, its 604-page identity, and the exact comparison artifact are documented with source, version, retrieval date, required notices, and checksum. If unavailable, record the blocker rather than substituting another edition [Q1, Q3].
2. Separate permission evidence covers canonical text, page/layout JSON, verse mapping, each main font, QBSML/ornaments, and any page art or derived hit regions for offline Android/iOS distribution. The owner accepts the scope and attribution. If any required class lacks permission, no import occurs [Q1–Q3].
3. The QCF4 maintainer's generation/provenance account and upstream metadata rights are recorded, including the pinned commit and original file SHA-256 values after authorized acquisition. Unresolved discrepancies remain visible [Q2].
4. A qualified independent Quran reviewer and exact review protocol are named. Automated counts or a repository README are not treated as religious approval [Q1].
5. The owner chooses whether a small, local-only renderer feasibility prototype is authorized as a **subsequent** task, with its allowed sample pages/assets and acceptance criteria. If rights or reference identity remain unresolved, Task 003 ends with a documented No-Go for import and implementation [Q1–Q4].

No audio reciter is selected by Task 003. Audio requires a separate recording-rights decision under [licensing matrix](LICENSING_MATRIX.md) [Q1, Q4].
