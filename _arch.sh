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

# cli apps
sudo pacman -S btop eza fzf starship neofetch github-cli lazygit;
yay -S cava pipes.sh cmatrix-neo-git;
pipx install pycowsay;

# outros pacotes
sudo pacman -S firefox;


#################
### HYPRLAND ###
#################

# hyprland
sudo cp -r ~/.dotfiles/.config/hypr ~/.config/;

# kitty
sudo cp -r ~/.dotfiles/.config/kitty ~/.config/;

# waybar
sudo pacman -S waybar;
sudo cp -r ~/.dotfiles/.config/waybar ~/.config/;

# rofi (menu launcher)
yay -Sy rofi playerctl mpc jq maim simple-mtpfs ffmpeg fuse2 wmctrl xclip;
sudo cp -r ~/.dotfiles/.config/rofi ~/.config/;

# wallpaper
    # swww [compilar]
    cd /opt;
    git clone https://github.com/LGFae/swww;
    cd swww;
    sudo cargo build --release;
    cd target/release;
    sudo cp -r swww ~/.local/bin;
    sudo cp -r swww-daemon ~/.local/bin;
    cd ~;

    # para fazer:
    # configurar o swww -> waypaper -> pywal

    pipx install waypaper pywal colorz;
    wal --backend colorz -i ".dotfiles/wallpapers/DSCF9244-1.jpg";
