### Description

Implement https://github.com/wlrfx/scenefx

```c
/* available options */

static const int opacity = 0; /* flag to enable opacity */
static const float opacity_inactive = 0.5;
static const float opacity_active = 1.0;

static const int shadow = 1; /* flag to enable shadow */
static const int shadow_only_floating = 0; /* only apply shadow to floating windows */
static const float shadow_color[4] = COLOR(0x0000FFff);
static const float shadow_color_focus[4] = COLOR(0xFF0000ff);
static const int shadow_blur_sigma = 20;
static const int shadow_blur_sigma_focus = 40;
static const char *const shadow_ignore_list[] = { NULL }; /* list of app-id to ignore */

static const int corner_radius = 8; /* 0 disables corner_radius */
static const int corner_radius_inner = 8; /* 0 disables corner_radius */
static const int corner_radius_only_floating = 0; /* only apply corner_radius and corner_radius_inner to floating windows */

static const int blur = 1; /* flag to enable blur */
static const int blur_xray = 0; /* flag to make transparent fs and floating windows display your background */
static const int blur_ignore_transparent = 1;
static const struct blur_data blur_data = {
	.radius = 5,
	.num_passes = 3,
	.noise = (float)0.02,
	.brightness = (float)0.9,
	.contrast = (float)0.9,
	.saturation = (float)1.1,
};
```

> **NOTE:** If you are using nix with flakes, scenefx has a flake for scenefx https://github.com/wlrfx/scenefx/blob/main/flake.nix

> **NOTE:** Blur doesn't work on windows with opacity set (opacity_active, opacity_inactive)

> **NOTE:** In DWL's Makefile `scenefx-0.2` must be placed before `wlroots-0.18`, e.g. `PKGS = scenefx-0.2 wlroots-0.18 wayland-server ...`

<details>
<summary>Preview</summary>
<pre>
<img src="https://i.imgur.com/nJIX6lp.png"/>
</pre>
</details>

### Download

- [git branch](https://codeberg.org/wochap/dwl/src/branch/v0.8-a/scenefx-b)

- [0.8-dev](https://codeberg.org/dwl/dwl-patches/raw/branch/main/patches/scenefx/scenefx.patch)

  **NOTE:** This patch was tested with the `87c0e8b6d5c86557a800445e8e4c322f387fe19c` commit on the `main` branch of `SceneFX`. It supports rounded borders, blur, and shadows. However, it does not add rounded borders or shadows to Xwayland apps. That said, Xwayland apps can have shadows, and they might also support rounded borders, but I was never able to make it work. PRs are welcome!

  **IMPORTANT:** This patch requires you to build DWL with the following dependencies

  - **scenefx**
  - libGL

- [2024-07-09](https://codeberg.org/dwl/dwl-patches/raw/commit/13d96b51b54500dd24544cf3a73c61b7a1414bc6/patches/scenefx/scenefx.patch)

  **IMPORTANT:** This patch only works with the `2ec3505248e819191c37cb831197629f373326fb` commit on the `main` branch of `scenefx`, therefore, it does not support **blur**.

  **IMPORTANT:** This patch requires you to build DWL with the following dependencies

  - **scenefx**
  - libGL

  <details>
  <summary>Preview</summary>
  <pre>
  <img src="https://i.imgur.com/4kFhSaS.png"/>
  <img src="https://i.imgur.com/9ZQAUXx.png"/>
  </pre>
  </details>

- [2024-04-11](https://codeberg.org/dwl/dwl-patches/raw/commit/6e3a57ffd16dafa31900b7e89e51672bd7bcc1e8/scenefx/scenefx.patch)

  **IMPORTANT:** This patch only works with the `de4ec10e1ff9347b5833f00f8615d760d9378c99` commit on the `wlr_scene_blur` branch of `scenefx`, as it adds support for **blur**.

  **IMPORTANT:** This patch requires you to build DWL with the dependencies of WLROOTS:

  - **scenefx**
  - libGL
  - libcap
  - libinput
  - libpng
  - libxkbcommon
  - mesa
  - pixman
  - seatd
  - vulkan-loader
  - wayland
  - wayland-protocols
  - xorg.libX11
  - xorg.xcbutilerrors
  - xorg.xcbutilimage
  - xorg.xcbutilrenderutil
  - xorg.xcbutilwm
  - xwayland (optional)
  - ffmpeg
  - hwdata
  - libliftoff
  - libdisplay-info

- [v0.5](https://codeberg.org/dwl/dwl-patches/raw/commit/7a5c3420822074c544fa102e030b7c30aa6b6be8/scenefx/scenefx.patch)

### Authors

- [wochap](https://codeberg.org/wochap)
