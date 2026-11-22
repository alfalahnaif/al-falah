# Testing and Quality Gates

> **Navigation update, 2026-11-22:** `test/widget/navigation_test.dart` exercises Task 008's Home and four shell routes, direct paths, stacked and system back, Arabic unknown-route handling, RTL, action semantics, router stability, both themes and 100%–200% text scaling. `go_router` 18.1.4 is locked; see [navigation architecture](architecture/NAVIGATION_ARCHITECTURE.md). Physical-device back, assistive technology, offline and deep-link checks remain manual release work.

> **Typography update, 2026-11-22:** IBM Plex Sans Arabic is bundled under OFL-1.1 for interface text. CI uses the committed original TTF assets and needs no private font, secret or runtime download. `test/widget/ibm_plex_typography_test.dart` checks assets, Arabic RTL, both themes and 100%–200% neutral mixed-script layout. These tests do not replace Android/iOS visual and assistive-technology review. See [source record](design/IBM_PLEX_SANS_ARABIC.md).

## Test layers

### Unit
- Quran content manifest validation.
- Search mapping to canonical surah/ayah IDs.
- Reading position persistence.
- Bookmark CRUD.
- Adhkar counter state.
- Audio download state transitions.
- Database migration behavior.

### Widget
- RTL rendering.
- Surah list and reading states.
- Bookmark and search interactions.
- Audio controls/download states.
- Adhkar counter.
- Empty, loading, error, and offline states.
- Accessibility labels and large text.

### Integration
- First launch in airplane mode.
- Quran reading and search offline.
- Bookmark persistence after force close/relaunch.
- Download audio online and play offline.
- Interrupted download recovery.
- Upgrade without losing user data.

### Manual
- At least one representative Android device and one iPhone.
- Arabic glyph shaping, diacritics, ligatures, and font scaling.
- Background audio and interruptions.
- Low storage and denied permissions.
- Airplane mode and network transitions.

## CI checks
- Format check.
- `flutter analyze`.
- Unit and widget tests.
- Content validation when data changes.
- Dependency/license checks.
- Android/iOS build checks where runners are available.

### Task 006 workflow (2026-11-22)

`.github/workflows/flutter-checks.yml` runs on pull requests and pushes to `main` with read-only repository permission. It uses Ubuntu 24.04, [Flutter 3.50.0](https://docs.flutter.dev/install/archive) (the SDK used for local validation; Dart 3.14.0), [actions/checkout v4.2.2](https://github.com/actions/checkout/releases/tag/v4.2.2) at commit `11bd71901bbe5b1630ceea73d27597364c9af683`, and [subosito/flutter-action v2.23.0](https://github.com/subosito/flutter-action/releases/tag/v2.23.0) at commit `1a449444c387b1966244ae4d4f8c696479add0b2` (sources accessed 2026-11-22). The action's exact Flutter version input avoids the moving stable-channel SDK. It runs `flutter pub get --enforce-lockfile`, a non-writing `dart format` check, `flutter analyze`, and `flutter test`.

The workflow does not build an APK: that requires the Android toolchain and materially more runner time/storage, while this task already requires a local debug APK build. Keep local Android build validation before review/release; add a separate CI build only after runner requirements and cost are assessed. The workflow does not fetch Thmanyah or Quran assets or use secrets. A workflow file present in Git is not evidence of a successful remote run; check GitHub Actions after an owner-approved push.

## Release blockers
- Any unexplained Quran text discrepancy.
- Missing/incorrect source attribution or redistribution approval.
- Incorrect verse-reference mapping.
- User data loss.
- Audio marked downloaded while incomplete.
- Core reading requiring internet.
- Core-flow crash.
- Unreviewed security/privacy issue.

Tests prove software behavior, not religious correctness. Human/religious review remains required.
