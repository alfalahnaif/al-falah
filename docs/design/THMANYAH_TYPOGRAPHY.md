# Thmanyah interface typography audit

> **Task 006 readiness, 2026-11-22:** The owner reports having original Thmanyah files installed locally and a usage license. This is **reported local access**, not verification of the exact license grant or permission to embed and redistribute files in Android/iOS app packages. No Thmanyah file was accessed, copied, added to Git, or bundled in this task. The app still renders the SDK/Material fallback. Future integration remains at `AppTypography.build` and `AppTheme`, after written packaging and store-distribution clarification plus owner approval. The Mushaf font is wholly separate.

> **Task 005 implementation status, 2026-11-22:** The active theme uses the SDK/Material fallback; no Thmanyah family name or binary is configured. `AppTypography.build` in [app_tokens.dart](../../lib/app/theme/app_tokens.dart) defines semantic `TextTheme` styles and optional display/sans family parameters. Exact family identifiers and weights will be supplied only after written packaging clearance, owner approval, original-file inspection and Android/iOS readability tests. These token sizes are provisional and are not verified Thmanyah metrics. Mushaf typography remains separate.

**Status:** Thmanyah is the owner-approved **interface typeface preference**. Family roles, font files, weights, metrics and distribution method are proposals or open checks. **Research date:** 2026-11-21 (Asia/Riyadh). No font file was downloaded, installed, committed or bundled.

## Evidence

