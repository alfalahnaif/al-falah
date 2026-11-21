# Renderer source decision — source strategy only

**Date:** 2026-11-21 (Asia/Riyadh). **Decision state:** no renderer asset selected; no implementation authorized. The owner-approved target remains 1441H Hafs, 604 pages, one page at a time, horizontal turning and ayah-level interaction [D0].

## Evidence (accessed 2026-11-21 unless local)

| ID | Source |
|---|---|
| D0 | [Approved MVP decisions](../decisions/APPROVED_MVP_DECISIONS_2026-11-16.md), 2026-11-16. |
| D1 | [King Fahd Complex vector-page product](https://qurancomplex.gov.sa/mushaf-printing): separate reviewed Illustrator asset and published computer-application use rights; exact 1441H identity unstated. |
| D2 | [QCF4 pinned README](https://github.com/MohamadHajjRabee/quran-qcf4/blob/5130511027e769f0a8f4eeb7f00f46bde3788d60/README.md) and [license](https://github.com/MohamadHajjRabee/quran-qcf4/blob/5130511027e769f0a8f4eeb7f00f46bde3788d60/LICENSE.md): page/line/glyph schema and MIT JSON claim; font redistribution excluded. |
| D3 | [Ahmad ElGharib QCF4 announcement](https://t.me/quranfont/1539) ([context](https://t.me/s/quranfont/1537)): 47-font lineage claim and restrictions. |
| D4 | [Quran Foundation developer terms](https://api-docs.quran.com/legal/developer-terms/) (updated 2026-11-20), [font guide](https://api-docs.quran.com/docs/tutorials/fonts/font-rendering/) and [page layout guide](https://api-docs.quran.com/docs/tutorials/fonts/page-layout/): conditional integrated font/image bundling, text sync terms, distinct renderer models, and page-spanning caution. |

## Candidate comparison

| Source strategy | What is attractive | Blocking facts / tests | Current judgment |
|---|---|---|---|
| **Official Complex page artwork** as fixed visual reference and possible display source | Publisher posts a reviewed vector product, an archive checksum, and broad use terms for that particular product [D1]. Fixed pages could preserve visual layout if it is the exact target edition. | Complex must confirm 1441H identity, offline/mobile/commercial/conversion scope and required notices. Page art alone has no verified ayah hit regions or accessible canonical text; independently sourced, edition-matched mappings are needed [D0, D1]. | **First rights/identity inquiry. Conditional candidate, not selected.** |
| **QCF4 47-font glyph pages plus pinned JSON** | Repository supplies a plausible 604-page inventory, page/line/word structure and verse keys [D2]. | Font binaries are excluded from MIT, underlying text/metadata provenance is incomplete, all pages have not been compared, heading/Bismillah documentation conflicts, and no validated tap coordinates are supplied [D2, D3]. | **No-go for bundling now. Reconsider only after explicit rights and source review.** |
| **Officially licensed font with verified page layout** | Could provide scalable text and separate semantic ayah identifiers if the exact 1441H layout and text are licensed. The Complex lists its Unicode computer fonts, but details are marked coming soon [Complex home](https://qurancomplex.gov.sa/) (accessed 2026-11-21). | An official Unicode font does not by itself recreate fixed 1441H page breaks, line justification, headings, ornaments, or Bismillah treatment. Requires an independently licensed exact layout and complete visual review [D0, D1]. | **Fallback within the same edition only if official exact-layout evidence becomes available.** |
| **Quran Foundation documented font/image files** | Its terms conditionally allow integrated in-app bundles with active developer account and credit [D4]. | Must verify exact 1441H edition and file-specific rights; its QCF V4 Tajweed label is not proof of identity with D2. Text/metadata Content Sync requires ongoing connection when available and does not authorize a static APK data bundle [D4]. | **Separate possible image/font route, not a drop-in QCF4 license or bundled-text solution.** |

## Recommended sequence

1. Request the Complex's authoritative 1441H reference and clarification for **its own** vector-page archive. If the archive is a different edition, keep it out of the approved 1441H reader and ask for the correct official source [D0, D1].
2. In parallel, request the QCF4 maintainer's complete source manifest and the Complex/preparer's written grant for the exact 47-font and QBSML binaries. Do not infer rights from D1 or from public Telegram/GitHub availability [D1–D3].
3. After rights and owner approval in a later task, acquire original files under controlled provenance, verify hashes and inspect an exact-edition sample for technical feasibility. Check ayah mapping against each page, including possible page crossings; fail closed on missing hit data [D0, D2, D4].
4. Choose a production source only after a full edition match, all-class rights, independent Quran review and a tested ayah interaction map. Any source change from 1441H requires explicit owner decision [D0].

**Decision:** **CONDITIONAL GO for written source and rights inquiries; NO-GO for asset import, renderer implementation, or production source designation.**
