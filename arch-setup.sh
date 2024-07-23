#
#	script de configuração do meu hyprland
#   [!!!] feito para ser executado após a instalação completa do arch com hyprwm
#
#	— juan.
#	data: 2024-06-02
#
#	última atualização: 2024-06-08
#

# yay
sudo pacman -Sy --needed git base-devel;
git clone https://aur.archlinux.org/yay.git;
cd yay;
makepkg -si;

# pip
sudo pacman -S python python-pip python-pipx;
pipx ensurepath;

# npm
yay -S nodejs npm;

# outros pacotes
sudo pacman -S btop firefox fzf github-cli lazygit neofetch starship;

# fontes e icones
yay -S ttf-fira-code ttf-ubuntu-mono-nerd;
sudo npm -g install material-icons@latest;

# hyprconfig
sudo cp -r ~/.dotfiles/.config/hypr ~/.config/;

# eww [compilar]
cd ~;
mkdir build;
cd build;
sudo git clone https://aur.archlinux.org/eww.git;
cd eww;
gpg --recv-keys 862BA3D7D7760F13;
makepkg -si;
cd ~;

    # eww widgets
    # barra de status [https://github.com/Saimoomedits/eww-widgets]

# rofi (menu launcher)
sudo pacman -S rofi;
sudo cp -r ~/.dotfiles/.config/rofi ~/.config/;

    # rofi scripts
    # música, wifi, mount, screenshot, launcher [https://github.com/niraj998/Rofi-Scripts]

# waybar
# sudo pacman -S waybar;
# sudo cp -r ~/.dotfiles/.config/waybar ~/.config/;

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

#
# para fazer:
# configurar o swww -> waypaper -> pywal
#

pipx install waypaper pywal colorz;
wal --backend colorz -i ".dotfiles/wallpapers/DSCF9244-1.jpg";
