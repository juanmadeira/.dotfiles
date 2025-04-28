#!/bin/env sh

# funcao para verificar se o pacote esta instalado
is_installed() {
    pacman -Qi "$1" &> /dev/null
}

# funcao para verificar se o grupo esta instalado
is_group_installed() {
    pacman -Qg "$1" &> /dev/null
}

# funcao para instalar pacotes nao instalados
install_packages() {
    local packages=("$@")
    local to_install=()

    for pkg in "${packages[@]}"; do
        if ! is_installed "$pkg" && ! is_group_installed "$pkg"; then
            to_install+=("$pkg")
        fi
    done

    if [ ${#to_install[@]} -ne 0 ]; then
        echo "Instalando: ${to_install[*]}"
        yay -S --noconfirm "${to_install[@]}"
    fi
}

# funcao para instalar flatpaks
install_flatpaks() {
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
