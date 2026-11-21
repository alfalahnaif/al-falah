# Licensing and provenance matrix

**Research date:** 2026-11-21. This is a source-by-source rights assessment, not legal clearance or owner approval. No assets were obtained. Public availability and a repository license do not establish rights in third-party source material [L1–L5; project policy P1].

## Sources (all retrieved 2026-11-21)

| ID | URL and scope |
|---|---|
| L1 | [QCF4 license at pinned commit](https://github.com/MohamadHajjRabee/quran-qcf4/blob/5130511027e769f0a8f4eeb7f00f46bde3788d60/LICENSE.md): named JSON files under MIT; font files expressly excluded. |
| L2 | [QCF4 README at pinned commit](https://github.com/MohamadHajjRabee/quran-qcf4/blob/5130511027e769f0a8f4eeb7f00f46bde3788d60/README.md): claimed Complex/Ahmad ElGharib font provenance and Quran.com chapter metadata. |
| L3 | [King Fahd Complex vector-page project and rights](https://qurancomplex.gov.sa/mushaf-printing): published permission for the described vector-format product in computer applications, with its stated conditions. This is not a blanket QCF4 font or JSON grant. |
| L4 | [Quran Foundation developer terms](https://api-docs.quran.com/legal/developer-terms/), updated 2026-11-20: Content Sync, prepackaged data, font/image bundling, and end-user audio conditions. |
| L5 | [Tanzil text license](https://tanzil.net/docs/Text_License) and [download page](https://tanzil.net/download/): CC BY 3.0 notice, verbatim copying, attribution/link, version 1.1 claim. |
| L6 | [Quran Foundation font-rendering guide](https://api-docs.quran.com/docs/tutorials/fonts/font-rendering/): technical font categories, not redistribution permission. |
| P1 | [Project content policy](../CONTENT_POLICY.md) and [approved MVP decisions](../decisions/APPROVED_MVP_DECISIONS_2026-11-16.md): content approval and edition/rights gates. |

## Separate rights decisions

| Asset or data | Documented permission or claim | Remaining risk / required action | Current state |
|---|---|---|---|
| **Canonical Quran text** | QCF4 page items have a text field, but L2 gives no exact canonical text source/edition. L1's JSON MIT statement is a grant by the repository author, not proof of authority over any underlying text. Tanzil separately permits verbatim distribution under its notice and attribution rules [L1, L2, L5]. | Obtain exact source, edition/version, original checksums, attribution, qualified review. If Tanzil is considered, prove its text type matches the approved 1441H rendering and keep it separate from glyph labels; no silent substitution [P1, L5]. | **PROPOSED; not approved** |
| **Page-layout JSON** | L1 lists pages/ under MIT, with notice preservation. | Confirm derivation/source ownership, exact 1441H page fidelity, and whether any original rights or restrictions carry through. Get written maintainer provenance and owner approval before import [L1, L2, P1]. | **LICENSE_REVIEW; not approved** |
| **Verse-to-page/line mappings** | L1 lists verses.json under MIT. | Confirm source and edition, cross-page behavior, rights to the underlying mapping, and independent verification [L1, L2, P1]. | **LICENSE_REVIEW; not approved** |
| **QCF4 TTF/WOFF2 main fonts** | L1 explicitly excludes fonts/ and fonts-woff2/ from MIT and says redistribution, modification, or commercial use requires explicit original rights-holder permission. L2 attributes font production to the Complex and a font version to Ahmad ElGharib. | Obtain a grant covering exact font filenames/version, embedded Android/iOS distribution, offline use, any font conversion/subsetting, updates, attribution, and commercial scope. Confirm the rights-holder chain with the Complex and font preparer [L1, L2]. | **Blocked for bundling** |
| **QBSML font and ornaments** | QBSML TTF/WOFF2 is inside the excluded font folders. L1 lists qbsml.json under MIT; L2 credits a separate glyph-decoding contributor. | Separate permission for font outlines/ornaments and any extracted images; verify contributor rights to decoded mapping and official placement/edition [L1, L2]. | **Blocked for bundling** |
| **Third-party chapter metadata** | L2 says chapter metadata was derived from Quran.com “open data”; L1 includes index.json under MIT. The original dataset, URL, version, and rights are not named [L1, L2]. | Identify exact upstream source and terms. L4's Foundation API rules may apply if obtained from its services; do not assume L1 overrides them. Replace with a separately approved metadata source only with owner approval [L4, P1]. | **LICENSE_REVIEW; not approved** |
| **Official vector reference pages** | The Complex publicly permits use of its described Illustrator-format digital Mushaf in computer applications [L3]. | Establish exact edition/year, package identity, whether offline app bundling and any raster conversion are within the specific terms, required attribution, and a source checksum. This grant does not attach to QCF4 fonts or GitHub page JSON [L3, P1]. | **PROPOSED; not approved** |
| **Quran Foundation font/image files** | L4 conditionally allows integrated app bundling of font files and Mushaf images obtained through its APIs or documented CDN URLs, with an active Developer Console account and accessible credit. It bars separate asset distribution [L4]. | Confirm the exact file/edition and owner acceptance of the account and ongoing terms. This permission does not automatically cover files obtained from the QCF4 repository [L4, L6, P1]. | **REFERENCE candidate; not approved** |
| **Quran Foundation text and metadata** | L4 restricts prepackaged data bundles; Content Sync copies have a permitted path and ongoing seven-day sync obligation when connectivity permits. Regular API responses cannot simply be frozen into an APK [L4]. | These obligations conflict with the current no-runtime-dependency, offline-after-install plan unless a separate written grant and architecture approval resolve them [L4, P1]. | **Do not use as bundled source now** |

## Preliminary audio criteria; no reciter selected

For any one Hafs reciter, record the performer and recording rights holder, riwayah, exact recording and segmentation, permitted in-app download, private offline retention, geographic/commercial scope, attribution, removal obligations, timing-data rights, and source checksums before an owner decision [P1]. Quran Foundation's current terms permit user-initiated offline recitation files in app-private storage under specific credit, Content Sync update/removal, and deletion conditions; direct audio-host URLs remain under those terms. This is a conditional option, not approval of a recording or a recommendation to adopt a runtime API [L4]. No audio was selected or downloaded.

## Who to contact, and what to ask

1. **King Fahd Complex:** use the contact shown on its [official vector-project page](https://qurancomplex.gov.sa/mushaf-printing), retrieved 2026-11-21. Ask for authoritative 1441H reference identity and explicit terms for the exact QCF4/QBSML fonts, ornament files, page art, offline embedding, conversion, and attribution [L1–L3].
2. **QCF4 maintainer:** use the [repository issue channel](https://github.com/MohamadHajjRabee/quran-qcf4/issues), retrieved 2026-11-21, for a provenance manifest, generation method, original checksums, known discrepancies, and rights chain for every JSON and font file [L1, L2].
3. **Font preparer named by the maintainer:** ask through a verified rights-holder channel identified by the Complex/maintainer; a credit line alone is not permission [L1, L2].
4. **Quran Foundation:** use the contact in its [developer terms](https://api-docs.quran.com/legal/developer-terms/), retrieved 2026-11-21, only if considering its own fonts/images, metadata, or audio. Ask about the exact offline application scenario and any source-specific conditions [L4].
5. **Tanzil:** contact only if the owner proposes it as an independent canonical-text source; its published license alone does not prove 1441H equivalence [L5, P1].

No source moves to APPROVED until the product owner records edition, license/permission, attribution, SHA-256 provenance, validation, and qualified religious review under [content policy](../CONTENT_POLICY.md).
