# Task 010 UI validation matrix

**Date:** 2026-11-23 (Asia/Riyadh)

**Baseline:** `origin/main` at `0162ee1` (merged PR #7)

**Scope:** Current data-free Home, Quran, Bookmarks, Adhkar, Settings, About, license entry, and unknown-route shell. No Mushaf reader or approved religious collection is present.

## Status key

- **PASS:** Executed and verified within the stated test method.
- **FAIL:** Reproducible observed failure; see the audit.
- **BLOCKED:** Could not execute or finish in this environment.
- **NOT TESTED:** Outside this task or environment.

Widget tests use Arabic RTL, a simulated logical viewport at 1 device pixel per logical pixel, and a 24dp top/bottom inset unless noted. They assert four visible/tappable labels, selected semantics, expected one/two-row layout, no Flutter exception, and a bar below the body. The tests do not prove native glyph quality, TalkBack order, or actual Android/iOS system behavior.

| Logical viewport | Theme | Text scale | Orientation | Widget result | Device result |
|---|---|---:|---|---|---|
| 320 × 640 | Light | 2.0 | Portrait | PASS — two rows; all four tabs selected in turn | NOT TESTED at this size |
| 360 × 800 | Light | 1.5 | Portrait | PASS — two rows; all four tabs selected in turn | NOT TESTED at this size |
| 393 × 852 | Dark | 1.0 | Portrait | PASS — one row; all four tabs selected in turn | NOT TESTED at this size |
| 412 × 915 | Dark | 2.0 | Portrait | PASS — two rows; all four tabs selected in turn | NOT TESTED at this size |
| 600 × 960 | Light | 2.0 | Portrait | PASS — one row; all four tabs selected in turn | NOT TESTED at this size |
| 640 × 320 | Light | 1.5 | Landscape | PASS — one row; all four tabs selected in turn | NOT TESTED on device |

Additional widget checks: **PASS** for Home scroll area above the navigation bar with 32dp top and 40dp bottom insets at 320 × 640/2.0; **PASS** for one Arabic labeled selected semantic action per tab; **PASS** for Flutter Android touch-target, labeled-target, and text-contrast guidelines on compact Home in light and dark at 2.0; **PASS** for repeated Settings → About → Back → tab → Back sequences across three non-Home tabs. Existing widget tests cover the direct secondary paths, unknown-route recovery, software licenses, parent router stability, branch scroll state, and IBM Plex Sans Arabic asset/theme roles.

## Android runtime evidence

Pixel 8 emulator: Android 17 / API 37; 1080 × 2400 physical pixels; density 420 dpi (about 411 × 914 logical pixels); Arabic RTL; system font scale 1.0 or 2.0. Screenshots are local-only under ignored `build/task010-evidence/` and are **not** committed. The Flutter `DEBUG` banner is expected in this APK.

| Check | Status | Evidence / limit |
|---|---|---|
| Home light, Quran unavailable, Bookmarks, Adhkar, Settings, About | PASS visual inspection at 1.0 | `home-light.png`, `quran-unavailable.png`, `bookmarks.png`, `adhkar.png`, `settings.png`, `about.png`; Arabic text and tabs visible without observed clipping or overlap |
| Home dark at 1.0 | PASS visual inspection | `back-repro.png`; dark colors and one-row labels visible |
| Home dark at 2.0 | PASS for captured static layout; FAIL for uninterrupted interaction | `home-dark-2x-clear.png` shows readable two-row labels after dismissing an ANR dialog; repeated ANR blocked continued use; issue UI010-01 |
| Android Back from Quran tab root | PASS at 1.0 | `back-repro.png` shows Home after a separate Back-only reproduction; earlier launcher capture was confounded by a simultaneous theme change |
| Offline app startup | PASS for current Home shell only | Airplane mode enabled (`airplane_mode_on=1`); after startup settled, `offline-settled.png` shows Home. Airplane mode restored to 0. Quran reading cannot be exercised because the reader/content are not implemented. |
| TalkBack and keyboard focus order | NOT TESTED | No assistive-technology session was run. Widget semantics and focus-style assertions are narrower evidence. |
| Runtime rotation, keyboard insets, software license list | NOT TESTED | Widget landscape/inset and license navigation tests only. |

A connected Samsung SM N975U phone (Android 12 / API 31, 1440 × 3040 physical, overridden 560 dpi, text scale 1.0) accepted the debug APK, but its screen was locked behind the notification shade. **BLOCKED:** phone visual and interaction checks; no phone settings were changed. iOS build and VoiceOver are **BLOCKED** on this Windows host.

## Reproduction for remaining device review

On a representative Android device, install `build/app/outputs/flutter-apk/app-debug.apk`, launch, verify all four tabs and Settings/About in Arabic, toggle system light/dark and 100%/200% text, repeat system Back from a tab root and secondary page, and use TalkBack plus a hardware keyboard. Specifically try the Pixel 8 API 37 theme/text-scale sequence in [UI010-01](UI_ACCESSIBILITY_AUDIT.md) while collecting an ANR trace. On iOS, build and repeat compact/large text, VoiceOver, safe-area, rotation, and back-gesture review using a Mac and iPhone/simulator.
