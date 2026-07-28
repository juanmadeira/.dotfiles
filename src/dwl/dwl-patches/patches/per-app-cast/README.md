### Description
Adds per-window screen sharing aka toplevel capture via `ext-foreign-toplevel-image-capture-source-v1` based on the sway implementation <br>
XWayland clients work in basic testing but it should be considered rather experimental. There is some possible restacking edge-cases but I was not able to reproduce them yet <br>
Note that the captured surface is rendered a second time into its own scene, so there's a small GPU cost while a capture is active

Targets the dwl **`wlroots-next`** branch (base commit `d41ecb745c`).

### Requirements
| Requirement | Notes |
| --- | --- |
| `wlroots` ≥ 0.20 |  mandatory |
| `xdg-desktop-portal-wlr` ≥ 0.8 | `chooser_type` has to be configured as `dmenu` |

### Download
- [per-app-share-wlroots-next-d41ecb745c](https://codeberg.org/dwl/dwl-patches/raw/branch/main/patches/per-app-cast/per-app-share-wlroots-next-d41ecb745c.patch)

### Authors
- [skeetamine](https://codeberg.org/skeetamine)
