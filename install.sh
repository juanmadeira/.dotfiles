#!/bin/bash
#
#	script de configuração do meu arch hyprland
#   [!!!] feito para ser executado após a instalação limpa do arch linux
#
#	— juan.
#	data: 2024-06-02
#
#	última atualização: 2024-12-11
#


##################
### INSTALAÇÃO ###
##################

sleep 2;
clear;
figlet ".dotfiles";
echo;

# hyprland
sudo pacman -S hyprland;
sudo pacman -S nvidia nvidia-utils lib32-nvidia-utils nvidia-settings vulkan-icd-loader lib32-vulkan-icd-loader egl-wayland;

# yay
sudo pacman -Sy --needed git base-devel;
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

# gtk, qt, grub e sddm
yay -S sddm qt5ct qt6ct qt6-5compat qt6-declarative qt6-svg kvantum kvantum-qt5;
cp -r .config/gtk-3.0/icons ~/.local/share/; # icones gtk
cp -r .config/gtk-3.0/themes ~/.local/share/; # temas gtk
sudo cp -r .config/Kvantum/themes/* /usr/share/Kvantum/; # temas qt
sudo cp -r .etc/grub/* /boot/grub/themes/; # temas grub
sudo cp -r .etc/sddm /usr/share/sddm/themes/; # temas sddm
sudo cp .etc/sddm/sddm.conf /etc/; # config sddm
systemctl start sddm.service;
systemctl enable sddm;

# linguagens
yay -S python python-pip python-mpd2 nodejs npm php composer yarn apache mariadb go ruby jdk-openjdk jdk21-openjdk jdk8-openjdk;
python -m venv ~/.venv;
source ~/.venv/bin/activate;

# compilados localmente
# phpmyadmin
mkdir ~/.local/build;
cd ~/.local/build;
git clone https://github.com/phpmyadmin/phpmyadmin.git;
cd phpmyadmin;
composer install;
yarn install;
cd ~-;
cp -r .etc/phpmyadmin/* ~/.local/build/phpmyadmin/public/themes;

# flatpak
yay -S flatpak;
flatpak install flathub com.obsproject.Studio;
flatpak install flathub com.obsproject.Studio.Plugin.DroidCam;

# fontes e icones
yay -S noto-fonts-cjk noto-fonts-emoji noto-fonts; # emojis e caracteres japoneses
yay -S ttf-ms-fonts; # fontes da microsoft x(
sudo cp -r fonts/* /usr/share/fonts/;
    # geral -> FiraCode-..., HackNerdFontMono-... 
    # rofi  -> GrapeNuts-Regular, Icomoon-Feather, Isoveka-Nerd-Font-Complete, JetBrains-Mono-Nerd-Font-Complete
    # sddm  -> OpenSans

# hyprland
yay -S waybar rofi-wayland rofi-emoji-git dunst; # barra de notificacoes
yay -S wlogout hyprlock hypridle; # bloqueio de tela
yay -S wl-clipboard clipse; # area de transferencia
yay -S swww waypaper; # papel de parede
yay -S hyprshot; # captura de tela
yay -S bluetooth blueman xpadneo-dkms; # bluetooth
yay -S pipewire-pulse pulsemixer; # audio
yay -S gparted grub-customizer gnome-disk-utility; # particionamento
yay -S kitty btop eza man tar gum fzf downgrade starship github-cli lazygit neofetch onefetch cpufetch; # terminal
yay -S neovim nano visual-studio-code-bin; # editores de texto
yay -S ffmpeg mpv vlc stremio gwenview kimageformats sioyek; # reproducao de midia
yay -S easytag handbrake kdenlive krita darktable; # edicao de midia
yay -S thunar tumbler thunar-volman gvfs gvfs-mtp yazi perl-image-exiftool mediainfo ntfs-3g; # gerenciamento de arquivos
yay -S firefox obsidian filezilla syncthing jellyfin tor-browser qbittorrent thunderbird ark qalculate-gtk gramps goocanvas; # outros

# musica
yay -S mpd mpdscribble rmpc-git spotify spicetify-cli; # players de musica
pip install lyrics-in-terminal lyrics-in-terminal[mpd]; # letras no terminal
pip install bandcamp-downloader; # bandcamp downloader
pip install spotdl; # spotify downloader
sudo chmod a+wr /opt/spotify;
sudo chmod a+wr /opt/spotify/Apps -R;
curl -fsSL https://raw.githubusercontent.com/spicetify/marketplace/main/resources/install.sh | sh; # spicetify

# jogos
yay -S lutris steam mangohud gamemode retroarch-assets-git;
yay -S wine winetricks;
winetricks corefonts;

# :)
yay -S cava cbonsai cmatrix-neo-git figlet pipes.sh tty-clock cowsay;

reboot
