#!/bin/sh

DOTS="$HOME/.dotfiles"

sudo pacman-key --populate
sudo pacman --noconfirm -Sy --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay; makepkg -si; cd ..; rm -rf yay

sudo mkdir -p /usr/share/wayland-sessions
sudo cp $DOTS/dwl/dwl.desktop /usr/share/wayland-sessions
