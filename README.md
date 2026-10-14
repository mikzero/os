# GA-Next

GA-Next is the name of this project on this repository. It is a documented fork of GroovyArcade. The ISO name, boot menu, and package list are unchanged.

GA-Next is a fork of GroovyArcade by Substring.

Upstream: https://github.com/substring/os

GA-Next has no release of its own yet: the ISO is still built and published as GroovyArcade.

This fork targets an AMD/ATI GPU with an analogue output (VGA or DVI-I), a 15 kHz CRT, and a JAMMASD board. JAMMASD carries the VGA signal onto the JAMMA edge and presents the cabinet controls as a USB HID keyboard. This repository does not ship a JAMMASD driver. None is required.

The default frontend is Attract-Mode Plus.

ES-DE and Game Boy support are planned work and are not part of the current ISO.

Releases published by upstream, as of 2026-10-14: Latest is 2024.07 (2024-07-17). There is also a 2025.08 pre-release and a testing tag updated on 2026-08-27.

License of this repository: GPL-3.0-or-later. See `LICENSE`.

# Upstream GroovyArcade README

## What is GroovyArcade ?

GroovyArcade (GA) is a 64bits Linux distribution for PCs using old CRT screens for perfect Arcade emulation using GroovyMAME. GroovyArcade features an easy to use installation wizard that will try to detect your CRT with your help, and then configure GA so you get the best experience on your CRT: responsive, tear-free with minimal input lag.

## How much does it cost? Is there a licence?

GroovyArcade is free and always will. If you've paid for it, you've been scammed. No patreon, no paypal, no paid licence key, no shareware, no limited usage, no code to unlock features, nothing. Not even beers (sadly). Just free.

## Recommended Hardware

It is strongly advised to use a AMD GPU. You can find a list of GPUs that have been tested at https://gitlab.com/groovyarcade/support/-/wikis/2-Pre-Requisites-and-Installation/2.1-Hardware-Suggestions-General

Intel and Nvidia GPUs may work, with unpredictable success.

The connectors on your GFX card are very important, listed in our preference order:
* VGA
* DVI-I
* DisplayPort (requires a DP2VGA converter based on RTD2166 or RTD2168)

HDMI should work, but I don't recommend it. Forget about DVI-D or anything else.

As a CRT, GA supports TVs, 15/25/31+ arcade monitors.

## Where do I download it ?

The last version will always be available at https://github.com/substring/os/releases/latest

Once downloaded, Windows users may use Balena Etcher or Rufus to burn it to a DVD or USB stick, Linux users have all kind of tools to burn the iso. MacOS users will google how to burn an ISO to a DVD or USB stick.

## How do I install it ?

GA supports UEFI as well a BIOS legacy. Whereas BIOS is a freeway, UEFI will require that you disable fast boot and secure boot.

**Remember that the very first step of boot is 31kHz (unless you flashed your vbios with ATOM15), and requires you plug a "modern" screen to display progressive 640x480, >15kHz CRT protection is up to you**

You can boot with your CRT and a LCD connected at the same time, you'll anyway later be asked which screen is your CRT.

That first boot menu will require you to make a choice among various screen types : various 15kHz presets, 25kHz, 31kHz, SVGA or LCD screen. Choose the one that suits best your configuration, this is only to get a picture on your CRT shortly after (and may set your LCD to "out of range").

The installer will then try to detect your screen and ask for your confirmation, so stay close to your keyboard! GA will prompt you anytime it needs you to confirm a picture is shown on the screen it is testing. After that, choose the connector (only if multiple screens were detected), set the monitor type (which will define its crt ranges), then you can either try a live install, or just install to a HDD. Reboot, and voilà!

## How can I help?

There are many ways to help: report your problems or successes.

## Resources

Wiki: https://gitlab.com/groovyarcade/support/-/wikis/home

Discord: https://discord.gg/YtQ6pJh
