#
#	script de configuração do meu arch linux
#   [!!!] feito para ser executado após a instalação completa do arch com hyprland
#
#	— juan.
#	data: 2024-06-02
#
#	última atualização: 2024-07-31
#

##################
### INSTALAÇÃO ###
##################

# .dotfiles
git clone https://github.com/juanmadeira/.dotfiles;
cd .dotfiles;
cp -r .config/* ~/.config;
cp -r .scripts ~/;
cd ~;

# yay
sudo pacman -Sy --needed git base-devel;
git clone https://aur.archlinux.org/yay.git;
cd yay;
makepkg -si;

# linguagens
yay -S nodejs npm php apache mariadb python python-pip python-pipx;
pipx ensurepath;

# sddm
yay -S sddm qt6-5compat qt6-declarative qt6-svg;
sudo cp ~/.dotfiles/.etc/sddm /usr/share/sddm/themes/;
sudo cp ~/.dotfiles/.etc/sddm/sddm.conf /etc/;

# fontes e icones
yay -S hack-nf-mono-git hack-nf-git; # kitty
yay -S noto-fonts-cjk noto-fonts-emoji noto-fonts; # caracteres japoneses
sudo cp ~/.dotfiles/fonts/* /usr/share/fonts/;
    # rofi  -> GrapeNuts-Regular, Icomoon-Feather, Isoveka-Nerd-Font-Complete, JetBrains-Mono-Nerd-Font-Complete
    # sddm  -> OpenSans

# outros
yay -S firefox thunar waybar rofi-wayland swww waypaper grub-customizer;
yay -S btop eza man unzip tar fzf starship github-cli lazygit;
yay -S neofetch onefetch cava cbonsai cmatrix-neo-git pipes.sh; 
yay -S neovim mpv mpd hyprshot clipse;
pipx install pycowsay;


##############
### OUTROS ###
##############

# grub-customizer
    # xhost si:localuser:root
    # sudo -s
    # grub-customizer

# /etc/pacman.conf
    # ParallelDownloads = 7
    # ILoveCandy 
