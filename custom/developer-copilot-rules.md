# Developer Copilot Rules

## PHP

- Prefer strict typing.
- Follow existing project architecture.
- Keep controllers thin.
- Use dependency injection where the project already does.
- Prefer existing services, plugins and APIs.

## Drupal

- Respect existing Drupal conventions.
- Reuse existing services and plugins before creating new ones.
- Do not bypass Drupal APIs without a strong reason.
- Follow existing module structure.

## Project conventions

- Match existing naming and coding style.
- Prefer consistency with the current codebase over personal preferences.
- Do not change unrelated code.

## Refactoring

- Prefer small, incremental refactoring.
- Do not extract methods only to reduce method length.
- Extract code when it improves reuse, testability, or domain clarity.
- Avoid abstractions without a clear benefit.
- Preserve existing working patterns unless there is a concrete reason to change them.
