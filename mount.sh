#!/bin/bash
# script para facilitar a criacao de diretorios e links simbolicos ao fazer uma instalacao limpa do sistema

sudo mkdir /eva01;
sudo mkdir /eva02;
sudo mkdir /eva03;
sudo mkdir /eva04;

sudo chmod o+rwx /eva01 -R -v;
sudo chmod o+rwx /eva02 -R -v;
sudo chmod o+rwx /eva03 -R -v;
sudo chmod o+rwx /eva04 -R -v;

ln -s /eva02/documentos ~/; mv ~/documentos ~/Documents;
ln -s /eva02/imagens ~/; mv ~/imagens ~/Pictures;
ln -s /eva02/jogos ~/; mv ~/jogos ~/Games;
ln -s /eva02/musicas ~/; mv ~/musicas ~/Music;
ln -s /eva02/programas ~/; mv ~/programas ~/Programs;
ln -s /eva04/biblioteca ~/; mv ~/biblioteca ~/Media;

sudo mkdir -p /mnt/cdrom;
sudo ln -s /run/user/1000/gvfs/cdda:host=sr0 /mnt/cdrom;

exec ./install.sh;
