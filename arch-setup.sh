#
#	script de configuração do meu hyprland
#   [!!!] feito para ser executado após a instalação completa do arch com hyprwm
#
#	— juan.
#	data: 2024-06-02
#
#	última atualização: 2024-06-02
#

# yay
sudo pacman -Sy --needed git base-devel;
git clone https://aur.archlinux.org/yay.git;
cd yay;
makepkg -si;

# hyprconfig
sudo cp -r ~/.dotfiles/hypr ~/.config/;

# waybar
sudo pacman -S waybar;
sudo cp -r ~/.dotfiles/waybar ~/.config/;
yay -S ttf-ubuntu-mono-nerd;

# rofi (menu launcher)
sudo pacman -S rofi;
sudo cp -r ~/.dotfiles/rofi ~/.config/;

    # rofi scripts
    # [https://github.com/niraj998/Rofi-Scripts]

# eww [compilar]
cd /opt;
sudo git clone https://github.com/elkowar/eww;
cd eww;
cargo build --release --no-default-features --features=wayland;
cd target/release;
chmod +x ./eww;
cd ~;

    # eww widgets
    # barra de status [https://github.com/Saimoomedits/eww-widgets]

# pip
sudo pacman -S python python-pip python-pipx;
pipx ensurepath;

# wallpaper setting

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

# outros pacotes
sudo pacman -S btop firefox fzf github-cli lazygit neofetch starship;
