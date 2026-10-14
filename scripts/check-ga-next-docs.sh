#!/usr/bin/env bash
# SPDX-License-Identifier: GPL-3.0-or-later
# Check that the GA-Next bootstrap documents exist and contain the required phrases.

set -u

if [[ -n "${1:-}" ]]; then
  root=$1
else
  root=$(cd "$(dirname "$0")/.." && pwd)
fi

fail=0

require_file() {
  local path=$1
  if [[ ! -f "$root/$path" ]]; then
    echo "FAIL: $path: missing" >&2
    fail=$((fail + 1))
  fi
}

require_line() {
  local path=$1
  local line=$2
  if [[ ! -f "$root/$path" ]]; then
    echo "FAIL: $path: missing" >&2
    fail=$((fail + 1))
    return
  fi
  if ! grep -qxF -- "$line" "$root/$path"; then
    echo "FAIL: $path: missing line: $line" >&2
    fail=$((fail + 1))
  fi
}

require_text() {
  local path=$1
  local phrase=$2
  if [[ ! -f "$root/$path" ]]; then
    echo "FAIL: $path: missing" >&2
    fail=$((fail + 1))
    return
  fi
  if ! grep -qF -- "$phrase" "$root/$path"; then
    echo "FAIL: $path: missing text: $phrase" >&2
    fail=$((fail + 1))
  fi
}

forbid_text() {
  local path=$1
  local phrase=$2
  if [[ -f "$root/$path" ]] && grep -qF -- "$phrase" "$root/$path"; then
    echo "FAIL: $path: forbidden text: $phrase" >&2
    fail=$((fail + 1))
  fi
}

require_file LICENSE
require_text LICENSE "GNU GENERAL PUBLIC LICENSE"
require_text LICENSE "Version 3, 29 June 2007"

require_file .gitignore
require_line .gitignore ".agent-work/"
require_line .gitignore "work/"

require_file README.md
require_text README.md "GA-Next is a fork of GroovyArcade by Substring."
require_text README.md "GA-Next has no release of its own yet: the ISO is still built and published as GroovyArcade."
require_text README.md "The default frontend is Attract-Mode Plus."
require_text README.md "ES-DE and Game Boy support are planned work and are not part of the current ISO."
require_text README.md "JAMMASD"
require_text README.md "USB HID"
require_text README.md "15 kHz"
require_text README.md "https://github.com/substring/os"
require_text README.md "2024.07"
require_text README.md "2025.08"
require_text README.md "testing"
require_text README.md "GPL-3.0-or-later"
forbid_text README.md "github.com/mikzero/os/releases"
forbid_text README.md "ES-DE is included"
forbid_text README.md "Game Boy support is included"
forbid_text README.md "Download GA-Next"

require_file CONTRIBUTING.md
require_text CONTRIBUTING.md "## Roles"
require_text CONTRIBUTING.md "## Where we discuss"
require_text CONTRIBUTING.md "## What needs review"
require_text CONTRIBUTING.md "## CRT checklist"
require_text CONTRIBUTING.md "## License"
require_text CONTRIBUTING.md "Discussion happens in GitHub issues of this repository."
require_text CONTRIBUTING.md "Changes to boot, video, kernel command line or package list are not merged without review and a test on a real CRT."
require_text CONTRIBUTING.md "This project is licensed under GPL-3.0-or-later. Do not change the license."

require_file .github/ISSUE_TEMPLATE/bug_report.md
require_text .github/ISSUE_TEMPLATE/bug_report.md "ISO version"
require_text .github/ISSUE_TEMPLATE/bug_report.md "GPU"
require_text .github/ISSUE_TEMPLATE/bug_report.md "Monitor"
require_text .github/ISSUE_TEMPLATE/bug_report.md "Steps to reproduce"
require_text .github/ISSUE_TEMPLATE/bug_report.md "Expected"
require_text .github/ISSUE_TEMPLATE/bug_report.md "Actual"

require_file .github/ISSUE_TEMPLATE/feature_request.md
require_text .github/ISSUE_TEMPLATE/feature_request.md "Problem"
require_text .github/ISSUE_TEMPLATE/feature_request.md "Proposal"
require_text .github/ISSUE_TEMPLATE/feature_request.md "Touches video or boot"

require_file .github/ISSUE_TEMPLATE/hardware_report.md
require_text .github/ISSUE_TEMPLATE/hardware_report.md "GPU"
require_text .github/ISSUE_TEMPLATE/hardware_report.md "Connector"
require_text .github/ISSUE_TEMPLATE/hardware_report.md "Monitor"
require_text .github/ISSUE_TEMPLATE/hardware_report.md "JAMMASD"
require_text .github/ISSUE_TEMPLATE/hardware_report.md "ISO version"

require_file .github/pull_request_template.md
require_text .github/pull_request_template.md "- [ ] Tested on a real CRT (required if the diff touches video or boot)"
require_text .github/pull_request_template.md "- [ ] Documentation updated"
require_text .github/pull_request_template.md "- [ ] No secrets, keys or tokens in the diff"

require_file docs/ga-next.md
require_text docs/ga-next.md "## Status"
require_text docs/ga-next.md "## Names"
require_text docs/ga-next.md "## Attribution"
require_text docs/ga-next.md "## Current baseline"
require_text docs/ga-next.md "## Upstream state"
require_text docs/ga-next.md "## Target hardware"
require_text docs/ga-next.md "## Corrections to v2"
require_text docs/ga-next.md "## Later work"
require_text docs/ga-next.md "## Known issues explained by this tree"
require_text docs/ga-next.md "This document is not an executable roadmap."
require_text docs/ga-next.md "The ISO is still named groovyarcade."
require_text docs/ga-next.md "None of the items in this section is implemented."
require_text docs/ga-next.md "Not fixed by the bootstrap."

if [[ "$fail" -gt 0 ]]; then
  echo "FAIL: $fail problem(s)" >&2
  exit 1
fi

echo "OK: GA-Next docs"
exit 0
