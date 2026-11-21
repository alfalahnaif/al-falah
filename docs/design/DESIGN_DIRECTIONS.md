# Al-Falah visual directions — proposals

> **Typography revision, 2026-11-22:** A2 remains the approved visual direction. The owner replaced the previously proposed Thmanyah typeface with [IBM Plex Sans Arabic](IBM_PLEX_SANS_ARABIC.md); typography references below are historical exploration, not current implementation instructions.

> **Decision update, 2026-11-22:** The owner selected **A2 — Elegant & Traditional: Calm & Balanced** in Task 005. The comparison below is retained as the Task 004 research record. A2 uses warm ivory, deep plum, restrained muted gold, quiet borders and minimal elevation. No ornamental patterns, gradients, or new navigation were authorized. See [implemented tokens](DESIGN_SYSTEM_USAGE.md).

**Prepared:** 2026-11-21 (Asia/Riyadh). The owner has approved Thmanyah as the **interface font preference**, not a final design direction, palette or implementation. The [official Thmanyah site](https://font.thmanyah.com/) (accessed 2026-11-21) presents Serif Display, Serif Text and Sans; the [license](https://font.thmanyah.com/licenses) (accessed 2026-11-21) still needs packaging clarification for this app. All three directions keep the [approved 1441H single-page Mushaf decision](../decisions/APPROVED_MVP_DECISIONS_2026-11-16.md) (2026-11-16) separate from interface styling. No visual assets or screens were created.

Color values below are **exploration swatches**, not approved tokens. Contrast figures are calculated from the listed sRGB hex pairs using the [WCAG relative-luminance method](https://www.w3.org/WAI/WCAG22/Understanding/contrast-minimum.html) (accessed 2026-11-21); they do not prove contrast for every component or state.

| Aspect | A. Elegant and traditional | B. Modern and minimal | C. Balanced modern-Islamic |
|---|---|---|---|
| Palette | Warm ivory #FAF8F4, ink #1E2926, deep plum #5A2F35; muted brass #A47735 as sparse ornament only. Plum on ivory ≈10.46:1; brass on ivory ≈3.76:1, so brass is **not** a small-text color. | Warm white #FAF8F4, ink #1E2926, deep blue #194D6A; near-monochrome surfaces. Blue on ivory ≈8.57:1. | Warm ivory #FAF8F4, ink #1E2926, deep teal #185E58; subtle warm accent used only after state/contrast checks. Teal on white ≈7.55:1. |
| Typography hierarchy | Serif Display for occasional large editorial heading; Sans for all controls and compact titles; optional Serif Text for longer interface copy after testing. | Sans carries nearly all hierarchy through size/weight; Display reserved for a few major headings. | Display for major headings, Sans for task flow and controls, Serif Text optional for long descriptions. |
| Navigation | Calm, clearly labeled Material navigation with generous Arabic labels and restrained separators. | Compact but still accessible Material navigation, simple icons plus labels; minimal visual decoration. | Clear Material navigation with a modest editorial header; essential reading actions remain visible and predictable. |
| Surfaces | Soft paper-like backgrounds, quiet borders, limited shadow; avoid imitation Mushaf ornament in app chrome. | Flat surfaces, strong spacing and contrast, almost no ornament or elevation. | Quiet warm surfaces, one restrained accent, shallow elevation only where it clarifies a floating control. |
| Accessibility risk | Display lettering and decorative brass can reduce clarity at small size; avoid thin weights, contrast failures and ornate controls. | Sparse hierarchy can make controls hard to find; distinguish focus, selected and disabled states without color alone. | Extra visual layers can compete with the Mushaf page; keep reading chrome quiet and preserve touch/contrast budgets. |
| Best research question | Does an editorial tone support trust without crowding the reading experience? | Does a restrained interface make reading and navigation fastest? | Is there enough warmth and identity without visual competition with the page? |

## Common guardrails

- Use the currently approved IBM Plex Sans Arabic **only** for interface typography; the approved Mushaf page uses a separately licensed, edition-matched source and renderer ([source decision](../research/RENDERER_SOURCE_DECISION.md), 2026-11-21).
- A direction does not add screens or features beyond the [product requirements](../PRODUCT_REQUIREMENTS.md). Do not infer a new illustration, ornament or icon license from these proposals.
- Keep light and dark variants of every surface and state. The dark palette in [token proposal](DESIGN_TOKENS_PROPOSAL.md) is a common test baseline, not an automatic transformation of any direction.
- Compare at least Home, Surah index, Settings and the **empty/blocked reader state** as interface-only wireframes after owner approval. Do not use Quran text, page assets or unapproved religious copy in mockups.
- Test Arabic RTL, mixed English labels, maximum text scaling, TalkBack/VoiceOver and low-vision contrast before selecting a direction ([accessibility requirements](ACCESSIBILITY_REQUIREMENTS.md)).

**Historical Task 004 status:** direction selection was pending when this comparison was prepared. The Task 005 A2 decision above supersedes that status.
