# ADR-0002: Flutter/Dart cross-platform stack

- Status: Proposed
- Decision owner: Product owner
- Date: 2026-11-16

## Context
One mobile app is required for Android and iOS. The app needs careful Arabic/RTL rendering, local persistence, offline audio, and strong testability.

## Proposed decision
Use Flutter/Dart. Proposed supporting packages: Riverpod, GoRouter, Drift/SQLite, just_audio. Add each package only after version, maintenance, license, transitive dependency, permission, and platform compatibility review.

## Architecture
Use feature-first organization, separate UI and data layers, repositories, immutable models, dependency injection, and use cases where business complexity justifies them. Avoid unnecessary Clean Architecture ceremony.

## Consequences
- Shared code for Android and iOS.
- Strong control over UI rendering.
- Requires Flutter/Dart toolchain and platform-specific testing.
- Native plugins still need careful compatibility review.

## Approval
This ADR remains proposed until the product owner approves it.
