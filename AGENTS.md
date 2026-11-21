# Repository Instructions — All Coding Agents

These rules are mandatory for Codex, Claude, and every automated coding assistant.

## 1. Authority and change control
- The product owner is the final decision-maker.
- Read this file and relevant `/docs` before editing.
- Do not expand MVP scope or change architecture without explicit owner approval.
- Do not add backend, hosting, cloud database, API dependency, analytics, ads, telemetry, paid service, or new major dependency without approval.
- Do not invent missing requirements. Record assumptions and ask.
- Inspect the existing code, tests, dependency lockfile, and repository state before changes.
- Work in small, reviewable tasks. Avoid unrelated refactors.
- Never delete, regenerate, rewrite, normalize, or reformat religious content files without explicit approval.
- Do not perform destructive migrations or content replacement without an approved plan.
- Never claim a command/test/build passed unless it was actually run and its output checked.

## 2. Religious-content safety — absolute
- NEVER generate, reconstruct, autocomplete, paraphrase, translate, or correct Quran text from model memory.
- NEVER use an LLM response as the source of Quran, hadith, adhkar, tafsir, asbab al-nuzul, fiqh rulings, or religious attribution.
- NEVER silently normalize, strip, replace, reorder, or alter canonical Quran characters, diacritics, pause signs, sajdah signs, or orthographic forms.
- NEVER invent verse numbers, hadith numbers, narrators, grading, source, author, or attribution.
- NEVER infer hadith authenticity or grading.
- NEVER scrape or copy religious content without checking redistribution terms and obtaining required permission.
- If source, edition, version, license, reference, or reviewer approval is missing, STOP and ask the owner.
- If a content discrepancy is found, preserve the original source and report it. Do not “fix” it.
- Automated tests do not replace qualified religious review.

## 3. Approved-content workflow
Every content collection requires a provenance record:
- content ID and type
- exact source title and publisher/author
- official URL or bibliographic reference
- edition/version/date
- license and redistribution permission evidence
- download date and original SHA-256 checksum
- required attribution
- reviewer name/role and approval date
- validation result
- allowed transformations (default: none for canonical religious text)

No content is approved merely because it is publicly accessible.

## 4. Engineering standards
- Keep UI, application logic, and data access separate.
- Use repositories as the source of truth for feature data.
- Use immutable models and unidirectional data flow.
- Use dependency injection; avoid global mutable state and hidden service locators.
- Keep widgets declarative and small; do not put business logic in widgets.
- Prefer composition over inheritance.
- Apply SOLID pragmatically; avoid speculative abstractions and over-engineering.
- Use typed errors/results; do not swallow exceptions.
- Use database transactions and explicit schema migrations.
- Keep canonical content separate from writable user data.
- Never use user-visible display strings as database identifiers.
- Add tests with each feature change.
- Pin dependencies and commit the lockfile.
- Review every dependency's maintenance, license, transitive dependencies, permissions, and Android/iOS compatibility.

## 5. Security and privacy
- No account or personal identity is required for MVP.
- No third-party analytics or advertising SDK by default.
- No background tracking.
- Request location only when a user invokes a location-dependent feature.
- Explain permissions before requesting them.
- Store data in app-private storage.
- Do not invent cryptography. Do not claim SQLite is encrypted by default.
- Do not log Quran reading history, location, notes, or personal activity unnecessarily.
- Never commit secrets, signing keys, certificates, tokens, or personal data.
- Do not export private data without explicit user action.

## 6. Offline-first
- App startup and core Quran reading must work in airplane mode after installation.
- No runtime backend, online Quran API, remote config, or online authentication.
- Bundle approved Quran text and essential metadata.
- Download audio only after explicit user action; completed downloads must play offline.
- No silent fallback to generated or unapproved content.
- A missing/invalid content manifest must fail safely.

## 7. Required workflow for every task
1. Read these instructions and relevant docs.
2. Inspect repository state and existing implementation.
3. State task, files expected to change, assumptions, risks, and test plan.
4. Ask for approval if scope, architecture, sources, licenses, dependencies, permissions, or security posture changes.
5. Implement the smallest coherent change.
6. Add/update tests.
7. Run formatter, analyzer, relevant tests, and platform build checks where available.
8. Review diff for unrelated changes, content changes, secrets, and missing license notices.
9. Report exact files changed, commands run, outcomes, limitations, and outstanding approvals.

## 8. Prohibited actions
- Generating religious datasets.
- Importing from an unapproved URL.
- Weakening/removing tests to hide a failure.
- Disabling lints to make CI pass.
- Adding network services, analytics, ads, or backend without approval.
- Adding packages solely because an agent suggested them.
- Claiming religious validation based on automated checks alone.
- Claiming complete security or certification without a scoped assessment.

## 9. Definition of done
A task is not complete until its acceptance criteria and tests pass, its diff is reviewed, and its report states any remaining human, religious, legal, or owner review required.
