# Security and Privacy Baseline

## MVP threat posture
The MVP has no account or server. Main risks are local data loss, untrusted downloads, excessive permissions, supply-chain compromise, accidental content alteration, and leakage through logs/backups.

## Rules
- No accounts or personal identity required.
- No third-party analytics, ads, or telemetry by default.
- No background tracking.
- Request location only when user opens a location-dependent feature.
- Explain permissions before requesting them.
- Store user data in app-private storage.
- Do not claim SQLite is encrypted by default.
- Do not invent cryptography.
- Use platform secure storage for secrets only if future requirements need it.
- Do not log reading history, location, notes, or personal activity.
- Do not commit secrets, signing keys, tokens, certificates, or personal data.
- Export private data only after explicit user action.
- Validate downloaded audio type, size, completion, and checksum where available.
- Use safe internally generated filenames.
- Review all native permissions and entitlements.
- Minimize dependencies and audit licenses/transitive dependencies.

## Release security review
- Dependency and license inventory.
- Android manifest and iOS entitlement review.
- Storage and backup behavior review.
- Download input validation.
- Error/log redaction review.
- Data deletion/export behavior review.
- OWASP MASVS-informed checklist.

References:
- https://mas.owasp.org/MASVS/
- https://mas.owasp.org/MASVS/05-MASVS-STORAGE/
