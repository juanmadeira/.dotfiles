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
yay -S python python-pip python-pipx nodejs npm php apache mariadb go ;
pipx ensurepath;

# sddm
yay -S sddm qt6-5compat qt6-declarative qt6-svg;
sudo cp ~/.dotfiles/.etc/sddm /usr/share/sddm/themes/;
sudo cp ~/.dotfiles/.etc/sddm/sddm.conf /etc/;

# fontes e icones
yay -S noto-fonts-cjk noto-fonts-emoji noto-fonts; # caracteres japoneses
sudo cp ~/.dotfiles/fonts/* /usr/share/fonts/;
    # geral -> FiraCode-..., HackNerdFontMono-... 
    # rofi  -> GrapeNuts-Regular, Icomoon-Feather, Isoveka-Nerd-Font-Complete, JetBrains-Mono-Nerd-Font-Complete
    # sddm  -> OpenSans

# hyprland
yay -S waybar rofi-wayland dunst; # barra de notificacoes
yay -S wlogout hyprlock hypridle; # bloqueio de tela
yay -S wl-clipboard clipse; # area de transferencia
yay -S swww waypaper; # papel de parede
yay -S hyprshot; # captura de tela
yay -S gparted grub-customizer; # particionamento

# outros
yay -S btop eza man tar gum fzf starship github-cli lazygit; # terminal
yay -S neofetch onefetch; # fetches
yay -S neovim nano visual-studio-code-bin # editores de texto
yay -S mpv mpd ffmpeg swappy rhythmbox spotify stremio; # reproducao de midia
yay -S firefox thunar p7zip-gui;
pipx install pycowsay;

# :)
yay -S cava cbonsai cmatrix-neo-git pipes.sh;


##############
### OUTROS ###
##############

# gparted
    # xhost si:localuser:root
    # sudo gparted

# grub-customizer
    # xhost si:localuser:root
    # sudo grub-customizer

# /etc/pacman.conf
    # ParallelDownloads = 7
    # ILoveCandy 
