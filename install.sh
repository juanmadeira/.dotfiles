#!/bin/env sh
#
#	script de configuração do meu sway
#       [!!!] feito para ser executado apos uma instalação limpa do arch linux
#
#	— juan.
#	data: 2024-08-08
#
#	última atualização: 2025-08-08
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

# importar funções e pacotes para serem instalados
source ./functions.sh
source ./packages.conf

# instalar pacotes com yay
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
installPackages "${navegadores[@]}"
installPackages "${bluetooth[@]}"
installPackages "${jogos[@]}"
installPackages "${ferramentas[@]}"
installPackages "${legais[@]}"
installPackages "${outros[@]}"

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
if gum confirm "HABILITAR UNIDADES SYSTEMD? (ly; bluetooth; mpd-discord-rpc)" --prompt.foreground="#00cdcd" --selected.background="#003030"; then
    echo
    sudo systemctl enable ly
    systemctl --user enable mpd 
    systemctl --user enable mpd-discord-rpc 
elif [ $? -eq 130 ]; then
    echo
    echo ":: Unidades não iniciadas. Será necessário habilitá-las manualmente."
else
    echo
    echo ":: Unidades não iniciadas. Será necessário habilitá-las manualmente."
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
