# clonar .dotfiles
git clone https://github.com/juanmadeira/.dotfiles;

# instalar yay
sudo pacman -Sy --needed git base-devel;
git clone https://aur.archlinux.org/yay.git;
cd yay;
makepkg -si;

# waybar
sudo pacman -S waybar;
sudo cp ~/.dotfiles/waybar ~/.config/
yay -S ttf-hack-nerd;