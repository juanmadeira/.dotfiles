// somebar - dwl bar
// See LICENSE file for copyright and license details.

#pragma once
#include "common.hpp"

constexpr bool topbar = true;

constexpr int paddingX = 10;
constexpr int paddingY = 3;

// See https://docs.gtk.org/Pango/type_func.FontDescription.from_string.html
constexpr const char* font = "JetBrainsMono Nerd Font 10";

constexpr ColorScheme colorInactive = {
	Color(0xbb, 0xbb, 0xbb), 	// foreground
	Color(0x22, 0x22, 0x22)		// background
};
constexpr ColorScheme colorActive = {
	Color(0xee, 0xee, 0xee),	// foreground
	Color(0x2d, 0x5a, 0x27)		// background
};

constexpr const char* termcmd[] = {"foot", nullptr};

static std::vector<std::string> tagNames = {
	"1", "2", "3",
	"4", "5", "6",
	"7", "8", "9",
};

constexpr Button buttons[] = {
	{ ClkStatusText,   BTN_RIGHT,  spawn,      {.v = termcmd} },
};
