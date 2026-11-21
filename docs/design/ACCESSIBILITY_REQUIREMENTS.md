# Accessibility requirements for the interface design

> **Typography revision, 2026-11-22:** IBM Plex Sans Arabic is now the bundled interface family; Thmanyah references below are historical. Automated family/asset and 100%–200% neutral-text layout checks are in `test/widget/ibm_plex_typography_test.dart`. Manual Arabic shaping, diacritics, mixed-direction reading, TalkBack and VoiceOver checks remain required on devices. See [font record](IBM_PLEX_SANS_ARABIC.md).

> **Task 005 implementation status, 2026-11-22:** Automated tests cover Arabic RTL startup, direction-sensitive back icon, theme selection, 48dp icon-button target, 200% scaling of the minimal shell, and WCAG contrast of active semantic text/focus pairs. These checks do not establish whole-app accessibility. Manual Android/iOS checks remain required for TalkBack/VoiceOver, keyboard focus order, reduced motion, mixed-direction punctuation, device text scaling, and actual IBM Plex Sans Arabic rendering. See [usage and verification](DESIGN_SYSTEM_USAGE.md).

**Prepared:** 2026-11-21 (Asia/Riyadh); updated for the 2026-11-22 font decision. The interface uses IBM Plex Sans Arabic. Mushaf content and interactions have separate edition, rights and qualified-review gates ([approved MVP decisions](../decisions/APPROVED_MVP_DECISIONS_2026-11-16.md), 2026-11-16; [source strategy](../research/RENDERER_SOURCE_DECISION.md), 2026-11-21).

## Primary references (accessed 2026-11-21)

- [Flutter UI accessibility guidance](https://docs.flutter.dev/ui/accessibility/ui-design-and-styling): system text scaling, contrast and Android/iOS touch targets.
- [Flutter accessibility testing](https://docs.flutter.dev/ui/accessibility/accessibility-testing): semantics, labeled targets, contrast and touch-target guidelines.
- [Flutter internationalization](https://docs.flutter.dev/ui/internationalization): Arabic locale and widget text direction through localization delegates.
- [Flutter TextScaler migration](https://docs.flutter.dev/release/breaking-changes/deprecate-textscalefactor): nonlinear scaling support on Android 14 and later.
- [WCAG 2.2 text contrast](https://www.w3.org/WAI/WCAG22/Understanding/contrast-minimum.html), [non-text contrast](https://www.w3.org/WAI/WCAG22/Understanding/non-text-contrast.html), and [resize text](https://www.w3.org/WAI/WCAG22/Understanding/resize-text.html): test thresholds and intent.
- [IBM Plex repository](https://github.com/IBM/plex) and [Arabic font source record](IBM_PLEX_SANS_ARABIC.md): bundled original files, metadata and license. Code-point coverage does not prove visual rendering.

## Acceptance criteria for a later implementation

| Area | Requirement and test |
|---|---|
| Arabic legibility | Test bundled IBM Plex Sans Arabic on narrow Android/iOS screens at body, label and heading sizes; check joining, dot/diacritic clearance, clipping, wrapping, digit forms and punctuation. Check with native Arabic readers, including low-vision participants where available. Font metadata and widget tests do not prove visual quality. |
| RTL and navigation | Arabic screen order, back behavior, page-turn affordance, icons that imply direction, focus traversal, drawers/sheets and gestures must be inspected in RTL. Do not mirror logos, numbers, progress meaning or fixed Mushaf artwork automatically. Current [app.dart](../../lib/app/app.dart) pins Arabic locale; this task does not change it. |
| Dynamic text | Respect OS text settings and Flutter TextScaler. Test ordinary and largest available system sizes, plus a 200% text-resize target without lost controls or clipped content. Allow labels to wrap/reflow; do not cap user scaling for convenience. Mushaf fixed-page zoom/accessibility requires its own validated approach. |
| Screen readers | Test TalkBack on Android and VoiceOver on iOS. Every control needs a meaningful Arabic label, role, selected/disabled state and logical focus order. Announce loading/errors and distinguish page metadata from action controls. Never imply a page image is accessible Quran text without a separately approved semantic text source. |
| Targets | Plan at least 48×48 dp on Android and 44×44 pt on iOS for touch controls, regardless of visible icon size. Verify with Flutter guideline tests and manual device use. Ayah regions must be edition-verified; do not inflate an inaccurate mapping into a false interaction. |
| Contrast | Target at least 4.5:1 for normal text and 3:1 for large text; 3:1 for meaningful non-text controls/focus boundaries. Test actual foreground/background pairs for light/dark, selected, pressed, focused, error and disabled states. Do not encode status only by color. The proposed swatch calculations are in [tokens](DESIGN_TOKENS_PROPOSAL.md). |
| English / mixed direction | Test English labels, numerals, dates, URLs and identifiers inside Arabic UI, and Arabic words in English UI specimens. Isolate directional runs where needed, preserve logical reading order and inspect punctuation/parentheses at line breaks. Do not assume the site's Latin sample proves complete glyph coverage. |
| Platform behavior | Exercise Android and iOS safe areas, system font size, high contrast, bold text where available, landscape/multitasking width, keyboard and platform back gestures. Verify light/dark transitions and semantic focus after navigation. |

## Suggested verification matrix

With the licensed IBM files bundled, use neutral interface sample copy and compare: Android compact width plus TalkBack; iPhone compact width plus VoiceOver; a 600+ logical-pixel layout; light/dark; default and maximum available text sizes; Arabic-only and mixed Arabic/English strings; keyboard or switch navigation where relevant. Record device/OS, font-file hash, screenshot, semantics result, contrast result and issues. Flutter's guideline checks are useful automated gates, but user testing remains necessary ([Flutter testing](https://docs.flutter.dev/ui/accessibility/accessibility-testing), accessed 2026-11-21).

**Open:** actual IBM Plex Sans Arabic rendering, mixed-direction behavior and assistive-technology use remain unverified on Android/iOS devices. Do not certify accessibility from token or widget tests alone.
