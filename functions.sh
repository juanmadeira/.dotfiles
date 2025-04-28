#!/bin/env sh

# função para verificar se o pacote está instalado
isInstalled() {
    pacman -Qi "$1" &> /dev/null
}

# função para verificar se o grupo está instalado
isGroupInstalled() {
    pacman -Qg "$1" &> /dev/null
}

# função para instalar pacotes não instalados
installPackages() {
    local packages=("$@")
    local toInstall=()

    for pkg in "${packages[@]}"; do
        if ! isInstalled "$pkg" && ! isGroupInstalled "$pkg"; then
            toInstall+=("$pkg")
        fi
    done

    if [ ${#toInstall[@]} -ne 0 ]; then
        echo "Instalando: ${toInstall[*]}"
        yay -S --noconfirm "${toInstall[@]}"
    fi
}

# funcao para instalar flatpaks
installFlatpaks() {
    local flatpackages=("$@")

    for pak in "${flatpackages[@]}"; do
        if ! flatpak list | grep -i "$pak" &> /dev/null; then
            echo "Instalando Flatpak: $pak"
            flatpak install --noninteractive "$pak"
        else
            echo "Flatpak já instalado: $pak"
        fi
    done
}
