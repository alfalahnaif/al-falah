# Al-Falah — Approved MVP Product Decisions

**Decision date:** 2026-11-16  
**Status:** Product preferences approved; source, license, and technical gates remain mandatory.

## 1. Mushaf edition
- Selected target: Madinah Mushaf, 1441H edition, Hafs 'an Asim.
- Target page experience: 604 pages, one page at a time, horizontal page turning.
- This is a product selection, not confirmation that the required 1441H assets are available or redistributable.
- Before implementation, verify the exact edition identity, page count, source provenance, matching QCF4 font/glyph data, layout metadata, and written rights for offline bundling and redistribution.
- Do not substitute 1439H, 1422H, or another edition without explicit owner approval.

## 2. Verse and word interaction
- MVP: ayah-level selection and actions only.
- Word-level selection is deferred beyond MVP.
- The ayah hit target must map to a verified canonical surah/ayah identifier.
- Do not approximate hit regions. If reliable ayah mapping is not available for a page, do not enable selection on that page until validated.
- Word-level selection may be reconsidered later only after exact word mapping and independent validation.

## 3. Audio
- MVP starts with one reciter.
- The reciter is not yet selected; selection requires verifying the recording source, recitation riwayah, file segmentation, permission for in-app download and offline playback, and any timing data.
- Users explicitly download audio to app-private storage; downloaded files play locally.
- Do not rely on a runtime API or streaming service for core playback.
- Word-level highlighting is out of MVP scope. Ayah highlighting is allowed only if exact timing is supplied and validated for the selected recording.

## 4. Mandatory release gates
1. Verify and document official source and redistribution/offline-bundling rights for the exact 1441H edition's Quran text, QCF4 fonts, glyph/layout data, and ornament assets.
2. Build a local-only proof of concept for representative pages and validate rendering against the approved edition.
3. Verify all ayah-to-page/line mappings and interaction hit regions.
4. Obtain qualified Quran text review and record checksums/provenance.
5. Verify audio rights and selected-reciter assets before adding audio downloads.

## 5. Scope protection
No Firebase, hosted database, analytics backend, mandatory login, or runtime content API is required for the MVP. Canonical Quran content and approved Mushaf layout are bundled locally. User bookmarks and last-read state are stored locally. Audio is downloaded locally on user request.

## 6. Interface typography preference (owner decision recorded 2026-11-21)

- The owner selected **Thmanyah Font** as Al-Falah's primary **application interface** typeface ([official site](https://font.thmanyah.com/), accessed 2026-11-21).
- Serif Display for major headings, Sans for controls/navigation, and optional Serif Text for longer interface copy are **proposals**, subject to family/weight verification and readability testing. No visual direction, palette, token values, font binaries, or distribution method is approved by this preference.
- The [official Thmanyah license](https://font.thmanyah.com/licenses) (accessed 2026-11-21) permits certain packaged-app embedding but restricts independent font-file access and redistribution. Flutter packaging and public-repository handling require written clarification before any font file is acquired for implementation or bundled. See the [typography audit](../design/THMANYAH_TYPOGRAPHY.md) and [owner decision register](../design/OWNER_DECISIONS.md).
- Thmanyah is **not** a Quran Mushaf font. The 1441H Hafs page typography and layout retain their separate source, rights, integrity and owner-approval gates above.

## 7. Interface visual direction (owner decision recorded 2026-11-22)

- The owner selected **A2 — Elegant & Traditional: Calm & Balanced** for the application interface. The supplied warm ivory/plum light palette, dark palette, muted gold accent, quiet borders, near-zero card elevation, 4dp spacing scale and approximate component radii are authorized for the design-system foundation. See [design decisions](../design/OWNER_DECISIONS.md).
- This selection does not authorize new screens, navigation changes, Thmanyah font binaries, the Lucide package, or Quran assets. The 1441H Hafs Mushaf decision and source-approval gates are unchanged.
