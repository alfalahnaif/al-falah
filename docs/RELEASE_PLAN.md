# Delivery and Beta Plan

| Milestone | Deliverable | Exit criteria |
|---|---|---|
| M0 | Source/license register and approved MVP scope | Owner approves source, edition, license, and review plan |
| M1 | Flutter foundation, routing, state, local DB, CI | Android/iOS build; quality checks pass |
| M2 | Bundled Quran content, manifest, surah index, reader | Content integrity validation and offline reading pass |
| M3 | Search, bookmarks, last-read | Persistence and search tests pass |
| M4 | Audio catalogue, download manager, player | Downloaded audio works in airplane mode |
| M5 | Approved adhkar collection and counter | Provenance reviewed; local state persists |
| M6 | Accessibility, device, privacy/security hardening | No release blockers |
| M7 | Closed beta | Feedback collected and prioritized |
| M8 | MVP release | Owner approval and store requirements satisfied |

Do not estimate calendar duration until source approvals, repository state, device availability, and content preparation are known.

## Beta feedback
Use voluntary feedback and user-submitted diagnostics. Do not remotely collect reading history, location, or religious habits.

Priorities:
- P0: content integrity, privacy/security, data loss, core crash.
- P1: core usability or offline failure.
- P2: non-blocking UX issues.
- P3: post-MVP features.

Store signing keys and certificates must remain outside source control.
