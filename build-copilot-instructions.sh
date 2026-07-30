#!/usr/bin/env bash

set -euo pipefail

OUTPUT="generated/copilot-instructions.md"

mkdir -p generated

cat \
  .github/copilot-instructions.md \
  custom/caveman-rules.md \
  custom/developer-copilot-rules.md \
  > "$OUTPUT"

echo "Created $OUTPUT"
