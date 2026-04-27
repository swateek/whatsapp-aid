#!/usr/bin/env bash
set -euo pipefail

if ! command -v flutter >/dev/null 2>&1; then
  cat <<'EOF'
Flutter is not available on PATH; skipping this local Flutter hook.

Install Flutter and ensure `flutter` is on PATH to run this check locally.
GitHub Actions still runs the required Flutter checks in CI.
EOF
  exit 0
fi

cd "$(dirname "${BASH_SOURCE[0]}")/.."
exec flutter "$@"
