# Al-Falah — Reference Product Research: Wahy and Surah

**Date:** 16 November 2026  
**Purpose:** Product/UX and technical reference research for the Al-Falah Quran reader.  
**Important:** This document records publicly described features and clearly labels architectural inference. It does not claim access to either app's source code.

## 1. Product decision already approved

- Product name: الفلاح (Al-Falah).
- Reference Mushaf: Madinah Mushaf, Hafs 'an Asim.
- Primary reading interaction: one complete page at a time.
- Navigation: horizontal swipe/page turning.
- Not a two-page facing spread.
- Quran and essential page content must be available locally.
- The exact print edition/year and redistribution rights still require approval.

## 2. Wahy (وحي)

Official website: https://web.wahy.net/  
Interactive web Mushaf: https://web.wahy.net/mushaf  
Main product information: https://main.wahy.net/

Publicly described capabilities:
- Madinah Mushaf pages as printed.
- The current website describes the Mushaf display as two facing pages; this differs from Al-Falah's approved single-page mobile presentation.
- Multiple Madinah Mushaf editions are listed: Hafs 1441, 1422, 1405, and Warsh 1428.
- The page can be used with verse-by-verse recitation and highlighting.
- Word meanings, grammar, morphology, and readings are available by tapping a word.
- Multiple bookmarks, reading plans/khatmah, notes, Quran search, tafsir, and translations.
- The site lists 81 reciters, 55 tafsir works, and 131 translations across 62 languages.

Product lessons for Al-Falah:
- Keep reading as the primary experience; make supporting knowledge available contextually.
- Connect audio playback to the active ayah and highlight the currently recited ayah.
- Design a clear ayah/word action surface.
- Keep bookmarks and reading plans distinct.
- Do not copy the full breadth of Wahy's content library into MVP.

Source: https://web.wahy.net/ (accessed 2026-11-16)

## 3. SurahApp (مصحف سورة)

Official product site: https://surahapp.com/  
Tafsir Center product description PDF: https://tafsir.net/application/7.pdf

The product description states:
- It presents a digital copy of the Madinah Mushaf produced by King Fahd Complex, Hafs 'an Asim, edition 1440H.
- It maintains the appearance of the printed Mushaf.
- A long press can select an individual word.
- Word services include meaning, image where appropriate, geographical location, morphology, grammar, and word recurrence.
- It uses the screen extensively for the Mushaf page, with a compact top information area for surah, page, juz, hizb, reading direction, and page number within the juz.
- It includes indexes for surahs, juz, and pages; search; reading plans; reminders; notes; multiple bookmarks; word color markers; self-testing; sharing; and progress tracking.
- Its description says it is connected to a website and a scientific-content database that is reviewed and updated.

Product lessons for Al-Falah:
- The printed page can be the visual source of truth while interactions are layered on top.
- Keep page metadata compact and avoid wasting reading space.
- Long-press is suitable for word-level actions; a simple tap can select an ayah.
- Page, juz, hizb, surah, and reading-direction metadata should be modeled explicitly.
- A curated offline MVP should not depend on Surah's described online-linked scientific-content database.

### Architectural inference — not verified source-code fact

Because SurahApp describes preserving the printed page while supporting long-press word selection, a plausible implementation is a page visual plus a separate mapping of page coordinates to word/ayah identifiers, or an equivalent fixed-layout rendering system. The public description does not disclose its actual implementation. Do not claim that it uses a specific image-overlay technology without source-code or developer confirmation.

## 4. Proposed Al-Falah reader model

### MVP
- Single page per screen.
- Horizontal swipe to previous/next page.
- Fixed page layout matching the exact approved edition.
- Page and surah metadata in a compact header.
- Local last-read page persistence.
- Ayah selection and action sheet, provided accurate mapping is available.
- Word-level selection only if exact word-position metadata and reliable hit-testing can be licensed and validated.
- Audio playback can begin from a selected ayah once approved recitation assets and verse timing/segmentation are available.

### Later
- Continuous/reflowable reading mode as a separate mode.
- Word meanings, morphology, grammar, tafsir, translations, notes, color markers, reading plans, memorization testing, and richer progress tracking only after source/licensing/review approval.

## 5. Technical options to investigate

### Option A — Licensed page images + verified interaction map
Advantages:
- Closest visual fidelity to the printed Mushaf.
- Page boundaries and line breaks remain stable.
- Easier to validate page appearance against the approved edition.

Requirements:
- Explicit permission to redistribute page images in a mobile app.
- Exact edition/version and page count.
- Image dimensions/resolution and quality suitable for target screens.
- Page-to-surah/ayah mapping.
- Word bounding boxes or polygons if word selection is required.
- Correct scaling transform from source coordinates to rendered screen coordinates.
- Tests across aspect ratios, densities, zoom, and safe areas.

Limitations:
- Images alone are not accessible/selectable text.
- Text resizing/reflow is not naturally supported.
- Word hit-testing depends on reliable coordinate metadata.

### Option B — Fixed-layout text/glyph rendering
Advantages:
- Text-level selection and accessibility can be more direct.
- Can support word-level interactions if layout metadata is complete.
- Potentially less image storage.

Requirements:
- Licensed Mushaf font.
- Exact page/line/word layout metadata for the selected edition.
- Rendering fidelity validation against the printed page.
- Correct handling of Quranic marks, ligatures, shaping, and line breaks.
- No reflow or normalization of canonical text.

Limitations:
- More complex rendering and QA.
- Generic Quran text alone is insufficient to reproduce the printed layout.

### Decision rule
Do not choose an implementation until the owner approves the exact edition and the team verifies the source, license, offline redistribution rights, font, page assets, and word/ayah coordinate data. If word-level mapping is not available, ship only the interaction level that can be validated.

## 6. Rights and content safety

- Public accessibility does not imply redistribution permission.
- Do not copy app page images, proprietary assets, fonts, audio, datasets, or code from Wahy or Surah.
- Use these products as UX references only.
- Seek official source material and written licensing/permission for the exact Madinah Mushaf digital assets.
- Preserve source notices and attribution.
- Keep canonical Quran text immutable.
- Do not use AI to reconstruct page content or fill missing word mappings.

## 7. Sources

1. Wahy official website: https://web.wahy.net/
2. Wahy interactive Mushaf: https://web.wahy.net/mushaf
3. Wahy product overview: https://main.wahy.net/
4. Tafsir Center — SurahApp product description: https://tafsir.net/application/7.pdf
5. SurahApp website: https://surahapp.com/

**End of research note.**
