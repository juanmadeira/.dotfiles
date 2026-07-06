### Description
Adds touchscreen functionality.

KNOWN BUGS:
- Sometimes, the pointer moves to where the screen is pressed, but the button press doesn't occur until the screen is touched AGAIN. This means that if you touch to click button 'Q' on the screen (for instance), nothing happens; then you touch elsewhere on the screen and THEN button 'Q' registers a click. This is annoying, doesn't always happen, and I don't yet know how to fix it.

### Download
- [git branch](https://codeberg.org/fauxmight/dwl/src/branch/touch-input)
- [touch-input-wlroots-next-f4249db.patch](https://codeberg.org/dwl/dwl-patches/raw/branch/main/patches/touch-input/touch-input-wlroots-next-f4249db.patch)
- [touch-input-0.8.patch](https://codeberg.org/dwl/dwl-patches/raw/branch/main/patches/touch-input/touch-input-0.8.patch)
- [touch-input-0.8-osu-ver.patch](https://codeberg.org/dwl/dwl-patches/raw/branch/main/patches/touch-input/touch-input-0.8-osu-ver.patch)

### Authors
#### Current
- [fauxmight](https://codeberg.org/fauxmight)
- [6z7y](https://codeberg.org/6z7y) -- maintaining `osu!` version of the `touch-input` patch
#### Historic
- [minego](https://codeberg.org/minego)
- [Unprex](https://github.com/Unprex)


### Changelog
- 2026-06-15 Add support for osu! fullscreen touch input (fix cursor stuck issue)
- 2026-02-26 Update patch for dwl v0.8 and dwl wlroots-next branch commit f4249db
- 2025-01-01 @fauxmight took over maintenance. Previous maintainer @minego notes [lack of available time](https://codeberg.org/dwl/dwl-patches/pulls/102#issuecomment-2557944)
- 2024-02-11 Corrected issue where motion events where not sending notifications for unfocused clients such as an on screen keyboard
- 2024-03-26 Rebased, and removed #ifdef's for the pointer constraints patch which has been merged into upstream
- 2024-03-28 Removed debug
