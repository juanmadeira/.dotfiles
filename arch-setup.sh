#
#	script de configuração do meu hyprland
#   [!!!] feito para ser executado após a instalação completa do arch com hyprwm
#
#	— juan.
#	data: 2024-06-02
#
#	última atualização: 2024-06-02
#

# instalar yay
sudo pacman -Sy --needed git base-devel;
git clone https://aur.archlinux.org/yay.git;
cd yay;
makepkg -si;

# waybar
sudo pacman -S waybar;
sudo cp -r ~/.dotfiles/waybar ~/.config/;
yay -S ttf-ubuntu-mono-nerd;

# outros pacotes
sudo pacman -S btop neofetch fzf lazygit firefox;