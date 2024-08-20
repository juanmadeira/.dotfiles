#!/bin/bash

# script para exibir os pacotes instalados por ordem cronológica

# esperar 1 segundo e limpar a tela
sleep 1
clear

# exibir "Pacotes por data" usando figlet
figlet "Pacotes por data"
echo

for i in $(pacman -Qq)
do
    grep "\[ALPM\] installed $i" /var/log/pacman.log
done | \
    sort -u | \
    sed -e 's/\[ALPM\] installed //' -e 's/(.*$//'
bash

