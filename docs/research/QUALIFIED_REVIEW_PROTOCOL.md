# Independent 1441H Quran review protocol

**Prepared:** 2026-11-21 (Asia/Riyadh). This is a proposed release gate, not a completed review or religious approval. No reviewer has been appointed and no Quran assets have been obtained. The owner requires qualified review, provenance, exact 1441H edition, and verified ayah mapping [V0]. The Complex describes committee review of its **own** vector product; that review cannot be transferred to unrelated QCF4 files [V1, V2].

## Evidence

| ID | Source (access date) |
|---|---|
| V0 | [Approved MVP decisions](../decisions/APPROVED_MVP_DECISIONS_2026-11-16.md) (decision 2026-11-16), [content policy](../CONTENT_POLICY.md) (reviewed 2026-11-21). |
| V1 | [King Fahd Complex vector-page project](https://qurancomplex.gov.sa/mushaf-printing) (2026-11-21): publisher's documented page-to-original review for its specific product. |
| V2 | [QCF4 pinned README](https://github.com/MohamadHajjRabee/quran-qcf4/blob/5130511027e769f0a8f4eeb7f00f46bde3788d60/README.md) and [tree](https://api.github.com/repos/MohamadHajjRabee/quran-qcf4/git/trees/5130511027e769f0a8f4eeb7f00f46bde3788d60?recursive=1) (2026-11-21): candidate schema and page inventory, not independent validation. |
| V3 | [Quran Foundation page-layout guide](https://api-docs.quran.com/docs/tutorials/fonts/page-layout/) (2026-11-21): pages and ayah spans depend on the Mushaf dataset; technical caution only. |

## Reviewer qualifications and independence

The owner should appoint a lead reviewer qualified in Hafs 'an Asim recitation and Uthmani orthography, with experience checking printed/digital Mushaf editions, and a second independent checker with comparable expertise. The lead should be able to document relevant ijazah, formal Mushaf review appointment, or equivalent verifiable qualifications; the owner records credentials, affiliation and conflicts. A rights reviewer separately checks grants; engineers check software behavior. Neither code nor an LLM serves as a Quran reviewer [V0, V1].

## Materials to freeze before review

1. An authoritative, publisher-identified **1441H Hafs** reference copy with edition/revision details and permission to use it for comparison. If that reference is not obtained, do not begin a purported 1441H sign-off [V0, V1].
2. A candidate manifest naming each original file, source URL, retrieval date, version, rights evidence, SHA-256 and allowed transformation. Preserve original bytes separately from any derived test render; record renderer version, platform/device and configuration [V0, V2].
3. A review package that shows reference and candidate pages side by side, a page/line/ayah checklist, headings/Bismillah/ornament checklist, and an interaction overlay keyed to stable surah/ayah identifiers. Do not insert Quran text into review reports beyond secure, approved reference handling [V0, V2, V3].

## Review stages and acceptance evidence

| Stage | Human work and recorded result |
|---|---|
| Edition identity | Lead verifies publisher, colophon/version, Hafs identity and exact 604-page reference; owner accepts the named comparison artifact. Count alone is insufficient [V0–V2]. |
| Complete page comparison | Review **all 604 pages** at a fixed source version. Check page order, line breaks and arrangement, glyphs and diacritics, pause/sajdah and verse markers, headings, Bismillah handling, margins and ornaments against the reference. Record page-level pass/fail, reviewer, date and evidence pointer [V0–V2]. |
| Canonical and mapping audit | Independently verify every ayah identifier/boundary and its page/line occurrence, including any page-spanning cases; confirm every enabled tap region selects exactly the intended ayah and rejects headings/ornaments. Record coverage and exceptions; do not enable interaction on an unverified page [V0, V2, V3]. |
| Device rendering | Check representative Android/iOS sizes and pixel densities, clipping, RTL direction, page turning and zoom; then do a final human visual pass on the release build for all pages. Device sampling does not replace complete content review [V0–V2]. |
| Release sign-off | Lead and independent checker sign the frozen manifest and discrepancy log. Owner separately approves the content source, rights scope, technical suitability and release version. Any later asset/rendering change invalidates affected sign-off and triggers scoped repeat review [V0]. |

Automated checks should enumerate files, hashes, indices, counts, referential integrity, missing glyphs, region overlaps and render snapshots. They can locate errors but cannot establish religious correctness, source authority or scholarly approval [V0, V2].

## Discrepancy handling

Freeze and preserve the original source, affected output, hash, page and ayah identifier, device/renderer version, severity and screenshots. Disable affected interaction or hold the release; never silently change, normalize or regenerate canonical content. Ask the rights holder/source maintainer for a corrected, versioned original where needed. The qualified reviewers assess the revised artifact against the authoritative reference, document disposition, and re-sign affected pages and the manifest. Escalate unresolved differences to the owner; they remain blocking [V0–V2].

**Current state:** review materials unavailable; reviewers unnamed; no scholarly or owner approval recorded.
