#!/bin/bash

DOTS="$HOME/.dotfiles"

# yay
sudo pacman-key --populate
sudo pacman --noconfirm -Sy --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay; makepkg -si; cd ..; rm -rf yay

# wayland-sessions
sudo mkdir -p /usr/share/wayland-sessions
sudo cp $DOTS/dwl/dwl.desktop /usr/share/wayland-sessions

# local scripts
mkdir -p $HOME/.local/bin
cp -r $DOTS/.local/bin/* $HOME/.local/bin
sudo chmod +x $HOME/.local/bin/*

# instalar pacotes
source $DOTS/packages.conf
isInstalled() {
	pacman -Qi "$1" &> /dev/null
}
isGroupInstalled() {
	pacman -Qg "$1" &> /dev/null
}
install() {
	local packages=("$@")
	local toInstall=()
	for pkg in "${packages[@]}"; do
		if ! isInstalled "$pkg" && ! isGroupInstalled "$pkg"; then
			toInstall+=("$pkg")
		fi
	done
	if [ ${#toInstall[@]} -ne 0 ]; then
		echo "Installing: ${toInstall[*]}"
		yay -S --noconfirm "${toInstall[@]}"
	fi
}
install "${TERMINAL[@]}"
install "${TOOLS[@]}"
install "${FILE_MANAGEMENT[@]}"
install "${INTERNET[@]}"
install "${IMAGE[@]}"
install "${VIDEO[@]}"
install "${AUDIO[@]}"
install "${MUSIC[@]}"
