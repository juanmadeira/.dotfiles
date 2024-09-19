#!/bin/bash
#
#	script de configuração do meu arch linux
#   [!!!] feito para ser executado após a instalação completa do arch com hyprland
#
#	— juan.
#	data: 2024-06-02
#
#	última atualização: 2024-08-04
#


##################
### INSTALAÇÃO ###
##################

sleep 2;
clear;
figlet ".dotfiles";
echo;

# copiar configurações
cp -r .config ~/;
cp -r .scripts ~/;
sudo chmod +x ~/.scripts/*;
sudo chmod +x ~/.config/hypr/scripts/*;
sudo chmod +x ~/.config/rofi/scripts/*;

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

# gtk
cp -r .config/gtk-3.0/themes ~/.local/share/;
cp -r .config/gtk-3.0/icons ~/.local/share/;
gsettings set org.gnome.desktop.interface gtk-theme Adapta-Nokto-Eta;
gsettings set org.gnome.desktop.interface icon-theme Nordic-darker;
gsettings set org.gnome.desktop.interface cursor-theme Bibata-Original-Ice;

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
yay -S gparted grub-customizer; # particionamento

# outros
yay -S btop eza man tar gum fzf downgrade starship github-cli lazygit neofetch onefetch; # terminal
yay -S neovim nano visual-studio-code-bin # editores de texto
yay -S ffmpeg mpv mpd vlc gwenview rhythmbox stremio; # reproducao de midia
yay -S easytag handbrake kdenlive; # edicao de midia
yay -S thunar tumbler thunar-volman gvfs yazi perl-image-exiftool mediainfo; # gerenciamento de arquivos
yay -S firefox obsidian filezilla tor-browser p7zip-gui qalculate-gtk; # outros

# jogos
yay -S lutris steam mangohud;

# spotify/spicetify
yay -S spotify spicetify-cli;
sudo chmod a+wr /opt/spotify;
sudo chmod a+wr /opt/spotify/Apps -R;
curl -fsSL https://raw.githubusercontent.com/spicetify/marketplace/main/resources/install.sh | sh;

# :)
yay -S cava cbonsai cmatrix-neo-git figlet pipes.sh tty-clock;
pipx install pycowsay;


##############
### OUTROS ###
##############

# grub-customizer
    sudo cp -r .etc/grub/evangelion-grub-theme /boot/grub/themes/;

# /etc/pacman.conf
    # ParallelDownloads = 5
    # ILoveCandy

