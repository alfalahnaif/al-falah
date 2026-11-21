# Source Approval Register

**Rule:** No source may be bundled into a release until its status is `APPROVED` and the owner has explicitly approved it.

**Task 003 assessment (2026-11-21):** The four gates below are independent. “Candidate” means worth investigating, not production-ready. No row has an owner approval. See the [official edition evidence](research/OFFICIAL_1441_EDITION_EVIDENCE.md), [rights clearance](research/ASSET_RIGHTS_CLEARANCE.md), [source decision](research/RENDERER_SOURCE_DECISION.md), and [qualified review protocol](research/QUALIFIED_REVIEW_PROTOCOL.md); those documents link each external source with the 2026-11-21 access date.

| Candidate / asset class | Technical suitability | License clearance | Content integrity | Owner approval |
|---|---|---|---|---|
| Exact 1441H official print reference | **Unverified:** no publisher-identified comparison artifact or edition record located | **Unverified:** comparison-copy acquisition/use terms needed | **Unreviewed:** exact pages not established | **Pending** |
| Complex Hafs Illustrator vector-page archive | **Candidate:** publisher posts a digital page product; 1441H identity and interaction mapping unknown | **Conditional published terms** for this product; offline embedding, conversions and commercial app scope require clarification | **Publisher review described for its product;** no independent Al-Falah edition match or sign-off | **Pending** |
| Pinned QCF4 pages/ and glyph/layout JSON | **Candidate:** 604 path inventory and documented page/line structure; actual page match and hit regions untested | **MIT for maintainer contribution; upstream source rights unverified** | **Unreviewed:** all 604 pages and text fields | **Pending** |
| Pinned QCF4 verses.json and font-map.json | **Candidate:** 6236 verse entries and 604 font mappings structurally inspected; semantic/cross-page accuracy unknown | **MIT for named files; underlying mapping provenance unverified** | **Unreviewed:** ayah boundaries and page/line mapping | **Pending** |
| Pinned QCF4 index.json and qbsml.json | **Candidate:** metadata and decoded glyph labels; exact upstream data and ornament placement unknown | **MIT for named files; Quran.com-derived metadata and glyph contributor rights unverified** | **Unreviewed** | **Pending** |
| QCF4 main TTF/WOFF2 family | **Candidate:** 47-file claim; no device or glyph-fidelity test | **Blocked:** expressly outside MIT; no written redistribution grant | **Unreviewed** | **Pending** |
| QBSML font and ornaments | **Candidate:** heading/ornament role documented; actual edition match unknown | **Blocked:** font outside MIT; original holder/derivative rights unclear | **Unreviewed** | **Pending** |
| Quran Foundation documented font/image route | **Unverified:** exact 1441H equivalence and hit data unknown | **Conditional** integrated-app grant with active account/credit for its own API/CDN files; does not cover GitHub QCF4 | **Unreviewed** | **Pending** |
| Tanzil canonical text route | **Unverified:** exact 1441H orthography/layout correspondence | **Conditional** on verbatim CC BY 3.0 notice/attribution | **Unreviewed** | **Pending** |

**Gate:** Until a candidate has a verified exact 1441H identity, complete rights for every used class, qualified content review, and explicit owner approval, its operational state is **NO-GO for import or reader implementation**. Written inquiries may proceed only when the owner authorizes sending the [draft requests](research/PERMISSION_REQUEST_DRAFTS.md). No request was sent.

| Content | Candidate | Status | Required next action |
|---|---|---|---|
| Quran text | Tanzil Project | PROPOSED — NOT APPROVED | Owner review exact text type/version, terms, attribution, validation |
| Quran metadata | Tanzil metadata / other exact source | NOT SELECTED | Verify source and mapping license |
| Quran chapter metadata | QCF4 index.json; README credits Quran.com-derived data | LICENSE_REVIEW — NOT APPROVED | Identify exact upstream dataset/version and applicable original terms |
| Quran font | QCF4 repository fonts are a candidate, not selected | LICENSE_REVIEW — NOT APPROVED | Obtain original rights-holder permission for exact TTF/WOFF2 files and offline Android/iOS distribution |
| Quran page/layout JSON | QCF4 repository, pinned commit 5130511027e769f0a8f4eeb7f00f46bde3788d60 | LICENSE_REVIEW — NOT APPROVED | Verify original provenance, 1441H edition match, source rights, and independent review |
| Quran verse/page/line mapping | QCF4 verses.json, same pinned commit | LICENSE_REVIEW — NOT APPROVED | Verify underlying mapping rights, all boundaries, and page-spanning cases |
| QBSML font and ornaments | QCF4 repository candidate, not selected | LICENSE_REVIEW — NOT APPROVED | Obtain separate font/ornament rights and verify official edition placement |
| Official Mushaf page art | King Fahd Complex vector-page product, exact edition not established | PROPOSED — NOT APPROVED | Confirm 1441H identity, applicable published terms for the exact offline app use, checksum, and hit-region source |
| Translation | QuranEnc candidate | PROPOSED — NOT APPROVED | Select exact translator/version and review terms |
| Tafsir | None | NOT SELECTED | Identify exact edition, rights, qualified review |
| Adhkar | None | NOT SELECTED | Identify source edition, references, rights, review |
| Hadith | None | NOT SELECTED | Identify collection/edition, grading references, rights, review |
| Audio recitations | None | NOT SELECTED | Identify rights holder and offline redistribution permission |

## Tanzil candidate notes
Official terms: https://tanzil.net/docs/Text_License  
Download: https://tanzil.net/download/

Published terms allow verbatim distribution, prohibit changing the text, require clear source attribution and a link to Tanzil, and require the copyright notice in copies and substantial derived files. The download page identifies Version 1.1 (February 2021); check the official page for updates before release.

This is a candidate only. It is not owner-approved for this project yet.

## QCF4 and official-art candidate notes (researched 2026-11-21)

The [pinned QCF4 README](https://github.com/MohamadHajjRabee/quran-qcf4/blob/5130511027e769f0a8f4eeb7f00f46bde3788d60/README.md) claims a 1441H Hafs package. A [Git tree metadata check](https://api.github.com/repos/MohamadHajjRabee/quran-qcf4/git/trees/5130511027e769f0a8f4eeb7f00f46bde3788d60?recursive=1) found 604 numbered page JSON paths. This establishes file inventory only, not edition accuracy, Quran text correctness, or permission. The [repository license](https://github.com/MohamadHajjRabee/quran-qcf4/blob/5130511027e769f0a8f4eeb7f00f46bde3788d60/LICENSE.md) names the JSON/schema files under MIT and explicitly excludes all font files from that grant.

The [King Fahd Complex's vector-page project](https://qurancomplex.gov.sa/mushaf-printing) publishes computer-use terms for its own digital page product. Its exact edition and relationship to the GitHub QCF4 package remain unverified. See [Task 002 audit](research/QURAN_1441_SOURCE_AUDIT.md) and [licensing matrix](research/LICENSING_MATRIX.md). No candidate is approved or bundled.
