#!/bin/bash

# script para atualizar arquivo de configuração do RetroArch após ter usado pela última vez no windows por meio de dual boot

# esperar 1 segundo e limpar a tela
sleep 1
clear

# exibir "RetroArch" usando figlet
figlet "RetroArch"
echo

# definir diretório do RetroArch
RA_DIR="/home/juan/Documents/documentos/jogos/RetroArch/"

# excluir arquivo de configuração do windows e renomear o do linux para ser o atual
cd $RA_DIR
rm -f retroarch.cfg
echo ":: Excluindo retroarch.cfg"
cp retroarch_linux.cfg retroarch.cfg
echo ":: Copiando retroarch_linux.cfg"

# enviar uma notificação informando que o arquivo de configuração foi alterado
notify-send "Arquivo de configuração do RetroArch alterado"
echo
echo ":: Arquivo de configuração do RetroArch alterado"

# iniciar o RetroArch
cd ../../../
echo ":: Iniciando RetroArch"
echo
nohup ./RetroArch.AppImage &

# pausar para o usuário visualizar a mensagem
sleep 2

# fechar janela do kitty
kitty @ close-window

