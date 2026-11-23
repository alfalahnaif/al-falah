# Task 010 UI and accessibility audit

**Date:** 2026-11-23 (Asia/Riyadh)

**Branch:** `test/ui-accessibility-hardening`, based on merged PR #7 (`0162ee1`).

## Verified finding

### UI010-01 — Android emulator ANR during configuration changes

| Field | Record |
|---|---|
| Component | App runtime on Pixel 8 API 37 emulator; Home shown behind the dialog |
| Severity | **HIGH** — Android blocks interaction while the ANR dialog is present |
| Reproduction | Install the debug APK, launch at 1.0 text scale, switch system night mode, set system font scale to 2.0, and continue using or restarting the app. An ANR dialog appeared and recurred after choosing Wait. Exact trigger within the sequence is not isolated. |
| Environment | Flutter 3.50.0 / Dart 3.14.0; Android 17 API 37 Pixel 8 emulator, 1080 × 2400, 420 dpi; debug APK |
| Actual | Android displayed “الفلاح isn't responding.” The static 2.0 Home UI rendered behind it, but taps and Back could not be reliably validated. |
| Expected | Configuration changes and startup should leave the app interactive without an ANR. |
| Evidence | Local screenshots `build/task010-evidence/home-dark.png`, `home-dark-2x-restart.png`, `home-dark-2x-clear.png`; logcat: `ANR in com.example.al_falah`, reason `Input dispatching timed out (Application does not have a focused window)`. A protected `/data/anr` trace was inaccessible on this production emulator image. |
| Root cause | **Unknown.** The available log identifies the focus timeout, not whether Flutter, this app, or emulator host load caused it. The Android 12 phone was locked, so cross-device reproduction is pending. |
| Fix applied | None. Changing app code without isolating the cause would be speculative. |
| Regression test | `test/widget/ui_validation_test.dart` covers the 2.0 static layout and tab semantics, but cannot reproduce an Android process ANR. A device-level regression check is required after diagnosis. |
| Remaining limit | Reproduce with a fresh emulator and an unlocked Android device, collect a full ANR trace, then decide whether an app fix is needed. This finding blocks a clean device-level sign-off. |

## Areas without a verified UI defect

- The six tested widget viewport/scale combinations rendered four usable RTL tabs and the expected bar reflow without a Flutter layout exception. A 320 × 640 Home scroll/safe-area case passed. This is automated layout evidence, not screenshot inspection at every size.
- At the emulator's default scale, Home, Quran unavailable, Bookmarks unavailable, Adhkar unavailable, Settings and About were visually inspected. No clipping, overflow, or overlap was observed in those screenshots. The screen is a data-free foundation; actual reading and content are not certified.
- Flutter guideline checks passed for compact Home touch targets, labeled tap targets, and text contrast in light and dark. Existing component tests cover enabled/disabled buttons and icon labels; the new semantics test verifies one selected Arabic tab node. TalkBack, VoiceOver, actual keyboard traversal, and a full screen contrast assessment remain pending.
- Repeated widget Back sequences passed. A separate Android emulator Back-only reproduction returned from Quran to Home at default scale. A prior launcher screenshot was taken immediately after changing system night mode and does not establish a navigation bug.
- IBM Plex Sans Arabic remained the app theme family, with all four bundled font assets and license already checked by existing tests. Captured Arabic headings and labels were readable at default scale and in a clear 2.0 Home frame. Device glyph shaping, diacritic clearance, mixed-script punctuation, and screen-reader pronunciation need human review.
- Airplane-mode startup reached the current Home shell on the emulator. Core Quran reading is not implemented and therefore cannot pass an offline reading check.

## Change and release boundaries

No production source, dependency, religious content, license notice, native permission, network service, analytics, or CI workflow changed in Task 010. New tests and these quality records preserve the approved A2 design, four tabs, GoRouter 18.1.4, Lucide abstraction and IBM Plex Sans Arabic. The recommendation is **CONDITIONAL GO for continued development and owner review, not release clearance**. UI010-01 remains unresolved at HIGH severity; Android TalkBack/iOS VoiceOver checks and device-level ANR diagnosis are still required. Religious and source approvals remain separate release gates.
