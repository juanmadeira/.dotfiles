#
#	script de configuração do meu hyprland
#   [!!!] feito para ser executado após a instalação completa do arch com hyprwm
#
#	— juan.
#	data: 2024-06-02
#
#	última atualização: 2024-07-25
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

# fontes e icones
yay -S hack-nf-mono-git hack-nf-git ttf-ubuntu-mono-nerd ttf-spacemono ttf-fira-code r-fontawesome ttf-roboto-variable noto-fonts-cjk noto-fonts-emoji noto-fonts;
sudo npm -g install material-icons@latest;
cd ~/.dotfiles/fonts;
chmod +x fonts.sh;
sudo ./fonts.sh;
cd ~;

# grub
# xhost si:localuser:root
# sudo -s
# grub-customizer

# cli apps
sudo pacman -S btop eza man fzf starship neofetch onefetch github-cli lazygit;
yay -S cava cbonsai cmatrix-neo-git pipes.sh; 
pipx install pycowsay;

# outros pacotes
sudo pacman -S firefox;


#################
### HYPRLAND ###
#################

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
sudo pacman -S thunar;
cp ~/.dotfiles/.config/xfce4 ~/.config/;

# waybar
sudo pacman -S waybar;
cp -r ~/.dotfiles/.config/waybar ~/.config/;

# rofi (menu launcher)
yay -Sy rofi;
cp -r ~/.dotfiles/.config/rofi ~/.config/;

# swww e waypaper
yay -S swww waypaper;
# pipx install waypaper pywal colorz;
# wal --backend colorz -i ".dotfiles/wallpapers/DSCF9244-1.jpg";
