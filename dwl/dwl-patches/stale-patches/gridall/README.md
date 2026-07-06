### Description

This patch introduces a new way to view and focus on a client:

1. Press the shortcut defined on config.h once to view all windows across all tags using the gaplessgrid layout.

2. Press it again to view the selected window in its original tag using the monocle layout.

The idea is to press a shortcut (e.g., `Mod+g`) to display all windows, then after
selecting one, press it again to jump to that window's tag and focus on it.

This patch depends on two other patches: [gaplessgrid](https://codeberg.org/dwl/dwl-patches/src/branch/main/patches/gaplessgrid)
and [winview](https://codeberg.org/dwl/dwl-patches/src/branch/main/patches/winview).

If you already have the other two patches added to your `dwl` build, you can simply
apply `gridall.diff`. If not, I've also created a combined patch
that includes winview, gaplessgrid, and gridall `winview+gaplessgrid+gridall.diff`.

Additionally, this patch serves as an example of how to combine two functions
under a single shortcut, allowing users to further customize their `dwl` setup.

**Note:** Sometimes a window may get "lost" in one of the tags. This patch helps
you quickly find and focus on it without having to move it or change its tag.

### Download
- [git branch](https://codeberg.org/Kana/dwl/src/branch/gridall)
- [main gridall 2025-10-08](https://codeberg.org/dwl/dwl-patches/raw/branch/main/patches/gridall/gridall.diff)
- [main winview+gaplessgrid+gridall 2025-10-08](https://codeberg.org/dwl/dwl-patches/raw/branch/main/patches/gridall/winview+gaplessgrid+gridall.diff)

### Authors
- [André Desgualdo Pereira](https://codeberg.org/Kana)
