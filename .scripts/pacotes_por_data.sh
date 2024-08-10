#!/bin/bash
# Esperar 1 segundo e limpa a tela
sleep 1
clear

# Exibir "Pacotes por data" usando figlet
figlet "Pacotes por data"
echo

for i in $(pacman -Qq)
do
    grep "\[ALPM\] installed $i" /var/log/pacman.log
done | \
    sort -u | \
    sed -e 's/\[ALPM\] installed //' -e 's/(.*$//'
bash
