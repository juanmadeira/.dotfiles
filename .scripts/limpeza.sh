#!/bin/bash

# https://github.com/gustavomarchesim/dotfiles

clear

figlet "Cleanup"

# Remover pacotes órfãos
if sudo pacman -Rns $(pacman -Qtdq); then
    echo ":: Pacotes órfãos removidos com sucesso"
    sleep 2
else
    echo ":: Nenhum pacote órfão encontrado ou erro ao remover pacotes"
    sleep 2
fi

# Limpeza de cache do Yay
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

# Pausa para o usuário visualizar a mensagem
sleep 2

# Fechar janela do Kitty
kitty @ close-window
