# Al-Falah interface design system

> **Typography decision, 2026-11-22:** The interface now uses bundled [IBM Plex Sans Arabic](IBM_PLEX_SANS_ARABIC.md). The earlier Thmanyah preference and fallback-font status in historical Task 004–006 documents are superseded. The Mushaf font remains separate.

**Implemented:** 2026-11-22. **Direction:** owner-approved A2, Elegant & Traditional: Calm & Balanced. These are interface tokens only. The 1441H Hafs Mushaf has separate source, typography and rights gates in [the source approval register](../SOURCE_APPROVAL_REGISTER.md).

## Where to use each layer

| Need | Use | Owner |
|---|---|---|
| Semantic colors, spacing, radii, icon sizes and text roles | `AppColors.of(context)`, `AppSpacing`, `AppShapes`, `AppIconSizes`, `Theme.of(context).textTheme` | [`app_tokens.dart`](../../lib/app/theme/app_tokens.dart) |
| Light/dark Material theme and component defaults | `AppTheme.light`, `AppTheme.dark`; application chooses `ThemeMode.system` | [`app_theme.dart`](../../lib/app/theme/app_theme.dart), [`app.dart`](../../lib/app/app.dart) |
| Filled, outlined or text action with optional leading icon/loading | `AppButton` and `AppButtonVariant` | [`app_button.dart`](../../lib/shared/widgets/app_button.dart) |
| Quiet bordered card, optionally interactive | `AppCard` | [`app_card.dart`](../../lib/shared/widgets/app_card.dart) |
| Implemented semantic icons and labeled icon actions | `AppIcon`, `AppIconButton`, `AppIconName` | [`app_icon.dart`](../../lib/shared/icons/app_icon.dart) |

Feature widgets should consume semantic roles, use directional layout, and let the system scale text. Add a semantic icon name only when an implemented feature needs it. `AppIconButton` requires a spoken label. Native Material controls are preferred when the wrapper adds no application behavior. Business rules and feature data stay outside theme and widget classes.

## Active token values

| Role | Light | Dark |
|---|---|---|
| background | `#F8F3E9` | `#211C22` |
| surface | `#FFFDF8` | `#302831` |
| surfaceVariant | `#F2E8DD` | `#423844` |
| primary / onPrimary | `#472C43` / `#FFFDF8` | `#E9DCE8` / `#211C22` |
| secondary / onSecondary | `#6F553C` / `#FFFDF8` | `#C8AC8B` / `#211C22` |
| onSurface / onSurfaceVariant | `#302831` / `#675C58` | `#F9F4F4` / `#C6B8BE` |
| outline / divider | `#8C817C` / `#D4C5BD` | `#A99BA5` / `#695D69` |
| disabled | `#675C58` | `#C6B8BE` |
| error / success / warning | `#A5222C` / `#2C6649` / `#79520F` | `#FFB4AB` / `#A6D8B6` / `#F0C987` |
| focusIndicator / mutedGold | `#365EA8` / `#BEA27D` | `#AAD0FF` / `#C8AC8B` |

Gold is decorative; use `primary`, `onSurface` or another tested semantic foreground for small text. `outline` is for meaningful control boundaries; `divider` is deliberately subtle and does not carry a state by itself. Error/success/warning should also have a label or icon. Contrast tests use the [WCAG 2.2 text](https://www.w3.org/WAI/WCAG22/Understanding/contrast-minimum.html) and [non-text](https://www.w3.org/WAI/WCAG22/Understanding/non-text-contrast.html) thresholds (accessed 2026-11-22).

Spacing is `4, 8, 12, 16, 24, 32` logical pixels. Radii are `8` controls, `14` buttons, `18` cards and `20` large containers. Regular icons are `24` and compact icons `20`; interactive targets use at least `48` logical pixels. Standard cards have zero elevation and a 1px quiet divider border. Dialogs alone use minimal elevation. The active display/headline/title/body/label/caption scale is in `AppTypography`; its sizes and line heights are provisional until font testing.

## Font and icon integration gates

`AppTypography.family` names the bundled IBM Plex Sans Arabic interface family. Four original TTF weights are declared in `pubspec.yaml` and the OFL notice is bundled. `AppTheme` applies the family to both color schemes. See the [source and license record](IBM_PLEX_SANS_ARABIC.md). Never use this interface theme for Mushaf content. Future font changes should update this central token and theme, then recheck Arabic layout on devices.

`AppIcon` maps only the implemented home/back semantics to the owner-approved, pinned Lucide 4.0.3 package. Feature widgets use `AppIconName` and must not import Lucide directly. Back chooses the correct outlined left/right icon from ambient directionality. The shared `AppIconButton` exposes one labeled semantics node for enabled and disabled states while retaining the visible tooltip; see the [dependency and notice audit](LUCIDE_DEPENDENCY_AUDIT.md).

## Verification still needed on devices

Widget tests cover token values and selected contrast pairs, Arabic locale/RTL, icon direction, component behavior and a narrow 200% text-scale shell. Run TalkBack and VoiceOver, inspect keyboard focus, high contrast, mixed Arabic/English punctuation, actual system scaling and small-screen rendering on Android and iOS. The tests do not certify those platform behaviors. Flutter's [accessibility guidance](https://docs.flutter.dev/ui/accessibility/ui-design-and-styling) and [testing guidance](https://docs.flutter.dev/ui/accessibility/accessibility-testing) were accessed 2026-11-22.
