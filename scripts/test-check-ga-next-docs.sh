#!/usr/bin/env bash
# SPDX-License-Identifier: GPL-3.0-or-later
# Prove that scripts/check-ga-next-docs.sh fails when a required file is removed or emptied.

set -u

root=$(cd "$(dirname "$0")/.." && pwd)
files=(
  LICENSE
  .gitignore
  README.md
  CONTRIBUTING.md
  .github/ISSUE_TEMPLATE/bug_report.md
  .github/ISSUE_TEMPLATE/feature_request.md
  .github/ISSUE_TEMPLATE/hardware_report.md
  .github/pull_request_template.md
  docs/ga-next.md
)

stage() {
  local dest=$1
  local rel
  mkdir -p "$dest/scripts"
  cp "$root/scripts/check-ga-next-docs.sh" "$dest/scripts/check-ga-next-docs.sh"
  for rel in "${files[@]}"; do
    mkdir -p "$dest/$(dirname "$rel")"
    cp "$root/$rel" "$dest/$rel"
  done
}

run_check() {
  local dest=$1
  bash "$dest/scripts/check-ga-next-docs.sh" "$dest"
}

tmp=$(mktemp -d)
trap 'rm -rf "$tmp"' EXIT

stage "$tmp/intact"
if ! run_check "$tmp/intact" >/dev/null; then
  echo "FAIL: intact tree did not pass" >&2
  exit 1
fi

for rel in "${files[@]}"; do
  for mode in delete empty; do
    work="$tmp/$mode-$(echo "$rel" | tr '/' '-')"
    stage "$work"
    if [[ "$mode" == delete ]]; then
      rm -f "$work/$rel"
    else
      : > "$work/$rel"
    fi
    if run_check "$work" >/dev/null 2>&1; then
      echo "FAIL: check stayed green after $mode of $rel" >&2
      exit 1
    fi
  done
done

echo "OK: check fails when a required file is removed or emptied"
exit 0
