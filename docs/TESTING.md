# Testing and Quality Gates

## Test layers

### Unit
- Quran content manifest validation.
- Search mapping to canonical surah/ayah IDs.
- Reading position persistence.
- Bookmark CRUD.
- Adhkar counter state.
- Audio download state transitions.
- Database migration behavior.

### Widget
- RTL rendering.
- Surah list and reading states.
- Bookmark and search interactions.
- Audio controls/download states.
- Adhkar counter.
- Empty, loading, error, and offline states.
- Accessibility labels and large text.

### Integration
- First launch in airplane mode.
- Quran reading and search offline.
- Bookmark persistence after force close/relaunch.
- Download audio online and play offline.
- Interrupted download recovery.
- Upgrade without losing user data.

### Manual
- At least one representative Android device and one iPhone.
- Arabic glyph shaping, diacritics, ligatures, and font scaling.
- Background audio and interruptions.
- Low storage and denied permissions.
- Airplane mode and network transitions.

## CI checks
- Format check.
- `flutter analyze`.
- Unit and widget tests.
- Content validation when data changes.
- Dependency/license checks.
- Android/iOS build checks where runners are available.

## Release blockers
- Any unexplained Quran text discrepancy.
- Missing/incorrect source attribution or redistribution approval.
- Incorrect verse-reference mapping.
- User data loss.
- Audio marked downloaded while incomplete.
- Core reading requiring internet.
- Core-flow crash.
- Unreviewed security/privacy issue.

Tests prove software behavior, not religious correctness. Human/religious review remains required.
