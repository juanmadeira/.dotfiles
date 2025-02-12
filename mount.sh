#!/bin/bash
# script para facilitar a criação de diretórios e montagens ao fazer uma instalação limpa do sistema

sudo mkdir /eva01;
sudo mkdir /eva02;
sudo mkdir /eva03;
sudo mkdir /eva04;

sudo chmod o+rwx /eva01 -R -v
sudo chmod o+rwx /eva02 -R -v
sudo chmod o+rwx /eva03 -R -v
sudo chmod o+rwx /eva04 -R -v

sudo cat .etc/fstab-binds >> /etc/fstab;

sudo mkdir -p /mnt/cdrom;
sudo ln -s /run/user/1000/gvfs/cdda:host=sr0 /mnt/cdrom;

exec ./install.sh;
