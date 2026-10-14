# Contributing to GA-Next

GA-Next is a fork of GroovyArcade by Substring. The ISO is still GroovyArcade. Read `docs/ga-next.md` before opening a large change.

## Roles

- Fork maintainer: review and merge.
- Contributor: open issues and pull requests.
- Hardware tester: report the GPU, connector, monitor, and JAMMASD setup you actually ran.
- Upstream: Substring and GroovyArcade. Attribute that work. Do not present it as your own.

## Where we discuss

Discussion happens in GitHub issues of this repository.

Issue templates cover bugs, feature requests, and hardware reports. On the `mikzero/os` fork, GitHub issues are disabled. The templates stay in the tree so they work when issues are turned on.

## What needs review

Changes to boot, video, kernel command line or package list are not merged without review and a test on a real CRT.

Documentation-only changes still need a review. They do not need a CRT session.

## CRT checklist

Use this list when a change can affect the picture or the cabinet controls:

- GPU and connector used
- Monitor type (15/25/31 kHz)
- Boot entry chosen
- Stable picture, no "out of range"
- JAMMASD controls, if the board is present
- ISO version

## License

This project is licensed under GPL-3.0-or-later. Do not change the license.
