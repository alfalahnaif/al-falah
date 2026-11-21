# ADR-0001: Offline-first, local-only MVP

- Status: Proposed
- Decision owner: Product owner
- Date: 2026-11-16

## Context
The MVP should not require hosting, a backend, user accounts, online Quran APIs, cloud databases, analytics, or remote configuration. Users should be able to read the Quran immediately after installation.

## Proposed decision
Bundle approved Quran text and essential metadata. Store writable user state locally in SQLite. Download audio only when the user requests it and play completed downloads locally. Defer cloud sync until user research demonstrates a need.

## Consequences
Positive:
- No backend operating cost.
- Lower privacy exposure.
- Reliable core reading in airplane mode.
- Simpler beta and release operations.

Trade-offs:
- No cross-device synchronization.
- App binary includes approved text assets.
- Audio downloads require network at download time.
- Content updates require a deliberate app/content release process.

## Approval
This ADR remains proposed until the product owner approves it.
