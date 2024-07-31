#
#	script de configuração do meu arch linux
#   [!!!] feito para ser executado após a instalação completa do arch com hyprland
#
#	— juan.
#	data: 2024-06-02
#
#	última atualização: 2024-07-30
#

############
### ARCH ###
############

# yay
sudo pacman -Sy --needed git base-devel;
git clone https://aur.archlinux.org/yay.git;
cd yay;
makepkg -si;

# pipx
sudo pacman -S python python-pip python-pipx;
pipx ensurepath;

# npm
sudo pacman -S nodejs npm;

# php
sudo pacman -S php apache mariadb;

# grub
sudo pacman -S grub-customizer;
    # xhost si:localuser:root
    # sudo -s
    # grub-customizer

# fontes e icones
yay -S hack-nf-mono-git hack-nf-git ttf-ubuntu-mono-nerd ttf-spacemono ttf-fira-code r-fontawesome ttf-roboto-variable noto-fonts-cjk noto-fonts-emoji noto-fonts;
sudo npm -g install material-icons@latest;
cd ~/.dotfiles/fonts;
chmod +x fonts.sh;
sudo ./fonts.sh;
cd ~;

# cli apps
yay -S btop eza man unzip tar fzf starship github-cli lazygit;
yay -S neofetch onefetch cava cbonsai cmatrix-neo-git pipes.sh; 
pipx install pycowsay;

# outros pacotes
sudo pacman -S firefox;
yay -S hyprshot clipse;


################
### HYPRLAND ###
################

# hyprland
cp -r ~/.dotfiles/.config/hypr ~/.config/;

# kitty
cp -r ~/.dotfiles/.config/kitty ~/.config/;

# sddm
sudo pacman -S sddm qt6-5compat qt6-declarative qt6-svg;
sudo cp ~/.dotfiles/.config/sddm /usr/share/sddm/themes/;
sudo cp ~/.dotfiles/.config/sddm/Fonts/* /usr/share/fonts/;
sudo cp ~/.dotfiles/.config/sddm.conf /etc/;

# thunar
yay -S thunar;
cp ~/.dotfiles/.config/xfce4 ~/.config/;

# waybar
yay -S waybar;
cp -r ~/.dotfiles/.config/waybar ~/.config/;

# rofi (menu launcher)
yay -S rofi-wayland;
cp -r ~/.dotfiles/.config/rofi ~/.config/;

# mpv
yay -S mpv;
cp -r ~/.dotfiles/.config/mpv ~/.config/;

# swww e waypaper
yay -S swww waypaper;
cp -r ~/.dotfiles/.config/waypaper ~/.config/;

##############
### OUTROS ###
##############

# /etc/pacman.conf
    # ParallelDownloads = 7
    # ILoveCandy 
