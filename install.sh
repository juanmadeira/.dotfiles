#!/bin/sh

DOTS="$HOME/.dotfiles"

sudo mkdir -p /usr/share/wayland-sessions
sudo cp $DOTS/dwl/dwl.desktop /usr/share/wayland-sessions
