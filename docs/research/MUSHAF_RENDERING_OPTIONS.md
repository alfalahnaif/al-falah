# Offline Mushaf rendering options

**Research date:** 2026-11-21. This compares architecture candidates; it does not select a renderer or approve assets. The product target remains one complete, horizontally turned 1441H Hafs page with ayah-level MVP interaction [P1].

## Sources (all external pages retrieved 2026-11-21)

| ID | URL and relevance |
|---|---|
| P1 | [Approved MVP decisions](../decisions/APPROVED_MVP_DECISIONS_2026-11-16.md), 2026-11-16, and [architecture](../ARCHITECTURE.md): product constraints and separate read-only content/user data. |
| O1 | [QCF4 pinned README](https://github.com/MohamadHajjRabee/quran-qcf4/blob/5130511027e769f0a8f4eeb7f00f46bde3788d60/README.md), [license](https://github.com/MohamadHajjRabee/quran-qcf4/blob/5130511027e769f0a8f4eeb7f00f46bde3788d60/LICENSE.md), and [tree metadata](https://api.github.com/repos/MohamadHajjRabee/quran-qcf4/git/trees/5130511027e769f0a8f4eeb7f00f46bde3788d60?recursive=1): model, rights, and size basis. |
| O2 | [King Fahd Complex vector-page product](https://qurancomplex.gov.sa/mushaf-printing): official artwork route and published rights for that specific product. |
| O3 | [Quran Foundation font guide](https://api-docs.quran.com/docs/tutorials/fonts/font-rendering/) and [page guide](https://api-docs.quran.com/docs/tutorials/fonts/page-layout/): glyph-versus-Unicode distinction and page-spanning caveat. |
| O4 | [Quran Foundation developer terms](https://api-docs.quran.com/legal/developer-terms/), updated 2026-11-20: conditional font/image bundling and data restrictions. |
| O5 | [Flutter custom fonts](https://docs.flutter.dev/cookbook/design/fonts), [assets](https://docs.flutter.dev/ui/assets/assets-and-images), and [accessibility](https://docs.flutter.dev/ui/accessibility): platform support and accessibility constraints. |

## Comparison

| Criterion | 1. Licensed fixed-layout QCF4 glyphs | 2. Licensed full-page art + verified ayah regions | 3. Official Unicode text + independently approved layout |
|---|---|---|---|
| Printed accuracy | **Potentially high**, only after exact 1441H font, glyph, line, header, and ornament matching. Current repository's edition claim is unverified [O1, P1]. | **Potentially highest visual baseline** if page art is the exact approved edition. The Complex has a distinct vector product; edition and derivative use remain to confirm [O2]. | Unicode can show verse text, but ordinary reflow does not preserve printed line/page geometry. Would need a separately approved placement system; no such 1441H package was verified [O3, P1]. |
| Ayah interaction | Stable verse_key exists in documented glyph items; renderer-measured boxes would still need verification. No source hit coordinates were documented [O1]. | Image alone is not selectable; requires independently verified ayah regions, including line/page-spanning ayahs [P1, O3]. | Could attach verse IDs to text runs, but exact fixed-page hit regions would depend on the missing layout system [O3]. |
| Android / iOS | Flutter documents bundling TTF and applying custom fonts. A multi-font renderer on both platforms is **plausible, untested**. Do not assume WOFF2 is a Flutter mobile font format [O5]. | Flutter bundles and displays image assets on both platforms. Region overlay, zoom, and scaling behavior would need a prototype [O5]. | Flutter supports text; maintaining a fixed printed page at varying scale remains unproven [O5, O3]. |
| Complexity / upkeep | High: page/line grouping, 48 font-file mapping, glyph metrics, special items, measured touch boxes, and source updates [O1]. | Moderate visual renderer, high mapping/QA burden: 604 page files plus all ayah regions and transformations across screen sizes [O2, P1]. | High if exact 1441H layout must be reconstructed; risk of creating an unapproved new layout rather than reproducing the print [P1, O3]. |
| Accessibility | Glyphs may not convey canonical text or ayah semantics to screen readers; separate approved semantic text and large-text behavior would be needed [O5, P1]. | Page image requires separate accessible verse text and interaction semantics; zoom can preserve fidelity but may impair usability [O5]. | Most adaptable for text scaling and screen readers, but large text can break fixed-page fidelity [O3, O5]. |
| Package-size evidence | Pinned Git tree: JSON blobs 21.2 MB, TTF blobs 97.0 MB, WOFF2 blobs 37.4 MB (decimal, raw Git blob totals). **These are not APK size estimates**; Flutter supports TTF assets, while WOFF2 suitability is unverified [O1, O5]. | No exact 1441H art package size measured. Format, resolution, compression, and whether vectors can be used directly are open [O2]. | Unknown until source and layout assets are identified [O3]. |
| Offline behavior | Yes in principle if approved data and fonts are bundled; no runtime API/CDN [P1, O1]. | Yes in principle if approved art and hit regions are bundled [P1, O2]. | Yes only if both text and exact layout are authorized for local bundling [P1, O4]. |
| Rights gate | QCF4 JSON MIT statement is separate from fonts, which explicitly lack redistribution permission [O1]. | Complex's published vector-product terms may help, but exact edition, asset form, and any generated hit-map rights must be established [O2]. | Exact text and layout rights are separate; Foundation API content cannot simply become a static bundled database under its current terms [O4]. |

## Recommendation

Keep **option 1** as the leading technical hypothesis for ayah interaction, with **option 2** as an independent fallback or visual reference. Neither is ready for implementation. The Complex's official vector pages may offer an authoritative reference and possibly a permitted art route, but the QCF4 repository is a different distribution with a separate font-rights problem [O1, O2]. Option 3 can support a later accessibility presentation only after an approved text source and owner decision; reflow is not the primary fixed-page MVP reader [P1, O3].

Quran Foundation's guide uses “QCF V4 Tajweed” with code_v2, whereas the QCF4 repository describes its own 47-font 1441H package. The shared version label does **not** establish matching glyph IDs, page geometry, or rights [O1, O3]. Wahy and RoonFit remain architecture references only; no asset or schema from their APKs is used [P1; see also ../TECHNICAL_FINDINGS_ROONFIT_WAHY.md].

## Safe local content transformation, if later approved

The proposed pipeline is: acquire a permission-cleared, pinned source snapshot; hash each original file; parse its container without changing canonical Quran code points; validate source IDs, page/line/glyph links, and edition identity; write immutable, read-only local records with reverse links to original files; package only licensed assets; keep user bookmarks/position in a separate writable store. A derived search index, if approved later, must be separate from canonical display/copy text [P1; ../CONTENT_POLICY.md]. No such pipeline was run in this task.
