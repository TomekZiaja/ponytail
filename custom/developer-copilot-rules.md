# Drupal 11+ / PHP 8.2+ (Ponytail overlay)

Lazy Senior Rule: Bei Debugging immer die offensichtlichste Fehlerquelle zuerst checken (falsche Permission, falsche ID, falsche User) bevor du in den Code-Dschungel gehst. Occam's Razor: die einfachste Erklärung ist fast immer richtig.

- Preserve existing patterns/naming/architecture unless there's a concrete reason to change.
- Don't refactor unrelated code or mix cleanup with the actual change.

## Drupal / PHP
- Use modern Drupal APIs (Entity, Field, Config, Plugin, Routing, Access, Cache Tags/Contexts, Events, Attributes, JSON:API) — don't bypass them without strong reason.
- Constructor Dependency Injection over `\Drupal::service()`.
- Keep controllers thin; business logic in services when it aids reuse/testability.
- PHP 8.2+, strict typing, PSR standards.
- Cache only when actually needed; get invalidation/cacheability right.
- Security: validate input, sanitize output, respect access control — never optional.
- Accessibility: semantic HTML, keyboard/screen-reader support, preserve existing a11y behavior.
- Non-trivial logic: prefer existing PHPUnit layer (unit/kernel/functional as fits) over inventing a new check harness.

## Verification (DDEV)
Run PHP/Drush/Composer only via `ddev exec`/`ddev drush`/`ddev composer`. Never edit `web/core`, `web/modules/contrib`, `vendor/`.
Before marking done, run smallest relevant check:
- `ddev exec bin/phpunit --configuration /var/www/html/tests/phpunit.xml web/modules/custom/<module>/tests/`
- `ddev exec bin/phpstan analyse --level=1 web/modules/custom/<module>`
- `ddev exec composer phpcs -- web/modules/custom/<module>`
