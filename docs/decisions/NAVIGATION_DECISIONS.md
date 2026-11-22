# Navigation decisions — 2026-11-22

**Approved by:** owner Task 008 request, subject to the stated technical and license audit. **Implemented scope:** five route destinations and neutral shell views. See [navigation architecture](../architecture/NAVIGATION_ARCHITECTURE.md).

| Decision | State | Reason |
|---|---|---|
| Pin `go_router` 18.1.4 | Implemented | Official Flutter publisher, compatible Dart/Flutter and `material_ui` constraints, BSD-3-Clause notice bundled. |
| `MaterialApp.router` with one router per app instance | Implemented | Keeps route state stable across widget rebuilds and allows test injection. |
| Home route-driven actions | Implemented, temporary presentation | Tests navigation without asserting an unapproved bottom-tab count/order. |
| Dedicated feature-local Surah Index, Bookmarks, Settings and About widgets | Implemented as data-free shells | Establishes route ownership without fabricated content or persistence. |
| Reader, search, audio, adhkar, onboarding and their nested routes | Deferred | No current navigation need or approved content/data workflow for these screens. |
| Persistent bottom navigation or `StatefulShellRoute` | **Owner decision pending** | Tab count, order, labels and independent branch-state needs are not finalized. |
| External deep-link patterns and native link association | **Owner decision pending** | Stable canonical IDs and link policy are not approved; no native configuration changed. |

The 1441H Hafs Mushaf target and source-approval gates remain unchanged. This decision does not approve any Quran asset, page renderer, verse interaction or new network service.
