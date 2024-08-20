#!/bin/bash

# script para instalar todas as fontes do diretório atual
# autor: https://github.com/miguelgargallo/install-arch-fonts

# conferir se o usuário está rodando como root
if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root"
    exit 1
fi

# definir diretório atual
font_folder=$(pwd)

# conferir se a pasta de fontes existe
if [ ! -d "$font_folder" ]; then
    echo "The current working directory does not exist"
    exit 1
fi

# copiar todas as fontes para a pasta de fontes do sistema
cp -r $font_folder/*.otf /usr/share/fonts/

# atualizar cache das fontes
fc-cache -f -v

echo "All fonts have been successfully installed."
echo
sleep 2

# fechar janela do kitty 
kitty @ close-window

