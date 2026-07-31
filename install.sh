#!/bin/bash

# yay
sudo pacman-key --populate
sudo pacman --noconfirm -Sy --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay; makepkg -si; cd ..; rm -rf yay

# packages
source packages.conf
yay -S --needed "${TERMINAL[@]}"
yay -S --needed "${TOOLS[@]}"
yay -S --needed "${FILE_MANAGEMENT[@]}"
yay -S --needed "${INTERNET[@]}"
yay -S --needed "${IMAGE[@]}"
yay -S --needed "${VIDEO[@]}"
yay -S --needed "${AUDIO[@]}"
yay -S --needed "${MUSIC[@]}"

# local scripts
# mkdir -p $HOME/.local/bin
# cp -r .local/bin/* $HOME/.local/bin
# sudo chmod +x $HOME/.local/bin/*
