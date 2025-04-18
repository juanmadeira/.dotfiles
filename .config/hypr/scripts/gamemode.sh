#!/bin/bash
# script para desabilitar animações e papel de parede para focar no desempenho e inibir distrações

HYPRGAMEMODE=$(hyprctl getoption animations:enabled | awk 'NR==1{print $2}')

if [ "$HYPRGAMEMODE" = 1 ] ; then
    killall -q waybar
    killall -q hyprpaper 
    hyprctl --batch "\
        keyword animations:enabled 0;\
        keyword decoration:drop_shadow 0;\
        keyword decoration:blur:enabled 0;\
        keyword general:gaps_in 0;\
        keyword general:gaps_out 0;\
        keyword general:border_size 0;\
        keyword decoration:rounding 0"
    exit
fi

if [ -z $(pgrep waybar) ]; then
    waybar & # executar waybar se nao houver nenhum processo rodando
fi

hyprpaper &
hyprctl reload
