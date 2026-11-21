# Religious Content Policy and Provenance

## Absolute rule
No coding agent may author, generate, reconstruct, paraphrase, normalize, or silently correct canonical Quran text or other religious content.

## Source approval states
- `PROPOSED`: discovered, not approved.
- `LICENSE_REVIEW`: source content identified; redistribution terms under review.
- `CONTENT_REVIEW`: content and references under qualified review.
- `APPROVED`: owner has approved source, exact edition/version, license, attribution, and required review.
- `REJECTED`: must not be used.

Nothing may be bundled in a release unless its state is `APPROVED`.

## Candidate source register

### Quran text — Tanzil Project
Status: `PROPOSED — NOT APPROVED`

Official references:
- https://tanzil.net/docs/Text_License
- https://tanzil.net/download/

The published terms allow verbatim copying/distribution, prohibit changing the text, require clear source attribution and a link to Tanzil, and require the copyright notice in copies and derived files containing a substantial portion of the text.

The download page identifies version 1.1 (February 2021); check the official page for updates before each content release.

Required owner decisions:
- Exact text type/edition and download format.
- Whether it meets the intended script/rendering requirements.
- Required notices and attribution placement.
- Independent validation and qualified review plan.

Do not import the dataset until approval is recorded.

### Translations — QuranEnc
Status: `PROPOSED — NOT APPROVED`

Official terms: https://quranenc.com/en/home/about/terms

Review the exact translation, translator, edition, version, attribution, and current redistribution terms. Do not assume all translations have identical permissions.

### Quran Foundation / Quran.com
Status: `REFERENCE ONLY — NOT APPROVED FOR OFFLINE REDISTRIBUTION`

Developer terms: https://api-docs.quran.com/legal/developer-terms/

Do not assume API access permits bundling or redistributing raw content offline.

### Hadith, adhkar, duas, tafsir
Status: `NO SOURCE APPROVED`

For every collection, verify exact book/edition, publisher, text, references, authenticity/grading where relevant, redistribution rights, attribution, and qualified review. Omit content if trust or licensing cannot be established.

### Audio recitations
Status: `NO RECORDINGS APPROVED`

For every recitation, identify rights holder, source, license, permission for in-app download and offline playback, redistribution/commercial-use scope, and required attribution. No unofficial mirrors or arbitrary scraping.

## Required provenance record
Each content item or collection must record:
- content ID/type
- source title and author/publisher
- official URL/bibliographic reference
- edition/version/date
- license and permission evidence
- download date and SHA-256 checksum
- attribution text
- reviewer and approval date
- validation result
- permitted transformations

## Canonical text integrity
- Preserve source bytes/code points after parsing only the container format.
- No Unicode normalization, diacritic stripping, tatweel removal, punctuation cleanup, or substitution on canonical Quran text.
- Search normalization, if needed, must be a separate derived index.
- Copy/share must use canonical source text and correct verse references.
- Automated checks do not replace human/religious review.
