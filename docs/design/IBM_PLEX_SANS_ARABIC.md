# IBM Plex Sans Arabic interface font

**Owner decision:** On 2026-11-22, the owner replaced the earlier Thmanyah interface-font preference with **IBM Plex Sans Arabic**. The A2 colors, spacing, component behavior and Lucide icons remain. This font is used for application interface text only; the approved 1441H Hafs Mushaf typography and source gates remain separate.

## Source and license

The four unmodified TTF files came directly from IBM's [official Plex repository](https://github.com/IBM/plex) at commit [`2e90fe366fdc27c12682db13e5aa20ded3d90908`](https://github.com/IBM/plex/commit/2e90fe366fdc27c12682db13e5aa20ded3d90908), accessed 2026-11-22. The [Arabic package](https://github.com/IBM/plex/tree/2e90fe366fdc27c12682db13e5aa20ded3d90908/packages/plex-sans-arabic) identifies version **1.1.0** and OFL-1.1. Its [license](https://github.com/IBM/plex/blob/2e90fe366fdc27c12682db13e5aa20ded3d90908/packages/plex-sans-arabic/LICENSE.txt) is SIL Open Font License 1.1, copyright © 2017 IBM Corp., Reserved Font Name “Plex”. OFL permits original fonts to be bundled and redistributed with software if each copy contains the copyright notice and license. The original license is included unmodified at [`IBM_PLEX_SANS_ARABIC_LICENSE.txt`](../../assets/licenses/IBM_PLEX_SANS_ARABIC_LICENSE.txt) and declared as a Flutter asset. These files are not sold alone or modified. The npm package was **not** installed; its telemetry dependency is absent from the Flutter app.

| Original TTF | Declared Flutter weight | Internal family / PostScript name | Font version | SHA-256 |
|---|---:|---|---|---|
| [`Regular`](../../assets/fonts/ibm_plex_sans_arabic/IBMPlexSansArabic-Regular.ttf) | 400 | `IBM Plex Sans Arabic` / `IBMPlexSansArabic` | 1.005 | `8e0f1046c736bf939d4939ee3ae0116acf61cbcd6592deae7656761627080981` |
| [`Medium`](../../assets/fonts/ibm_plex_sans_arabic/IBMPlexSansArabic-Medium.ttf) | 500 | `IBM Plex Sans Arabic Medm` / `IBMPlexSansArabic-Medm` | 1.005 | `eef162792cf2a6ba5af7943af9f86843b1286ab67aaf615c18c07fd8e97a4a90` |
| [`SemiBold`](../../assets/fonts/ibm_plex_sans_arabic/IBMPlexSansArabic-SemiBold.ttf) | 600 | `IBM Plex Sans Arabic SmBld` / `IBMPlexSansArabic-SmBld` | 1.005 | `1d4ab8b6ebadbb9d85f2ecdcb7cb0bb672420a8ff3388ab4f69d7b98056562aa` |
| [`Bold`](../../assets/fonts/ibm_plex_sans_arabic/IBMPlexSansArabic-Bold.ttf) | 700 | `IBM Plex Sans Arabic` / `IBMPlexSansArabic-Bold` | 1.005 | `b74f809dead12442ed56e02a12c3bcc02076c9ad4e32f17d0a9ca6fc1aafc89e` |

The downloaded binaries' Git blob IDs matched the official repository entries. Local OpenType inspection found 95 printable basic Latin characters, 252 U+0600–06FF code points, ten Western digits and ten Arabic-Indic digits in each file. This is code-point coverage evidence, **not** a claim that shaping, diacritic placement or fallback has been visually verified on devices.

## Integration

`pubspec.yaml` declares one Flutter family alias, **IBM Plex Sans Arabic**, with four explicit weights. `AppTypography.family` is the single interface family token; `AppTheme` applies it to the Material theme and semantic text roles. Display/headline/title/label roles retain their current size and `w600` hierarchy, now backed by the original SemiBold file. Body roles explicitly use `w400`. Material defaults can select `w500` and `w700` without synthesizing those weights. No letter spacing was added to Arabic text. Flutter's custom-font guide documents the family alias, weight declarations and asset bundling ([Flutter documentation](https://docs.flutter.dev/cookbook/design/fonts), accessed 2026-11-22).

IBM Plex Sans Arabic replaces the planned Serif Display/Sans split. Editorial hierarchy now comes from size and weight within one family; no visual layout or product navigation changed. Unsupported glyphs use Flutter/platform fallback. There is no runtime font download or new package.

## Verification boundary

Widget tests verify bundled assets, family and weight tokens, light/dark themes, RTL, and a neutral mixed Arabic/English fixture at 100%, 150% and 200% text scale. Android debug APK build and asset inspection verify packaging. Manual Android and iOS review is still required for joining, mark clearance, punctuation, mixed-script bidi behavior, focus/reading order and small-screen appearance. An iOS build cannot be verified from this Windows host. The font must never be applied to Mushaf pages.
