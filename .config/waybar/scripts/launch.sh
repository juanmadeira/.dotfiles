#!/bin/bash

# ----------------------------------------------------- 
# Quit all running waybar instances
# ----------------------------------------------------- 
killall -q waybar
sleep 0.2

waybar &

# Load pywal colors if the file exists
WAL_COLORS="$HOME/.cache/wal/colors.sh"
[ -f "$WAL_COLORS" ] && source "$WAL_COLORS"

# Quit any running dunst instances
pkill -x dunst

DUNST_FILE="$HOME/.config/dunst/dunstrc"

# Update dunst configuration based on pywal colors
sed -i -e "s/^    background = .*/    background = \"$color0\"/" \
       -e "s/^    foreground = .*/    foreground = \"$color15\"/" \
       -e "s/^    frame_color = .*/    frame_color = \"$color5\"/" \
       "$DUNST_FILE"

# Restart dunst with the updated configuration
dunst -config "$DUNST_FILE" > /dev/null 2>&1 &
