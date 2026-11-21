# Owner decisions for the interface design system

> **Current typography decision, 2026-11-22:** The owner explicitly replaced Thmanyah with **IBM Plex Sans Arabic** for application interface text. The original IBM TTF files and OFL notice are now bundled; see [source and integration record](IBM_PLEX_SANS_ARABIC.md). The earlier Thmanyah rows and questions below document historical Task 004–006 decisions and are **superseded** for the interface. Mushaf typography is unchanged.

> **Historical Task 006 update, 2026-11-22:** The owner approved integrating `lucide_icons_flutter` 4.0.3 after technical/license checks. That exact version is pinned and used only in the shared icon adapter. At that time, the owner reported local licensed access to original Thmanyah files; app embedding, app-store redistribution and public-repository distribution had not been cleared. The app then used a fallback interface font.

> **Historical Task 005 update, 2026-11-22:** The owner approved **A2 — Elegant & Traditional: Calm & Balanced**, including the supplied light/dark palette and restrained surface treatment. Thmanyah was then the chosen interface family, but its binaries and Flutter packaging were **not cleared**. Lucide was the preferred icon direction, before the later Task 006 package approval; see [package audit](LUCIDE_DEPENDENCY_AUDIT.md). The original Task 004 decision record below is retained for provenance.

**Historical record, 2026-11-21 (Asia/Riyadh):** The owner then selected Thmanyah for the interface and kept the Quran Mushaf font separate. That interface preference was superseded by the IBM Plex Sans Arabic decision above. The existing [approved MVP decisions](../decisions/APPROVED_MVP_DECISIONS_2026-11-16.md) retain the 1441H Hafs target and release gates.

| Decision | State | Evidence / next owner action |
|---|---|---|
| Primary **interface** font family: IBM Plex Sans Arabic | **Approved replacement** by owner, 2026-11-22 | Bundled from [IBM's official repository](https://github.com/IBM/plex) under OFL-1.1; [implementation record](IBM_PLEX_SANS_ARABIC.md). |
| Former interface preference: Thmanyah | **Superseded 2026-11-22** | Historical Task 004 choice; no Thmanyah binary is in the repository or app. |
| Former heading role: Thmanyah Serif Display | **Superseded** | IBM Plex Sans Arabic now supplies the display role with size/weight hierarchy. |
| Former controls/navigation role: Thmanyah Sans | **Superseded** | IBM Plex Sans Arabic now supplies these roles. |
| Former longer-copy option: Thmanyah Serif Text | **Superseded** | No Serif Text asset is bundled. |
| Visual direction A2 and supplied light/dark palette | **Approved 2026-11-22** | Implemented as interface tokens; component contrast remains subject to testing and device review. No navigation redesign approved. |
| Spacing and shape values supplied in Task 005 | **Approved for foundation** | Implemented 4, 8, 12, 16, 24, 32 dp; 8, 14, 18, 20 dp radii. Font metrics and responsive behavior still need device review. |
| Lucide icon direction and `lucide_icons_flutter` 4.0.3 | **Integration approved in Task 006, 2026-11-22** | Version pinned and mapped through the shared adapter; licenses and technical checks in [LUCIDE_DEPENDENCY_AUDIT.md](LUCIDE_DEPENDENCY_AUDIT.md). |
| Historical Thmanyah acquisition and handling | **Superseded; no acquisition** | The [Thmanyah license](https://font.thmanyah.com/licenses) (accessed 2026-11-21) was not cleared for this app's packaging. No Thmanyah file is bundled. |
| Historical Thmanyah Android/iOS embedding question | **Superseded for current font** | The [historical audit](THMANYAH_TYPOGRAPHY.md) remains for provenance; IBM Plex Sans Arabic uses a separate OFL grant. |
| Mushaf font, page source and layout | **Separate; unresolved** | Preserve the existing [source approval gates](../SOURCE_APPROVAL_REGISTER.md); IBM Plex Sans Arabic must never substitute for the 1441H Mushaf typeface. |

## Historical Task 004 questions — no longer implementation gates for IBM Plex

1. Will Thmanyah give written confirmation that original unmodified files may be delivered inside ordinary Flutter Android APK/AAB and iOS IPA packages, even though those packages can expose asset files to inspection? If not, what **specific authorized packaging method** satisfies its license?
2. May an authorized builder hold original files in a private CI secret/artifact store or private repository, with restricted access and no public raw-font commit? What notices and version records are required? The current public GitHub repository must not receive raw binaries without a separate written grant.
3. Which exact original release, formats, internal family names, files and numeric weights are supported? Are OpenType stylistic alternates supported consistently in Flutter on both platforms?
4. Whether optional Serif Text should be used for long-form interface copy after licensed-file readability testing. The visual direction is A2.

**Suggested written clarification, not sent:** “For Al-Falah, may we embed unmodified Thmanyah Serif Display, Serif Text and Sans font files in standard Flutter Android APK/AAB and iOS IPA asset bundles distributed through app stores, including a commercial app? The files would be excluded from our public Git repository. Standard app archives may allow asset inspection or extraction; does this meet your license, and if not, what packaging and private-build handling do you authorize?” The license lists **Ask@thmanyah.com** for exceptions and custom uses ([Arabic license](https://font.thmanyah.com/licenses), accessed 2026-11-21). Do not send without owner authorization.
