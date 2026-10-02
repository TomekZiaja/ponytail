# Drupal 11+ / PHP 8.2+ (Ponytail overlay)

Lazy Senior Rule: When debugging, check the obvious sources first (wrong permission, wrong ID, wrong user) before diving into the code jungle. Occam's Razor: the simplest explanation is almost always right.

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

# RTK — Rust Token Killer

When running shell commands, prefer the RTK wrapper for supported development commands:

- `git status` → `rtk git status`
- `git diff` → `rtk git diff`
- `git log` → `rtk git log`
- `git show` → `rtk git show`
- `ls` → `rtk ls`
- `find` → `rtk find`
- `grep` → `rtk grep`
- `rg` → `rtk grep`
- `cat <file>` → `rtk cat <file>`
- `npm` commands → `rtk npm ...`
- `pnpm` commands → `rtk pnpm ...`
- `yarn` commands → `rtk yarn ...`
- `cargo` commands → `rtk cargo ...`
- `pytest` commands → `rtk pytest ...`
- `docker` commands → `rtk docker ...`

Use RTK only when it is installed and supports the command. Preserve all command arguments, options, paths, and filters.

Use the original command instead if:

- RTK is not installed.
- RTK does not support the command.
- Complete, unfiltered output is required.
- The command is interactive.
- The command may modify files, dependencies, caches, databases, or generated code.
- There is any uncertainty about whether RTK changes command behavior.

RTK is only an output-optimization layer. It must not change command meaning or be used to bypass any restriction in these instructions.

Never hide errors. If RTK output is incomplete or ambiguous, rerun the original command and inspect the full output.

## RTK with DDEV

Run PHP, Drush, Composer, PHPUnit, PHPStan, and PHPCS inside the DDEV environment.

Use RTK only when the complete command remains semantically unchanged and RTK supports the command. Otherwise use the exact DDEV command.

Examples:

```bash
rtk ddev exec vendor/bin/phpunit --configuration /var/www/html/tests/phpunit.xml web/modules/custom/<module>/tests/
rtk ddev drush status
rtk ddev composer show
