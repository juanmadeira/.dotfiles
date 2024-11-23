#!/bin/bash

# autor: https://github.com/gustavomarchesim/dotfiles
# script para limpar pacotes órfãos e cache do yay/pacman

# esperar 1 segundo e limpar a tela
sleep 1
clear

# exibir "Limpeza" usando figlet
figlet "Limpeza"
echo

# perguntar ao usuário se deseja iniciar a limpeza
if gum confirm "VOCÊ DESEJA INICIAR A LIMPEZA AGORA?"; then
    echo 
    echo ":: Limpeza iniciada."
elif [ $? -eq 130 ]; then
    exit 130
else
    echo
    echo ":: Limpeza cancelada."
    kitty @ close-window
    exit
fi

# remover pacotes órfãos
if sudo pacman -Rns $(pacman -Qtdq); then
    echo ":: Pacotes órfãos removidos com sucesso"
    sleep 2
else
    echo ":: Nenhum pacote órfão encontrado ou erro ao remover pacotes"
    sleep 2
fi

# limpar cache do yay
if yay -Scc --noconfirm; then
    echo ":: Cache do Yay limpo com sucesso"
    sleep 2
else
    echo ":: Erro ao limpar o cache do Yay"
    sleep 2
fi

# enviar notificação de conclusão
notify-send "Limpeza completa"
echo
echo ":: Limpeza completa"

# pausar para o usuário visualizar a mensagem
sleep 2

# fechar janela do kitty
kitty @ close-window

