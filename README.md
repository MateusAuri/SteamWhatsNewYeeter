MateusAuri's
# Steam Library 'What's New' Yeeter script
[CHANGELOG](https://github.com/MateusAuri/SteamWhatsNewYeeter/blob/latest/CHANGELOG.md)

Tested and still working on stable client branch (v1766451605, build date Dec 22 2025).

## What's this?
- This batch/powershell script hides that annoying "What's New" shelf or section from your Steam Library (on Windows)

## How do I use it?
- Navigate to your Steam install directory (usually "C:\Program Files (x86)\Steam")
- Go into "steamui\css"
- Drop both BAT and PS1 files in the "css" folder (it should be in the same folder as "chunk~2dcc5aaf7.css")
- Double-click the BAT file
- Repeat the previous step whenever "What's New" pops back again into your library

You may want to create a shortcut to the BAT file for easier access in the future

## How do I download it?
- Through the [latest release](https://github.com/MateusAuri/SteamWhatsNewYeeter/releases/latest), the [ZIP](https://github.com/MateusAuri/SteamWhatsNewYeeter/releases/latest/download/SteamWhatsNewYeeter.zip) file contains both script files, you just gotta extract them to the "css" folder before using
- Or you could download both raw script files directly by right clicking and "Save link as...": [BAT](https://raw.githubusercontent.com/MateusAuri/SteamWhatsNewYeeter/latest/SteamWhatsNewYeeter.bat) | [PS1](https://raw.githubusercontent.com/MateusAuri/SteamWhatsNewYeeter/latest/SteamWhatsNewYeeter.ps1)

There's a chance you may need to allow a "suspicious downloads" popup from your browser and/or run it as admin, but that's just common safety measures for third-party scripts. 

The files are clean. Check the code yourself, run them through [VirusTotal](https://www.virustotal.com/gui/) or whatever. Just please don't contact me asking about false positives. Inane requests will be duly ignored.

I'll try to keep this updated whenever Steam changes its files around, but no promises...

## What if I am on Linux?
I haven't tested it, but you can try [eliwss0's bash script fork](https://github.com/eliwss0/SteamWhatsNewYeeter).

## Why are you so hellbent on hiding the What's New shelf? Are you afraid of looking at your own games' update news???
I assume I'm not the only one on this, but I just don't ever use it, and don't see why it should permanently take up such a big chunk of my library screen.

It's just nice to have an extra bit of customization with an option to hide it altogether and have my library look however I like. Simple as that.

## Why does Steam keep on restoring the What's New shelf against my will? Is Gaben conspiring to force me to look at it???
No, it is not some kind of conspiracy, take it easy. That behavior is expected, since the changes made by this script are not supported officially, and thus not permanent.

Whenever the Steam frontend devs change something in the library's CSS code, a new version of that file is downloaded with the Steam client's update. 

Inevitably, this reverts the unofficial changes because you just got a new official vanilla unadulterated CSS file in your Steam folder.

But no biggie! All you need to do is run the script again (or wait for a new version of the script, in case they ever change how the What's New shelf works and the current version is rendered unable to yeet it).

### If you *really* liked this script and you *really* wanna thank me, consider sending a dollar or so my way, because I'm still kinda broke, but no pressure... I *am* aware that this script is just a tiny convenience that solves a very insignificant annoyance.

[PayPal](https://www.paypal.com/donate/?business=NA4SGGWAQHFEJ) | [Ko-fi](https://ko-fi.com/mateusauri) | [BuyMeACoffee](https://www.buymeacoffee.com/mateusauri)
