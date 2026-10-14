# GA-Next

Document date: 2026-10-14. Horizon: 2026-2028.

## Status

This document is not an executable roadmap.

It records the GA-Next fork as it stands on commit `fc91600` (2025-11-18) and the corrections applied to the October 2026 organisational draft. The bootstrap task adds documentation only.

## Names

GA-Next is the project name on this repository. `iso_name` stays `groovyarcade`. The label, bootloader, kernel command line, and package list do not change in the bootstrap.

The ISO is still named groovyarcade.

## Attribution

GroovyArcade is the upstream project by Substring. The upstream repository is https://github.com/substring/os. This fork's remote is `mikzero/os`.

`gasetup`, `gatools`, and the packages are not in this tree. They live on the GitLab group `groovyarcade` and on https://github.com/substring/packages. `release.sh` clones the GitLab repositories only to write a changelog.

## Current baseline

Tree `fc91600` (2025-11-18) is an Archiso profile. It builds the live and install ISO. It does not contain the emulator sources.

Packages in `groovyarcade/packages.x86_64` include `linux-15khz`, `switchres`, `groovymame`, `attractplus`, `gasetup`, `gatools`, `galauncher`, `xf86-video-ati`, `xf86-video-amdgpu`, and `udiskie`. Commented out: `#retroarch`, `#mednafen`, `#advancemenuplus-git`.

`groovyarcade/airootfs/home/arcade/shared/configs/ga.conf` sets `frontend=attractplus` and `video.backend=KMS`.

The default 15 kHz entry passes `video=640x480iS` in `groovyarcade/syslinux/syslinux.cfg` and `groovyarcade/efiboot/loader/entries/ga-15khz.conf`. The UEFI default in `groovyarcade/efiboot/loader/loader.conf` is `ga-15khz.conf`.

`udiskie.service` is shipped for the `arcade` user and is not enabled. `default.target.wants` is absent. In `.bash_profile` the line that enables udiskie is commented out by commit `70e73e6`, so the system is not installed onto the boot stick.

Continuous integration is `.gitlab-ci.yml`. The `build_iso` job runs on `master` and on tags: `./build.sh`, then `./release.sh -dcip`. There is no GitHub Actions workflow.

## Upstream state

On 2026-10-14 the GitHub release marked Latest is `2024.07`, published 2024-07-17. A `2025.08` pre-release exists. The `testing` tag was updated on 2026-08-27.

`substring/os` had 10 open issues on 2026-10-14. Issues are disabled on `mikzero/os`.

## Target hardware

The intended cabinet is an AMD/ATI GPU with an analogue output (VGA or DVI-I), a 15 kHz CRT, and a JAMMASD board. JAMMASD takes the GPU's VGA into the JAMMA connector and exposes controls as a USB HID keyboard. This tree has no JAMMASD driver. The bootstrap adds no video code.

## Corrections to v2

- The draft proposed a monorepo `ga-next/iso` plus `packages/`. This repository is still only the Archiso profile. The monorepo was not created.
- The draft proposed GitHub Actions. The CI that exists is GitLab (`.gitlab-ci.yml`).
- The plan asked for a modern frontend. Attract-Mode Plus is the default. ES-DE is later work.
- Game Boy support is absent. RetroArch is commented out of the package list. There is no Game Boy rom list.
- The plan talks about a living issue tracker. On 2026-10-14, `substring/os` had 10 open issues. Issues are disabled on `mikzero/os`.
- Latest is `2024.07`. The `2025.08` pre-release and the `testing` tag also exist.

## Later work

None of the items in this section is implemented.

- ES-DE. Not started.
- Game Boy, either RetroArch with gambatte or mGBA launched through `galauncher.sh`, or the MAME software list. Not started.
- `ga-tools`. Not started.
- Monorepo and import of `gasetup`, `gatools`, and `packages`. Not started.
- Package signing. Not started.
- GitHub Actions. Not started.
- Verification on five GPUs. Not started.
- Public announcement. Not started.
- Contact with Substring. Not started.

## Known issues explained by this tree

Not fixed by the bootstrap.

- `#63` (USB). `udiskie` is present and not enabled. The line that enables it is commented out by commit `70e73e6`.
- `#65`. The kernel command line of the default 15 kHz boot entry is `video=640x480iS`.
