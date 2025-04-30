#!/bin/env sh
#
#	script de configuração do meu hyprland
#       [!!!] feito para ser executado apos uma instalação limpa do arch linux
#
#	— juan.
#	data: 2024-06-02
#
#	última atualização: 2025-04-29
#

##################
### INSTALAÇÃO ###
##################

clear
sleep 2;
echo "       _       _    __ _ _          ";
echo "    __| | ___ | |_ / _(_) | _______ ";
echo "   / _| |/ _ || __| |_| | |/ _ | __|";
echo "  | (_| | (_) | |_|  _| | | __/|__ |";
echo "(_)___,_||___/|_| |_| |_|_|___|____/";
echo "                                    ";

# instalar yay
sudo pacman-key --populate
sudo pacman --noconfirm -Sy --needed git base-devel
git clone https://aur.archlinux.org/yay.git
cd yay
makepkg -si
cd ..
sudo rm -rf yay/

# copiar configurações
cp -v .bashrc ~/
cp -r -v .config ~/
cp -r -v .scripts ~/
cp -r -v .local/share/themes/ ~/.local/share # temas gtk
cp -r -v .local/share/icons/ ~/.local/share # icones gtk
sudo cp -r -v .config/Kvantum/themes/* /usr/share/Kvantum # qt
sudo ln -s ~/.local/share/themes/wallust/ /usr/share/themes # link para o tema
sudo cp -r -v .etc/grub/* /boot/grub/themes/ # temas grub
sudo cp -r fonts/* /usr/share/fonts/
    # geral -> FiraCode-..., HackNerdFontMono-..., OpenSans 
    # rofi  -> GrapeNuts-Regular, Icomoon-Feather, Isoveka-Nerd-Font-Complete, JetBrains-Mono-Nerd-Font-Complete

# permitir executáveis
sudo chmod +x ~/.scripts/*
sudo chmod +x ~/.config/hypr/scripts/*
sudo chmod +x ~/.config/rofi/scripts/*
sudo chmod +x ~/.config/rmpc/scripts/*

# importar funções e pacotes para serem instalados
source ./functions.sh
source ./packages.conf

# instalar pacotes com yay
installPackages "${temas[@]}"
installPackages "${linguagens[@]}"
installPackages "${sistema[@]}"
installPackages "${fontes[@]}"
installPackages "${imagem[@]}"
installPackages "${video[@]}"
installPackages "${audio[@]}"
installPackages "${musica[@]}"
installPackages "${terminal[@]}"
installPackages "${texto[@]}"
installPackages "${gerenciamento[@]}"
installPackages "${particionamento[@]}"
installPackages "${hyprtools[@]}"
installPackages "${navegadores[@]}"
installPackages "${bluetooth[@]}"
installPackages "${jogos[@]}"
installPackages "${ferramentas[@]}"
installPackages "${legais[@]}"
installPackages "${outros[@]}"

# instalar pacotes com flatpak
installFlatpaks "${flatpaks[@]}"

# instalar pacotes com pip
mkdir ~/.venv;
python -m venv ~/.venv/venv
python -m venv ~/.venv/spotdl
source ~/.venv/spotdl/bin/activate
    pip install spotdl # spotify downloader
source ~/.venv/venv/bin/activate
    pip install syncedlyrics eyed3 lyrics-in-terminal lyrics-in-terminal[mpd] # letras no terminal
    pip install bandcamp-downloader # bandcamp downloader
 
# instalar spicetify
sudo chmod a+wr /opt/spotify
sudo chmod a+wr /opt/spotify/Apps -R
curl -fsSL https://raw.githubusercontent.com/spicetify/marketplace/main/resources/install.sh | sh # spicetify

# habilitar systemd units
echo; echo; echo
if gum confirm "HABILITAR UNIDADES SYSTEMD? (ly; bluetooth; jellyfin; mpd-discord-rpc)" --prompt.foreground="#00cdcd" --selected.background="#003030"; then
    echo
    sudo systemctl enable ly
    sudo systemctl enable jellyfin
    systemctl --user enable mpd 
    systemctl --user enable mpd-discord-rpc 
elif [ $? -eq 130 ]; then
    echo
    echo ":: Unidades não iniciadas. O display manager (ly) terá de ser habilitado manualmente."
else
    echo
    echo ":: Unidades não iniciadas. O display manager (ly) terá de ser habilitado manualmente."
fi

# reiniciar sistema
echo; echo; echo
figlet "Instalacao concluida!"
echo
if gum confirm "REINICIAR SISTEMA?" --prompt.foreground="#00cdcd" --selected.background="#003030"; then
    echo
    echo ":: Reiniciando sistema..."
    sleep 2

    # breathe and
    reboot

elif [ $? -eq 130 ]; then
    echo
    echo ":: Reinicialização cancelada."
else
    echo
    echo ":: Reinicialização cancelada."
fi
