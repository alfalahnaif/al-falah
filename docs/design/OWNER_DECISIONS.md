# Owner decisions for the interface design system

> **Task 005 update, 2026-11-22:** The owner approved **A2 — Elegant & Traditional: Calm & Balanced**, including the supplied light/dark palette and restrained surface treatment. Thmanyah remains the chosen interface family but its binaries and Flutter packaging are **not cleared**. Lucide is the preferred icon direction, **not authorization to install** `lucide_icons_flutter`; see [package audit](LUCIDE_DEPENDENCY_AUDIT.md). The original Task 004 decision record below is retained for provenance.

**Recorded:** 2026-11-21 (Asia/Riyadh). This is a decision register, not approval to download fonts, change screens or distribute binaries. The owner's current instruction selects **Thmanyah Font as the primary interface typeface** and explicitly keeps the Quran Mushaf font separate. The existing [approved MVP decisions](../decisions/APPROVED_MVP_DECISIONS_2026-11-16.md) retain the 1441H Hafs target and release gates.

| Decision | State | Evidence / next owner action |
|---|---|---|
| Primary **interface** font family preference: Thmanyah | **Approved preference** by owner in Task 004, 2026-11-21 | [Official family site](https://font.thmanyah.com/) (accessed 2026-11-21). This does not approve particular binaries or packaging. |
| Major heading role: Serif Display | **Proposed** | Review typography specimens after permitted file access and small-screen testing. |
| Controls/navigation role: Sans | **Proposed** | Review actual weights, metrics and platform rendering. |
| Longer interface copy: Serif Text | **Optional proposal** | Decide only after readability comparison with Sans. |
| Visual direction A2 and supplied light/dark palette | **Approved 2026-11-22** | Implemented as interface tokens; component contrast remains subject to testing and device review. No navigation redesign approved. |
| Spacing and shape values supplied in Task 005 | **Approved for foundation** | Implemented 4, 8, 12, 16, 24, 32 dp; 8, 14, 18, 20 dp radii. Font metrics and responsive behavior still need device review. |
| Lucide icon direction | **Preferred; package installation pending** | Version and license audit in [LUCIDE_DEPENDENCY_AUDIT.md](LUCIDE_DEPENDENCY_AUDIT.md); framework icons currently sit behind a semantic mapping. |
| Thmanyah font acquisition and public-source handling | **Not approved** | The [license](https://font.thmanyah.com/licenses) (accessed 2026-11-21) prohibits standalone file redistribution/upload; owner should approve a compliant private handling plan only after Thmanyah's written clarification. |
| Android/iOS compiled-app embedding and store distribution | **License clarification required** | Confirm whether standard Flutter asset bundles meet the no-independent-extraction restriction; see [typography audit](THMANYAH_TYPOGRAPHY.md). |
| Mushaf font, page source and layout | **Separate; unresolved** | Preserve the existing [source approval gates](../SOURCE_APPROVAL_REGISTER.md); Thmanyah must never substitute for the 1441H Mushaf typeface. |

## Questions to resolve before a font implementation task

1. Will Thmanyah give written confirmation that original unmodified files may be delivered inside ordinary Flutter Android APK/AAB and iOS IPA packages, even though those packages can expose asset files to inspection? If not, what **specific authorized packaging method** satisfies its license?
2. May an authorized builder hold original files in a private CI secret/artifact store or private repository, with restricted access and no public raw-font commit? What notices and version records are required? The current public GitHub repository must not receive raw binaries without a separate written grant.
3. Which exact original release, formats, internal family names, files and numeric weights are supported? Are OpenType stylistic alternates supported consistently in Flutter on both platforms?
4. Whether optional Serif Text should be used for long-form interface copy after licensed-file readability testing. The visual direction is A2.

**Suggested written clarification, not sent:** “For Al-Falah, may we embed unmodified Thmanyah Serif Display, Serif Text and Sans font files in standard Flutter Android APK/AAB and iOS IPA asset bundles distributed through app stores, including a commercial app? The files would be excluded from our public Git repository. Standard app archives may allow asset inspection or extraction; does this meet your license, and if not, what packaging and private-build handling do you authorize?” The license lists **Ask@thmanyah.com** for exceptions and custom uses ([Arabic license](https://font.thmanyah.com/licenses), accessed 2026-11-21). Do not send without owner authorization.
