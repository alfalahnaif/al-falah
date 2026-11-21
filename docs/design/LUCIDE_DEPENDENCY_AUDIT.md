# Lucide Flutter dependency audit

**Checked:** 2026-11-22. **Decision:** Lucide is the owner's preferred icon direction; package installation remains **pending owner approval**. No icon package or binary was added in Task 005.

| Check | Finding and evidence |
|---|---|
| Candidate/version | [`lucide_icons_flutter` 4.0.3](https://pub.dev/packages/lucide_icons_flutter/versions/4.0.3) is the latest stable version shown by pub.dev on 2026-11-22. |
| Maintenance | Pub.dev shows a recent 4.0.3 release. This is evidence of current publication, not a long-term maintenance guarantee. Recheck before installation. |
| License/notices | The [package license](https://pub.dev/packages/lucide_icons_flutter/license) is MIT (copyright notice must accompany distributed copies). [Lucide upstream](https://lucide.dev/license) uses ISC for its work and notes legacy Feather-derived icons under MIT; inspect packaged notices and preserve applicable terms before distribution. |
| SDK/platform | Pub.dev lists Dart minimum 3.0 and Flutter support for Android/iOS. Installed SDK is Flutter 3.50.0/Dart 3.14.0, so the declared Dart floor is met. A resolver/build check is still pending because installation was not authorized. |
| Transitive dependencies | Pub.dev lists `flutter` as the only direct dependency for 4.0.3. A lockfile review after installation would verify the exact transitive graph. |
| API/architecture | The package documents `LucideIcons` and a revised v4 organization. Our `AppIconName` mapping isolates feature modules from its API and currently uses framework icons. Material UI interoperability has not been demonstrated in a compiled build. |
| Tree shaking/build | The package advertises smaller, modular icon data and improved tree shaking; actual Al-Falah APK/AAB impact and icon inclusion were **not measured**. |
| Permissions/network | An icon data package should require no runtime network or platform permissions, but its actual package contents and merged manifests remain to be checked at installation. |

Official reference: [Lucide icons](https://lucide.dev/icons/) (24px default and 2px stroke, accessed 2026-11-22). A future integration should keep outlined icons, 24dp regular/20dp compact size, theme colors, RTL-aware directional semantics and labels on interactive controls.

**Approval needed before installation:** owner approval for exact `lucide_icons_flutter` version **4.0.3** after this audit. Then pin the version, inspect the resolved lockfile and license notices, run analyzer/tests/Android and iOS checks where available, inspect bundle size and confirm tree shaking. Until then, `AppIcon` uses existing framework icons. No feature imports Lucide directly.
