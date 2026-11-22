# Navigation decisions — 2026-11-22

## Task 009 owner decision — active

The owner approved **Option A**: exactly four permanent tabs in RTL logical-start order **الرئيسية → القرآن → المحفوظات → الأذكار**. The bottom-tab count, order and labels are no longer open. Settings and About/Licenses stay secondary. The approved route paths `/`, `/surahs`, `/bookmarks`, `/settings` and `/about` remain unchanged; `/adhkar` is added. The Task 008 route-driven Home buttons are superseded by the tab bar and focused Home quick actions.

| Decision | State | Reason |
|---|---|---|
| `StatefulShellRoute.indexedStack` with four branches | Implemented | Retains independent branch widget/navigation state without a new package. |
| Re-select active tab to return to its branch root | Implemented | Predictable tab behavior via `goBranch(initialLocation: true)`. |
| Android back at non-Home tab root selects Home | Implemented | Tabs are peer destinations; secondary routes still pop to their origin. Home-root back remains platform controlled. |
| Two-row navigation at narrow width or large text | Implemented | Keeps four labels/actions visible without capping system text scaling. |
| Quran/Bookmarks/Adhkar tab content | Unavailable shells | Canonical content, rights and persistence work remain separate approvals. |

See [current architecture](../architecture/NAVIGATION_ARCHITECTURE.md). No Quran reader, religious content, network service or new native permission is approved by this decision.

## Historical Task 008 record

**Approved by:** owner Task 008 request, subject to the stated technical and license audit. **Implemented scope:** five route destinations and neutral shell views. See [navigation architecture](../architecture/NAVIGATION_ARCHITECTURE.md).

| Decision | State | Reason |
|---|---|---|
| Pin `go_router` 18.1.4 | Implemented | Official Flutter publisher, compatible Dart/Flutter and `material_ui` constraints, BSD-3-Clause notice bundled. |
| `MaterialApp.router` with one router per app instance | Implemented | Keeps route state stable across widget rebuilds and allows test injection. |
| Home route-driven actions | Implemented, temporary presentation | Tests navigation without asserting an unapproved bottom-tab count/order. |
| Dedicated feature-local Surah Index, Bookmarks, Settings and About widgets | Implemented as data-free shells | Establishes route ownership without fabricated content or persistence. |
| Reader, search, audio, adhkar, onboarding and their nested routes | Deferred | No current navigation need or approved content/data workflow for these screens. |
| Persistent bottom navigation or `StatefulShellRoute` | **Superseded by Task 009** | The owner subsequently approved four tabs, now implemented above. |
| External deep-link patterns and native link association | **Owner decision pending** | Stable canonical IDs and link policy are not approved; no native configuration changed. |

The 1441H Hafs Mushaf target and source-approval gates remain unchanged. This decision does not approve any Quran asset, page renderer, verse interaction or new network service.
