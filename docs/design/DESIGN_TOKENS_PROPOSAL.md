# Semantic design tokens — proposal

> **Implementation update, 2026-11-22:** The owner selected A2 and supplied its light/dark palette, 4dp spacing scale, and approximate radii in Task 005. The neutral/teal examples below remain historical Task 004 exploration; **they are not the active app theme**. Active values and roles are in [app_tokens.dart](../../lib/app/theme/app_tokens.dart), with usage in [DESIGN_SYSTEM_USAGE.md](DESIGN_SYSTEM_USAGE.md). Contrast for active pairs is covered by `test/unit/app_theme_test.dart`.

**Prepared:** 2026-11-21 (Asia/Riyadh). These are design **test values**, not an approved implementation. Thmanyah is the approved interface family preference; exact files/metrics and delivery remain gated in [typography audit](THMANYAH_TYPOGRAPHY.md). The current app uses a temporary seed-color Material theme in [app.dart](../../lib/app/app.dart); no theme or dependency was changed.

The proposed architecture follows Flutter's [ThemeData](https://api.flutter.dev/flutter/material/ThemeData-class.html) and [ColorScheme](https://api.flutter.dev/flutter/material/ColorScheme-class.html) roles (accessed 2026-11-21). Keep tokens as semantic **interface** values. A future Mushaf renderer owns separate, edition-verified page and typography configuration ([approved MVP decisions](../decisions/APPROVED_MVP_DECISIONS_2026-11-16.md), 2026-11-16).

## Structure and Material mapping

| Layer | Examples | Intended Flutter destination |
|---|---|---|
| Primitive candidates | Colors, spacing steps, radius values, size and weight proposals | Private constants only after approval; no direct feature-widget literals. |
| Semantic interface roles | surface, onSurface, primary, onPrimary, outline, error, focus, selected | Material ColorScheme and component themes. |
| Typography roles | display, title, body, label, metadata | Material TextTheme plus named interface roles; family IDs from **verified original font metadata**. |
| Component states | enabled, pressed, focused, selected, disabled, loading, error | Button, navigation, input and card themes; do not encode state by color alone. |
| Responsive behavior | compact and expanded layouts, safe-area padding, content max width | Window constraints/Material navigation choices; never alter the 604-page Mushaf's approved page geometry. |

At Task 004 time, the installed `material_ui` theme API had not been evaluated. Task 005 uses the existing resolved `material_ui` 1.11.1 theme and component APIs; no package change was made.

## Light and dark color roles

This **neutral/teal test baseline** does not select direction C. Direction A or B could substitute its own approved primary accent while retaining role names. Pairs below were calculated with the [WCAG 2.2 luminance/contrast method](https://www.w3.org/WAI/WCAG22/Understanding/contrast-minimum.html) (accessed 2026-11-21). All component combinations and states still require testing.

| Semantic role | Light candidate | Dark candidate | Pair and computed ratio |
|---|---|---|---|
| background / onBackground | #FAF8F4 / #1E2926 | #111B19 / #F4F4ED | 14.14:1 light; 15.91:1 dark. |
| surface / onSurface | #FFFFFF / #1E2926 | #1A2825 / #F4F4ED | 15.00:1 light; 13.83:1 dark. |
| secondary text on surface | #465650 on #FFFFFF | #C4D0C9 on #1A2825 | 7.76:1 light; 9.62:1 dark. |
| primary / onPrimary | #185E58 / #FFFFFF | #80C8B7 / #111B19 | 7.55:1 light; 9.09:1 dark. |
| outline on background/surface | #687671 on #FAF8F4 | #9AAFA7 on #1A2825 | 4.48:1 light; 6.60:1 dark. Use as a non-text boundary, not a substitute for text. |
| error / onError | #B42318 / #FFFFFF | #FFB4AB / #111B19 | 6.57:1 light; 10.35:1 dark. |

Map these through ColorScheme only after checking every corresponding Material role and generated container state. Avoid assuming ColorScheme.fromSeed preserves the listed contrast pairs; verify its actual output. Use semantic error/success/warning labels and icons with color, and measure adjacent surfaces separately ([WCAG non-text contrast](https://www.w3.org/WAI/WCAG22/Understanding/non-text-contrast.html), accessed 2026-11-21).

## Typography scale (starting values, logical pixels)

| Interface role | Family candidate | Size / weight candidate | Line height and wrapping rule |
|---|---|---|---|
| Editorial display | Serif Display | 32 / medium or bold | 1.30–1.45× measured line box; allow two or more lines. |
| Page title | Sans | 24 / medium or bold | 1.35–1.50×; no forced one-line truncation of Arabic. |
| Section title | Sans | 20 / medium | 1.40–1.55×. |
| Body | Sans; optional Serif Text after testing | 16 / regular | 1.50–1.70×; test diacritics and 200% system scaling. |
| Button / navigation label | Sans | 14–16 / medium | 1.35–1.55×; control box meets touch minimum independently of glyph size. |
| Metadata / helper | Sans | 14 / regular | 1.40–1.60×; never rely on low contrast or tiny text. |

Do not translate named “thin/regular/medium/bold/heavy” into numeric Flutter weights until original font metadata is inspected. Flutter requires explicit weight declarations and may synthesize missing weights ([Flutter font guide](https://docs.flutter.dev/cookbook/design/fonts), accessed 2026-11-21). Use zero added letter spacing for connected Arabic text as the baseline; test any Latin tracking separately. These line-height values are unvalidated because no Thmanyah binaries were acquired.

## Geometry and interaction candidates

| Group | Proposal | Reason / validation |
|---|---|---|
| Spacing | 4, 8, 12, 16, 24, 32, 48 logical pixels | Use 16 outer padding on narrow windows and 24–32 where room permits; audit text scaling and RTL. |
| Radius | 4 small input/chip; 12 cards; 16 sheets/dialogs | Keep corner semantics stable across directions; no ornamental shape language approved. |
| Elevation | 0 default surface, 1 raised card only when needed, 3 temporary overlay | Use borders/contrast first; dark theme shadow visibility is not assumed. |
| Minimum hit area | Android 48×48 dp; iOS 44×44 pt | Align with [Flutter accessibility guidance](https://docs.flutter.dev/ui/accessibility/ui-design-and-styling) (accessed 2026-11-21). |
| Compact width | Below 600 logical pixels: single-column interface and labeled bottom navigation **if** the screen requires it | Flutter's [adaptive guidance](https://docs.flutter.dev/ui/adaptive-responsive/general) (accessed 2026-11-21) uses available width, not device class. Navigation model still needs owner review. |
| Expanded width | 600+ logical pixels: consider rail and constrained content width (e.g. 720) | Breakpoint/content width are test values; Mushaf still shows one complete approved page, not a two-page spread. |

For each component, propose explicit foreground/background, outline, focus and disabled roles. Pressed/selected states must retain legible text and a second cue (shape, icon or label); disabled text should remain understandable and not convey essential information alone. Loading must preserve a spoken status. No static opacity recipe is approved without measuring resulting contrast ([accessibility requirements](ACCESSIBILITY_REQUIREMENTS.md)).
