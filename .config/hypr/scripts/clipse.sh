#!/bin/bash
# script para executar o clipse se não estiver sendo executado

# verificar se o clipse está instalado
if ! command -v clipse &> /dev/null
then
    echo "clipse could not be found. Please install it first."
    exit 1
fi

# verificar se o clipse está rodando
if pgrep -x "clipse" > /dev/null
then
    echo "clipse is already running. Exiting."
    exit 1
else
    kitty --class clipse -e 'clipse'
fi

