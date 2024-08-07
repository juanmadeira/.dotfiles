#!/bin/bash

# https://github.com/gustavomarchesim/dotfiles

# Esperar 1 segundo e limpa a tela
sleep 1
clear

# Exibir "Limpeza" usando figlet
figlet "Limpeza"
echo

# Perguntar ao usuário se deseja iniciar a limpeza
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

# Remover pacotes órfãos
if sudo pacman -Rns $(pacman -Qtdq); then
    echo ":: Pacotes órfãos removidos com sucesso"
    sleep 2
else
    echo ":: Nenhum pacote órfão encontrado ou erro ao remover pacotes"
    sleep 2
fi

# Limpar cache do Yay
if yay -Scc --noconfirm; then
    echo ":: Cache do Yay limpo com sucesso"
    sleep 2
else
    echo ":: Erro ao limpar o cache do Yay"
    sleep 2
fi

# Enviar notificação de conclusão
notify-send "Limpeza completa"
echo
echo ":: Limpeza completa"

# Pausar para o usuário visualizar a mensagem
sleep 2

# Fechar janela do Kitty
kitty @ close-window
