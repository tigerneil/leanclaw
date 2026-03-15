#!/usr/bin/env bash
set -euo pipefail

if [[ $# -lt 1 ]]; then
  echo "Usage: $0 <lean-file> [project-root]" >&2
  exit 1
fi

LEAN_FILE="$1"
PROJECT_ROOT="${2:-.}"

cd "$PROJECT_ROOT"

if command -v lake >/dev/null 2>&1; then
  lake env lean "$LEAN_FILE"
else
  echo "Error: lake not found in PATH" >&2
  exit 2
fi
