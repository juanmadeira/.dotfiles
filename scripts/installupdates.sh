# !/bin/bash

# https://github.com/gustavomarchesim/dotfiles

# Espera 1 segundo e limpa a tela
sleep 1
clear

# Exibe "Atualizações" usando figlet
figlet "Atualizar"
echo

# Função para verificar se um pacote está instalado com yay
_isInstalledYay() {
    package="$1"
    check="$(yay -Qs --color always "${package}" | grep "local" | grep "${package} ")"
    if [ -n "${check}" ]; then
        return 0 # true
    else
        return 1 # false
    fi
}

# ------------------------------------------------------
# Confirmar Início
# ------------------------------------------------------

# Pergunta ao usuário se deseja iniciar a atualização
if gum confirm "VOCÊ DESEJA INICIAR A ATUALIZAÇÃO AGORA?"; then
    echo 
    echo ":: Atualização iniciada."
elif [ $? -eq 130 ]; then
    exit 130
else
    echo
    echo ":: Atualização cancelada."
    exit
fi

# Verifica se o timeshift está instalado
if _isInstalledYay "timeshift"; then
    # Pergunta ao usuário se deseja criar um snapshot
    if gum confirm "VOCÊ DESEJA CRIAR UM SNAPSHOT?"; then
        echo
        # Solicita um comentário para o snapshot
        c=$(gum input --placeholder "Digite um comentário para o snapshot...")
        # Cria o snapshot com o comentário fornecido
        sudo timeshift --create --comments "$c"
        sudo timeshift --list
        sudo grub-mkconfig -o /boot/grub/grub.cfg
        echo ":: PRONTO. Snapshot '$c' criado!"
        echo
    elif [ $? -eq 130 ]; then
        echo ":: Snapshot cancelado."
        exit 130
    else
        echo ":: Snapshot cancelado."
    fi
    echo
fi

# Executa a atualização com yay
yay

# Envia uma notificação informando que a atualização foi concluída
notify-send "Atualização completa"
echo 
echo ":: Atualização completa"
sleep 2
