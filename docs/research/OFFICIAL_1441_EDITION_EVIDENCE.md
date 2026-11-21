# Official 1441H edition evidence

**Checked:** 2026-11-21 (Asia/Riyadh). **Target:** the owner's Madinah Mushaf 1441H, Hafs 'an Asim, 604-page decision [E0]. This document records evidence; it does not certify an edition or approve assets. No Quran asset was acquired.

## Evidence and authority

| ID | Source (accessed 2026-11-21) | What it establishes |
|---|---|---|
| E0 | [Approved MVP decisions](../decisions/APPROVED_MVP_DECISIONS_2026-11-16.md) (2026-11-16) | Product target and release gates, not a publication record. |
| E1 | [King Fahd Complex, Mushaf printing product](https://qurancomplex.gov.sa/mushaf-printing) | Primary publisher's Hafs digital vector-page product, its review account, published use terms, and a download SHA-256. The page does **not** state 1441H or identify QCF4. |
| E2 | [King Fahd Complex home page](https://qurancomplex.gov.sa/) | Publisher identity and current listing of Hafs editions, fonts, official app and developer platform. Detailed Hafs edition catalogue and developer platform are marked coming soon. |
| E3 | [Ahmad ElGharib, QCF4 post](https://t.me/quranfont/1539), readable in [channel context](https://t.me/s/quranfont/1537) | Font preparer's assertion that a 47-file QCF4 version represents the 1441H fourth Madinah font, Hafs, with Uthman Taha calligraphy and Complex production. This is **not** a Complex publication record. |
| E4 | [QCF4 README at pinned commit](https://github.com/MohamadHajjRabee/quran-qcf4/blob/5130511027e769f0a8f4eeb7f00f46bde3788d60/README.md) | Repository maintainer's edition and layout claims, not independent verification. |
| E5 | [Pinned QCF4 Git tree](https://api.github.com/repos/MohamadHajjRabee/quran-qcf4/git/trees/5130511027e769f0a8f4eeb7f00f46bde3788d60?recursive=1) | 604 numbered page JSON paths; inventory only. |
| E6 | [Quran Android issue #1244](https://github.com/quran/quran_android/issues/1244) | A **third-party 2020 claim** links a supposed 1441H Illustrator archive at the Complex's former digital-media host. This is a research lead, not publisher authentication or a grant. |

## Publication identity

The King Fahd Complex for the Printing of the Holy Quran in Madinah is the named primary publisher of the Madinah Mushaf and describes its own Hafs digital vector product [E1, E2]. Its product page says the vector product was prepared under Uthman Taha's supervision and reviewed by scientific and monitoring committees, including page comparison with the original print [E1]. Those statements apply to **that product**. They do not authenticate the separate GitHub JSON or font files [E1, E4].

The accessible official pages did not identify a 1441H print colophon, print run, catalogue number/ISBN, revision identifier, plate or font version, or a reference artifact explicitly labeled 1441H [E1, E2]. The exact 1441H publication record and approved physical or digital comparison copy are therefore **unverified**. The official vector product is described as a Hafs Illustrator-format archive (423.3 MB) with published SHA-256 C2FA8D93A7C4F689B58EB32756E1AE56CD1B7CE4826F63E09723BE8B092224FB; its edition year and relation to the QCF4 repository are unstated [E1]. This is the publisher's posted hash, **not** a locally checked checksum; the archive was not downloaded.

E6 points to the former official-host path [1441-AI-hafs.zip](https://dm.qurancomplex.gov.sa/Download/1441-AI-hafs.zip). A metadata-only HTTP HEAD check on 2026-11-21 returned a redirect to the current Complex host and then **404**. No archive bytes were downloaded. The filename and third-party comment suggest a historical 1441H product, but do not establish its present official availability, identity with E1's archive, contents, or rights [E1, E6].

## Layout and distinguishing details: evidence limits

| Characteristic | Evidence | Status for exact 1441H target |
|---|---|---|
| Page count | Owner selected 604 pages [E0]; pinned tree has 604 page JSON paths [E5]. | **Not independently matched** to an official 1441H reference. |
| Line arrangement and page breaks | QCF4 README describes ordered per-page lines and one page font [E4]. | Exact line counts, breaks, margins, and baselines **unverified** against official pages. |
| Surah headings and ornaments | README describes QBSML heading/ornament glyphs and page item types [E4]. | Placement, styles, spelling and edition correspondence **unverified**. |
| Bismillah handling | README includes a distinct Bismillah item and an index flag; its word-type and QBSML sections disagree about the font used [E4]. | Exact exceptions, placement, font and ayah association **unverified**. |
| Fourth-edition font traits | Font preparer claims 47 files, improved letter/diacritic forms, removed interword gaps, and revised verse-end marker compared with QCF2 [E3]; README repeats these claims [E4]. | Useful identification clues, **not** an official edition certification or page match. |
| Ayah interaction | Owner requires exact ayah keys and validated hit regions [E0]; README documents verse keys, not page coordinates [E4]. | **Unverified**. |

The font preparer's channel also describes a different QCF4 distribution with **604 font files** ([channel search context](https://t.me/s/QuranFont), accessed 2026-11-21), whereas E3 and E4 describe 47 main files. The shared QCF4 name does not prove binary or edition equivalence. Request exact original filenames, versions, hashes, and generation history before comparing either package. No asset is approved on this evidence.

## Required authoritative reference

Ask the Complex to identify the exact 1441H Hafs print publication and provide or point to an authorized 604-page reference, colophon/edition metadata, page dimensions, line scheme, heading and Bismillah conventions, correction history, and an original checksum. Ask whether the E1 vector archive is identical to that print edition and whether the E3/E4 47-file fonts derive from an authorized Complex source. Record the Complex's written answer and reviewer sign-off before moving any source into the app [E0–E4].
