# Navigation foundation — Task 008

**Implemented:** 2026-11-22 on `feat/navigation-foundation`. This is a route foundation, not the final navigation layout or a reader implementation. The approved A2 theme, IBM Plex Sans Arabic, Lucide adapter, Arabic locale and system light/dark selection remain active.

## Dependency and boundaries

`go_router` **18.1.4** is pinned in `pubspec.yaml` and `pubspec.lock`. It is published by Flutter's verified `flutter.dev` publisher, supports Android/iOS and the other Flutter platforms, and requires Dart `^3.12.0` and Flutter `>=3.44.0`. The project uses Dart 3.14.0 / Flutter 3.50.0. Version 18.0.0 migrated to `material_ui` and `cupertino_ui`, which matches this project's installed Material package. Sources, accessed 2026-11-22: [pub.dev version page](https://pub.dev/packages/go_router/versions/18.1.4), [tagged pubspec](https://github.com/flutter/packages/blob/go_router-v18.1.4/packages/go_router/pubspec.yaml), [changelog](https://github.com/flutter/packages/blob/go_router-v18.1.4/packages/go_router/CHANGELOG.md).

The [tagged BSD-3-Clause license](https://github.com/flutter/packages/blob/go_router-v18.1.4/packages/go_router/LICENSE) (accessed 2026-11-22) requires the copyright, conditions and disclaimer to accompany binary distribution. Its original text is bundled at `assets/licenses/GO_ROUTER_LICENSE.txt`; the About shell opens Flutter's `LicensePage` for dependency notices. The resolved graph adds `go_router 18.1.4`, `logging 1.3.0` (BSD-3-Clause) and SDK `flutter_web_plugins`; `collection`, `cupertino_ui`, `material_ui` and `meta` were already resolved. `flutter pub deps --style=compact` confirmed the graph. `go_router` is a Dart/Flutter package without a native plugin, new permission, or runtime network API; routing is local. No code generation or routing companion package was added. Its public development status is feature-complete with maintenance focused on fixes ([package page](https://pub.dev/packages/go_router/versions/18.1.4), accessed 2026-11-22).

## Route ownership

`lib/app/router/app_routes.dart` owns stable names and paths. `AppRouter.create()` owns the single route table and Arabic unknown-route builder. `AlFalahApp` constructs one router per app instance in `State`, injects it into `MaterialApp.router`, and disposes its own router; tests may inject a separate router. Feature widgets depend on route **names** for navigation, not literal paths. No global mutable router or navigation-service interface exists.

| Name | Path | Widget | Status |
|---|---|---|---|
| `home` | `/` | `HomePage` | Existing shell plus three neutral navigation actions |
| `surahIndex` | `/surahs` | `SurahIndexPage` | Data-free unavailable shell; no Surah metadata |
| `bookmarks` | `/bookmarks` | `BookmarksPage` | Data-free unavailable shell; no persistence |
| `settings` | `/settings` | `SettingsPage` | Data-free shell and About action |
| `about` | `/about` | `AboutPage` | Sources pending; Flutter software-license view available |

The initial location is `/`. Home uses `pushNamed` to open the three implemented destinations; Settings uses it for About. App-bar back uses `pop` when a prior route exists and returns Home when a path was opened directly. System back is handled by the Router/Navigator stack. An unknown path shows a themed Arabic error with a Home action. There are no redirects, guards, authentication checks, network-dependent startup steps, route parameters, or nested navigation shells.

The route-layer `FeatureShell` owns the SafeArea, title semantics, directional back icon and neutral unavailable surface. Individual feature pages own their titles and messages. Keeping the shell under `app/router` avoids making general shared widgets depend on route configuration. The `AppIcon` adapter supplies the RTL-aware back arrow; feature screens do not import Lucide directly. Text follows system scaling. The About software-license action uses Material's `showLicensePage`, not a remote site.

## Later destinations and decisions

The product requirements also name splash/initialization, onboarding, Quran reading, search, verse actions, audio catalogue/downloads/player and adhkar. They have **no registered routes or working screens** in this task. No Quran reader path exists until source, rights, mapping and qualified-review gates are satisfied. No placeholder verse, page or ID is used.

The bottom navigation count, order and labels are an **open owner decision**. A persistent tab layout may later warrant `StatefulShellRoute` when independent branch history/state is actually required. The present route-driven actions do not commit to tabs. Public deep links may later use stable route names and approved canonical identifiers; no Android App Links, iOS Universal Links, custom schemes or Quran URL patterns are configured now.

## Verification boundary

Widget tests cover initial route, direct path entry, action navigation, stacked and system back, unknown paths, router stability after parent rebuild, Arabic RTL, semantics labels, light/dark theme, IBM typography and 100%/150%/200% scaling on a narrow test surface. Tests and an APK build do not prove physical-device TalkBack/VoiceOver reading order, keyboard focus, Android/iOS link handling, or airplane-mode behavior. Those remain manual checks before release.
