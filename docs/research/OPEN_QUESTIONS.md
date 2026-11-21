# Open questions after Task 003 investigation

**Research date:** 2026-11-21. “Open” means no evidence or owner authorization was found in this audit; it is not an invitation to guess. No message was sent to an outside party.

## Source anchors (external pages retrieved 2026-11-21)

| ID | URL and relevance |
|---|---|
| Q1 | [Approved MVP decisions](../decisions/APPROVED_MVP_DECISIONS_2026-11-16.md), 2026-11-16; owner-selected target and release gates. |
| Q2 | [Pinned QCF4 README](https://github.com/MohamadHajjRabee/quran-qcf4/blob/5130511027e769f0a8f4eeb7f00f46bde3788d60/README.md), [license](https://github.com/MohamadHajjRabee/quran-qcf4/blob/5130511027e769f0a8f4eeb7f00f46bde3788d60/LICENSE.md), and [tree metadata](https://api.github.com/repos/MohamadHajjRabee/quran-qcf4/git/trees/5130511027e769f0a8f4eeb7f00f46bde3788d60?recursive=1). |
| Q3 | [King Fahd Complex vector-page project](https://qurancomplex.gov.sa/mushaf-printing) and [homepage](https://qurancomplex.gov.sa/): official candidate and current developer-platform status. |
| Q4 | [Quran Foundation font-rendering guide](https://api-docs.quran.com/docs/tutorials/fonts/font-rendering/), [page-layout guide](https://api-docs.quran.com/docs/tutorials/fonts/page-layout/), and [terms](https://api-docs.quran.com/legal/developer-terms/). |
| Q5 | [Tanzil text license](https://tanzil.net/docs/Text_License) and [download page](https://tanzil.net/download/). |
| Q6 | [Ahmad ElGharib's QCF4 announcement](https://t.me/quranfont/1539) ([readable context](https://t.me/s/quranfont/1537)): 47-font and 1441H claims plus naming/modification restrictions; not an official Complex grant. |

## Questions for the product owner

1. Which authoritative **1441H Hafs print reference** will be used for whole-page comparison, and who will qualify and sign the independent Quran review? The accessible Complex product page does not identify a 1441H reference [Q1, Q3; see OFFICIAL_1441_EDITION_EVIDENCE.md].
2. The recommended inquiry is to investigate the Complex's vector product and the GitHub QCF4 package as **separate** paths. Which, if either, will the owner authorize for a later acquisition/prototype after written rights and exact-edition evidence? No asset is selected [Q1–Q3, Q6; see RENDERER_SOURCE_DECISION.md].
3. What app distribution and commercial scope must permission cover (closed beta, public stores, free/paid, territories), and what attribution surface will the owner accept? These details affect the license request [Q1, Q2, Q3].
4. Is a separate, accessible Unicode text presentation in scope for the MVP if fixed-page glyphs/images cannot support large text or screen readers, or should that decision wait? It must never replace the approved primary page experience by assumption [Q1, Q4].

## Questions for source and rights holders

1. **King Fahd Complex:** Does its published vector-page product identify the same 1441H Hafs edition and exact pages as the repository? Its page posts a SHA-256 for its own Illustrator archive, but not a 1441H identifier. Are the named QCF4 and QBSML font binaries, ornaments, and any conversions/subsets licensed for bundling inside Android and iOS apps with no network connection? What are the official print colophon, source filenames, versions, notices, and checksums [Q2, Q3, Q6]?
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

## Current blockers and next evidence

**Task 003 result, 2026-11-21:** a source-and-rights dossier is recorded in [official edition evidence](OFFICIAL_1441_EDITION_EVIDENCE.md), [rights clearance](ASSET_RIGHTS_CLEARANCE.md), [draft requests](PERMISSION_REQUEST_DRAFTS.md), [source strategy](RENDERER_SOURCE_DECISION.md), and [review protocol](QUALIFIED_REVIEW_PROTOCOL.md). No rights holder was contacted and no assets were imported. The evidence does not establish an exact official 1441H reference, QCF4 font redistribution permission, complete JSON upstream provenance, or a qualified review sign-off [Q1–Q3, Q6].

1. Obtain the Complex's exact 1441H publication and comparison artifact, including edition/revision and verified checksum; establish whether its vector archive is that edition [Q1, Q3].
2. Obtain written rights for **each** required asset class and the exact offline Android/iOS, public-store and commercial scope. QCF4 fonts remain excluded from the repository's MIT grant [Q1–Q3, Q6].
3. Obtain the maintainer's generation history, original source IDs and hashes for pages, verse mapping, text fields, QBSML and chapter metadata; confirm all 604 pages against the official reference [Q2, Q3].
4. Appoint qualified independent reviewers and complete the protocol before content or production reader approval [Q1–Q3].
5. After the above, the owner may authorize a limited local feasibility prototype as a **separate** task. Current decision is **conditional go for inquiries; no-go for import and renderer implementation** [Q1–Q3].

No audio reciter is selected. Audio requires a separate recording-rights decision under [licensing matrix](LICENSING_MATRIX.md) [Q1, Q4].
