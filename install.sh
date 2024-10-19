#!/bin/bash
#
#	script de configuração do meu arch hyprland
#   [!!!] feito para ser executado após a instalação limpa do arch linux
#
#	— juan.
#	data: 2024-06-02
#
#	última atualização: 2024-09-21
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

# copiar configuracoes
cp -r .config ~/;
cp -r .scripts ~/;
cp -r .config/gtk-3.0/icons ~/.local/share/;
cp -r .config/gtk-3.0/themes ~/.local/share/;
sudo chmod +x ~/.scripts/*;
sudo chmod +x ~/.config/hypr/scripts/*;
sudo chmod +x ~/.config/rofi/scripts/*;
sudo cp -r .etc/grub/evangelion-grub-theme /boot/grub/themes/;

# yay
sudo pacman -Sy --needed git base-devel;
git clone https://aur.archlinux.org/yay.git;
cd yay;
makepkg -si;
cd ..;
sudo rm -rf yay/;

# linguagens
yay -S python python-pip python-pipx nodejs npm php apache mariadb go;
pipx ensurepath;

# sddm
yay -S sddm qt6-5compat qt6-declarative qt6-svg;
sudo cp -r .etc/sddm /usr/share/sddm/themes/;
sudo cp .etc/sddm/sddm.conf /etc/;
systemctl start sddm.service;
systemctl enable sddm;

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
yay -S gparted grub-customizer gnome-disk-utility; # particionamento
yay -S kitty btop eza man tar gum fzf downgrade starship github-cli lazygit neofetch onefetch cpufetch; # terminal
yay -S neovim nano visual-studio-code-bin; # editores de texto
yay -S ffmpeg mpv mpd vlc gwenview zathura-pdf-mupdf rhythmbox stremio; # reproducao de midia
yay -S easytag handbrake kdenlive; # edicao de midia
yay -S thunar tumbler thunar-volman gvfs gvfs-mtp yazi perl-image-exiftool mediainfo ntfs-3g; # gerenciamento de arquivos
yay -S firefox obsidian filezilla syncthing jellyfin tor-browser qbittorrent thunderbird p7zip-gui qalculate-gtk; # outros

# jogos
yay -S lutris steam mangohud;
yay -S wine winetricks;
winetricks corefonts;

# spotify/spicetify
yay -S spotify spicetify-cli;
sudo chmod a+wr /opt/spotify;
sudo chmod a+wr /opt/spotify/Apps -R;
curl -fsSL https://raw.githubusercontent.com/spicetify/marketplace/main/resources/install.sh | sh;

# :)
yay -S cava cbonsai cmatrix-neo-git figlet pipes.sh tty-clock;
pipx install pycowsay;

reboot
