#!/bin/bash
# script para adicionar ao waybar a função de toggle

# verificar se o waybar está rodando
if pgrep -x "waybar" > /dev/null
then
    # se estiver rodando, envia o sinal SIGTERM para encerrar o waybar
    killall -q waybar
else
    # se não estiver rodando, inicia o waybar
    waybar &
fi

