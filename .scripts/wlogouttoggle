#!/bin/bash
# script para executar o wlogout se não estiver sendo executado

# verificar se o wlogout está instalado
if ! command -v wlogout &> /dev/null
then
    echo "Não foi possível encontrar o wlogout. Por favor, instale o pacote primeiro."
    exit 1
fi

# verificar se o wlogout está rodando
if pgrep -x "wlogout" > /dev/null
then
    echo "wlogout já está sendo executado. Saindo."
    exit 1
else
    wlogout -b 3
fi

