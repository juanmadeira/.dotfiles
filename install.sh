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
sudo pacman-key --populate;
sudo pacman --noconfirm -Syu hyprland;
sudo pacman --noconfirm -S nvidia nvidia-utils lib32-nvidia-utils nvidia-settings vulkan-icd-loader lib32-vulkan-icd-loader egl-wayland xdg-desktop-portal-hyprland xdg-desktop-portal-wlr;

# yay
sudo pacman --noconfirm -Sy --needed git base-devel;
git clone https://aur.archlinux.org/yay.git;
cd yay;
makepkg -si;
cd ..;
sudo rm -rf yay/;

# copiar configuracoes
cp -r .config ~/;
cp -r .scripts ~/;
sudo chmod +x ~/.scripts/*;
sudo chmod +x ~/.config/hypr/scripts/*;
sudo chmod +x ~/.config/rofi/scripts/*;
sudo chmod +x ~/.config/rmpc/scripts/*;
sudo chmod +x -R ~/*.AppImage

# wallust, gtk, ly e grub
yay --noconfirm -S wallust xdg-desktop-portal-gtk libportal-gtk3 libportal-gtk4 qt5ct qt6ct qt6-5compat qt6-declarative qt6-svg kvantum kvantum-qt5 ly;
cp -r .local/share/themes ~/.local/share; # temas gtk
cp -r .local/share/icons ~/.local/share; # icones gtk
sudo cp -r .config/Kvantum/themes/* /usr/share/Kvantum; # temas qt
sudo cp -r .etc/grub/* /boot/grub/themes/; # temas grub

# linguagens
yay --noconfirm -S python python-pip python-mpd2 nodejs npm php composer yarn apache mariadb go ruby rust lua jdk-openjdk jdk21-openjdk jdk8-openjdk;

# pip
mkdir ~/.venv;
python -m venv ~/.venv/venv;
python -m venv ~/.venv/spotdl;
source ~/.venv/spotdl/bin/activate;
pip install spotdl; # spotify downloader
source ~/.venv/venv/bin/activate;
pip install lyrics-in-terminal lyrics-in-terminal[mpd]; # letras no terminal
pip install bandcamp-downloader; # bandcamp downloader

# phpmyadmin [compilado localmente]
mkdir -p ~/.local/build;
cd ~/.local/build;
git clone https://github.com/phpmyadmin/phpmyadmin.git;
cd phpmyadmin;
composer install;
yarn install;
cd ~-;
cp -r .etc/phpmyadmin/* ~/.local/build/phpmyadmin/public/themes;

# wine
yay --noconfirm -S wine winetricks;
winetricks corefonts allfonts;

# flatpak
yay --noconfirm -S flatpak;
flatpak install flathub com.obsproject.Studio;
flatpak install flathub com.obsproject.Studio.Plugin.DroidCam;

# fontes e icones
yay --noconfirm -S ttf-ms-fonts; # fontes da microsoft x(
yay --noconfirm -S noto-fonts-cjk noto-fonts-emoji noto-fonts; # emojis e caracteres japoneses
sudo cp -r fonts/* /usr/share/fonts/;
    # geral -> FiraCode-..., HackNerdFontMono-..., OpenSans 
    # rofi  -> GrapeNuts-Regular, Icomoon-Feather, Isoveka-Nerd-Font-Complete, JetBrains-Mono-Nerd-Font-Complete

# hyprland
yay --noconfirm -S kitty btop eza man tar gum fzf downgrade starship github-cli lazygit neofetch onefetch cpufetch; # terminal
yay --noconfirm -S wlogout hyprlock hypridle hyprpaper hyprpicker; # bloqueio de tela e papel de parede
yay --noconfirm -S waybar rofi-wayland rofi-emoji-git dunst; # barra de notificacoes
yay --noconfirm -S wl-clipboard clipse; # area de transferencia
yay --noconfirm -S hyprshot; # captura de tela
yay --noconfirm -S bluetooth blueman xpadneo-dkms; # bluetooth
yay --noconfirm -S lib32-pipewire lib32-libpulse pipewire-pulse pipewire-jack pulsemixer; # audio
yay --noconfirm -S gparted grub-customizer gnome-disk-utility; # particionamento
yay --noconfirm -S neovim nano visual-studio-code-bin; # editores de texto
yay --noconfirm -S ffmpeg mpv vlc stremio shotwell libreoffice sioyek; # reproducao de midia
yay --noconfirm -S puddletag handbrake kdenlive krita darktable; # edicao de midia
yay --noconfirm -S thunar tumbler thunar-volman gvfs gvfs-mtp yazi perl-image-exiftool mediainfo ntfs-3g; # gerenciamento de arquivos
yay --noconfirm -S firefox chromium obsidian filezilla syncthing jellyfin tor-browser qbittorrent thunderbird ark qalculate-gtk gramps goocanvas; # outros

# musica
yay --noconfirm -S mpd mpdscribble mpd-discord-rpc rmpc spotify spicetify-cli songrec;
sudo chmod a+wr /opt/spotify;
sudo chmod a+wr /opt/spotify/Apps -R;
curl -fsSL https://raw.githubusercontent.com/spicetify/marketplace/main/resources/install.sh | sh; # spicetify

# jogos
yay --noconfirm -S lutris steam heroic-games-launcher-bin mangohud gamemode retroarch-assets-git;

# :)
yay --noconfirm -S cava cbonsai cmatrix-neo-git figlet pipes.sh tty-clock cowsay;

# systemd units
echo; echo; echo
if gum confirm "HABILITAR UNIDADES SYSTEMD? (ly; jellyfin; mpd-discord-rpc)" --prompt.foreground="#00cdcd" --selected.background="#003030"; then
    echo
    sudo systemctl enable --now ly
    sudo systemctl enable --now jellyfin
    systemctl --user enable --now mpd-discord-rpc 
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