| ID | Primary source, accessed 2026-11-21 | Relevant evidence |
|---|---|---|
| T1 | [Official Thmanyah font site](https://font.thmanyah.com/) | Names three families and five named weights each; shows Arabic and English samples; recommends use in app interfaces and testing at different sizes; mentions OpenType stylistic alternates. |
| T2 | [Official Arabic license](https://font.thmanyah.com/licenses) | Controlling license language, permitted embedding, prohibited redistribution/extraction/modification, and Thmanyah contact. |
| T3 | [Official English license](https://font.thmanyah.com/licenses-en) | Translation for reference; Arabic text prevails on conflict under T2. |
| T4 | [Flutter custom-font guide](https://docs.flutter.dev/cookbook/design/fonts) and [pubspec font options](https://docs.flutter.dev/tools/pubspec) | Flutter declares family/assets and explicit numeric weights; includes font files in app asset bundle; may simulate an undeclared weight. |
| T5 | [Android APK Analyzer](https://developer.android.com/studio/debug/apk-analyzer) and [Flutter asset guide](https://docs.flutter.dev/ui/assets/assets-and-images) | APKs are inspectable ZIP files; bundled Flutter assets are accessible to platform code. These support a packaging-risk inference, not a test of Thmanyah files. |
| T6 | [Approved MVP decisions](../decisions/APPROVED_MVP_DECISIONS_2026-11-16.md) (2026-11-16) and [source decision](../research/RENDERER_SOURCE_DECISION.md) (2026-11-21) | The 1441H Mushaf source/font has separate approval gates. |

## Verified families and proposed roles

The site's labels are **thmanyah Serif Display**, **thmanyah Serif Text**, and **thmanyah Sans**. It shows five named weights for each: thin, regular, medium, bold and heavy. The site describes Display for headings, Text for articles, and Sans for digital screens [T1]. These are marketing/family labels, **not verified internal font-family names, filenames, PostScript names, numerical weight metadata or variable-font axes**. The license reserves the name “ثمانية” / “thmanyah” [T2, T3].

| UI role | Initial recommendation | Guardrail |
|---|---|---|
| Major editorial heading | Serif Display, medium or bold candidate | Use sparingly; test Arabic dots/diacritics, clipping and wrap on narrow screens [T1]. |
| Screen title and section heading | Sans medium/bold by default; Display only when space permits | Preserve a clear hierarchy at large system text settings [T1, T4]. |
| Navigation, buttons, settings, forms, labels | Sans regular/medium | Prioritize legibility and predictable line boxes on both mobile platforms [T1, T4]. |
| Longer **interface** explanations | Sans regular initially; Serif Text as an optional tested variant | Do not equate article suitability on a website with small-screen readability [T1]. |
| Numerals, English and mixed-script UI | Sans candidate with language-aware fallback | Latin samples are displayed on T1, but complete Latin, numeral, punctuation and Arabic glyph coverage is **unverified** without cmap/shaping inspection. |

Do not assign thin or heavy to dense small controls by default. Do not apply artificial letter spacing to Arabic joining text. Proposed sizes, line-height ratios and weight mapping in [tokens](DESIGN_TOKENS_PROPOSAL.md) are test starting points, **not measured Thmanyah font metrics**.

## License assessment and delivery gate

Thmanyah Publishing and Distribution identifies itself as rights holder. T2 allows personal and commercial design use, including apps, and embedding in documents/products. For mobile/software it limits embedding to a **compiled, packaged or obfuscated product**. It prohibits standalone sale/sublicensing, redistribution/upload/hosting of font files, independent extraction/access/reuse by end users or third parties, alteration/reverse engineering, derivative fonts and removal of identifying notices. The Arabic license controls; it directs custom-use questions to **Ask@thmanyah.com** [T2, T3].

**Flutter implication:** T4's ordinary route declares raw font assets in pubspec and puts them in the app asset bundle. Android's APK is an inspectable ZIP and Flutter assets remain identifiable to platform code [T4, T5]. It is therefore **not established** that a standard Flutter APK/AAB or iOS app package meets T2's no-independent-extraction condition. “Compiled app” permission alone is insufficient to declare this exact packaging method cleared. No obfuscation or subsetting workaround is approved; modifying font binaries is expressly restricted [T2]. The iOS package was not built or inspected in this task, so its actual extraction properties remain untested.

A public GitHub repository containing raw Thmanyah binaries would expose standalone files and appears inconsistent with T2's upload/redistribution ban. No such files are in this repository. A private CI or local build that obtains original files only from Thmanyah may avoid **public-source** exposure, but does not itself solve extraction from delivered apps or establish that CI storage/access is permitted. Obtain **written Thmanyah confirmation** for exact Flutter Android APK/AAB and iOS IPA embedding, normal asset-bundle extraction risk, build-system handling, app-store distribution, backups, and whether any authorized packaging protection is required. Preserve the reply and license version before implementation [T2–T5].

## Technical suitability still to verify

The official site visually demonstrates Arabic and English specimens but publishes no complete glyph inventory, cmap, file format list, binary version/hashes, measured ascent/descent/line gap, OpenType feature matrix, exact numerical weight mapping, or Android/iOS/Flutter render test in the accessible page [T1]. Without acquiring files, this audit cannot verify Arabic presentation forms, diacritics, hamza variants, Arabic-Indic/Western digits, Latin coverage, mixed-direction punctuation, fallback behavior, variable axes, small-screen pixel rendering or performance. T1 mentions stylistic alternates; do not enable them by default until the exact feature and Flutter/platform behavior are checked [T1, T4].

After written packaging permission and owner authorization, a separate technical task should inspect original file names/metadata, record source URL/date/SHA-256 and license notices, map actual files to Flutter numeric weights without synthesis, and test Arabic/English specimens at 12–32 logical pixels, 1×–2× system text scaling, Android and iOS, light/dark backgrounds, TalkBack/VoiceOver, and mixed RTL/LTR strings. Use neutral **interface** sample copy only. No Quran text or Mushaf glyphs may be used for this font test [T1, T4, T6].

## Strict Mushaf boundary

Thmanyah styles application chrome, navigation, controls and other approved **interface** text. It is never a fallback or substitute for canonical Quran text, the 1441H page layout, QCF4 or another edition-matched Mushaf font. The Mushaf renderer has its own source, rights, integrity and owner-approval gates [T6]. The design tokens must keep an explicit interface typography namespace separate from any future approved Mushaf rendering configuration.
