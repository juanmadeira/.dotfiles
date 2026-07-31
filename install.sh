#!/bin/bash

# yay
sudo pacman-key --populate
sudo pacman --noconfirm -S --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay; makepkg -si; cd ..; rm -rf yay

# packages
source packages.conf
yay --noconfirm -S --needed "${TERMINAL[@]}"
yay --noconfirm -S --needed "${TOOLS[@]}"
yay --noconfirm -S --needed "${FILE_MANAGEMENT[@]}"
yay --noconfirm -S --needed "${INTERNET[@]}"
yay --noconfirm -S --needed "${IMAGE[@]}"
yay --noconfirm -S --needed "${VIDEO[@]}"
yay --noconfirm -S --needed "${AUDIO[@]}"
yay --noconfirm -S --needed "${MUSIC[@]}"

# config files
cp -rv .config $HOME
cp -rv .bashrc $HOME

# local scripts
mkdir -p $HOME/.local/bin
cp -rv .local/bin/* $HOME/.local/bin
chmod +x $HOME/.local/bin/*

# fonts
sudo cp -rv fonts/* /usr/share/fonts/
sudo fc-cache -fv

# pip
mkdir $HOME/.venv;
python -m venv $HOME/.venv/venv
source $HOME/.venv/venv/bin/activate
pip install syncedlyrics eyed3 bandcamp-downloader
