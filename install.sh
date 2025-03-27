#!/bin/bash
#
#	script de configuração do meu arch hyprland
#       [!!!] feito para ser executado após a instalação limpa do arch linux
#
#	— juan.
#	data: 2024-06-02
#
#	última atualização: 2025-03-15
#


##################
### INSTALAÇÃO ###
##################

sleep 2;
echo "       _       _    __ _ _          ";
echo "    __| | ___ | |_ / _(_) | _______ ";
echo "   / _| |/ _ || __| |_| | |/ _ | __|";
echo "  | (_| | (_) | |_|  _| | | __/|__ |";
echo "(_)___,_||___/|_| |_| |_|_|___|____/";
echo "                                    ";

# hyprland
sudo pacman-key --populate
sudo pacman --noconfirm -Syu hyprland
sudo pacman --noconfirm -S nvidia nvidia-utils lib32-nvidia-utils nvidia-settings vulkan-icd-loader lib32-vulkan-icd-loader # video
sudo pacman --noconfirm -S egl-wayland xdg-desktop-portal-hyprland xwaylandvideobridge xorg-xhost # compositor

# yay
sudo pacman --noconfirm -Sy --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
sudo rm -rf yay/

# copiar configuracoes
cp .bashrc ~/
cp -r .config ~/
cp -r .scripts ~/
sudo chmod +x ~/.scripts/*
sudo chmod +x ~/.config/hypr/scripts/*
sudo chmod +x ~/.config/rofi/scripts/*
sudo chmod +x ~/.config/rmpc/scripts/*
sudo chmod +x -R ~/*.AppImage

# boot e display managers
yay --noconfirm -S ly grub-customizer
sudo cp -r .etc/grub/* /boot/grub/themes/ # temas grub

# tematização (gtk e qt) / wallust 
yay --noconfirm -S wallust python-pywalfox
yay --noconfirm -S gtk2 gtk3 gtk4 awf-gtk2 awf-gtk3 awf-gtk4
yay --noconfirm -S qt5ct qt6ct qt6-5compat qt6-declarative qt6-svg kvantum kvantum-qt5
cp -r .local/share/themes/ ~/.local/share # temas gtk
cp -r .local/share/icons/ ~/.local/share # icones gtk
sudo ln -s ~/.local/share/themes/wallust/ /usr/share/themes # link para o tema
sudo cp -r .config/Kvantum/themes/* /usr/share/Kvantum # qt

# linguagens
yay --noconfirm -S nodejs npm yarn
yay --noconfirm -S go ruby rust lua
yay --noconfirm -S python python-pip python-mpd2
yay --noconfirm -S php phpmyadmin composer mariadb apache
yay --noconfirm -S jdk-openjdk jdk21-openjdk jdk8-openjdk

# pip
mkdir ~/.venv;
python -m venv ~/.venv/venv
python -m venv ~/.venv/spotdl
source ~/.venv/spotdl/bin/activate
pip install spotdl # spotify downloader
source ~/.venv/venv/bin/activate
pip install syncedlyrics eyed3 lyrics-in-terminal lyrics-in-terminal[mpd] # letras no terminal
pip install bandcamp-downloader # bandcamp downloader

# flatpak
yay --noconfirm -S flatpak
flatpak install flathub com.obsproject.Studio
flatpak install flathub com.obsproject.Studio.Plugin.DroidCam

# fontes e icones
yay --noconfirm -S ttf-ms-fonts # fontes da microsoft x(
yay --noconfirm -S noto-fonts-cjk noto-fonts-emoji noto-fonts # emojis e caracteres japoneses
sudo cp -r fonts/* /usr/share/fonts/
    # geral -> FiraCode-..., HackNerdFontMono-..., OpenSans 
    # rofi  -> GrapeNuts-Regular, Icomoon-Feather, Isoveka-Nerd-Font-Complete, JetBrains-Mono-Nerd-Font-Complete

# imagem e video
yay --noconfirm -S ffmpeg ffmpegthumbnailer mpv vlc shotwell stremio
yay --noconfirm -S imagemagick handbrake kdenlive krita darktable

# audio e musica
yay --noconfirm -S lib32-pipewire lib32-libpulse pipewire-alsa pipewire-pulse pipewire-jack pulsemixer
yay --noconfirm -S mpd mpdscribble mpd-discord-rpc mpc rmpc spotify spicetify-cli songrec puddletag
sudo chmod a+wr /opt/spotify
sudo chmod a+wr /opt/spotify/Apps -R
curl -fsSL https://raw.githubusercontent.com/spicetify/marketplace/main/resources/install.sh | sh # spicetify

# terminal e texto
yay --noconfirm -S kitty starship
yay --noconfirm -S github-cli lazygit
yay --noconfirm -S fastfetch onefetch cpufetch
yay --noconfirm -S yazi perl-image-exiftool mediainfo
yay --noconfirm -S bat btop eza man gum fzf downgrade
yay --noconfirm -S neovim nano visual-studio-code-bin obsidian libreoffice sioyek

# gerenciamento de arquivos e particionamento
yay --noconfirm -S thunar thunar-volman tumbler tumbler-extra-thumbnailers gvfs gvfs-mtp ark rar tar
yay --noconfirm -S filezilla syncthing jellyfin qbittorrent thunderbird
yay --noconfirm -S ntfs-3g gparted gnome-disk-utility

# outros
yay --noconfirm -S firefox chromium tor-browser # navegadores
yay --noconfirm -S bluetooth blueman xpadneo-dkms # bluetooth
yay --noconfirm -S qalculate-gtk gramps wine winetricks # outros
yay --noconfirm -S hyprlock hypridle hyprpaper hyprpicker hyprshot # hyprtools
yay --noconfirm -S lutris steam heroic-games-launcher-bin mangohud gamemode # jogos
yay --noconfirm -S waybar rofi-wayland rofi-emoji-git dunst wlogout clipse # ferramentas
yay --noconfirm -S cava cbonsai cmatrix-neo-git figlet pipes.sh tty-clock cowsay # legal :)

# systemd units
echo; echo; echo
if gum confirm "HABILITAR UNIDADES SYSTEMD? (ly; jellyfin; mpd-discord-rpc)" --prompt.foreground="#00cdcd" --selected.background="#003030"; then
    echo
    sudo systemctl enable ly
    sudo systemctl enable jellyfin
    systemctl --user enable mpd 
    systemctl --user enable mpd-discord-rpc 
elif [ $? -eq 130 ]; then
    echo
    echo ":: Unidades não iniciadas. O display manager (ly) terá de ser habilitado manualmente."
else
    echo
    echo ":: Unidades não iniciadas. O display manager (ly) terá de ser habilitado manualmente."
fi

# reiniciar sistema
echo; echo; echo
figlet "Instalacao concluida!"
echo
if gum confirm "REINICIAR SISTEMA?" --prompt.foreground="#00cdcd" --selected.background="#003030"; then
    echo
    echo ":: Reiniciando sistema..."
    sleep 2

    # breathe and
    reboot

elif [ $? -eq 130 ]; then
    echo
    echo ":: Reinicialização cancelada."
else
    echo
    echo ":: Reinicialização cancelada."
fi
