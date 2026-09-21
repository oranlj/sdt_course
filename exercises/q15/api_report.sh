#!/usr/bin/env bash
set -euo pipefail
cd -- "$(dirname -- "$0")"

data=$(curl --noproxy '*' -fsS http://127.0.0.1:8000/packages.json)

{
    printf '# Package Report\n\n'
    printf '| name | version | downloads |\n'
    printf '| --- | --- | --- |\n'
    printf '%s\n' "$data" | jq -r '
      map(select(.status == "active" and .downloads >= 100))
      | sort_by([-.downloads, .name])
      | .[]
      | "| \(.name) | \(.version) | \(.downloads) |"
    '
} > summary.md
