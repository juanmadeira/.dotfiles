#!/usr/bin/env sh

# diretorio temporario
TMP_DIR="/tmp/rmpc"

# garante que o diretorio eixste
mkdir -p "$TMP_DIR"

# temporariamente guarda a capa recebida pelo rmpc
ALBUM_ART_PATH="$TMP_DIR/notification_cover"

# caminho para a capa se nenhuma for encontrada pelo rmpc/mpd
DEFAULT_ALBUM_ART_PATH="$TMP_DIR/default_album_art.jpg"

# salva a capa do album tocando em um arquivo
if ! rmpc albumart --output "$ALBUM_ART_PATH"; then
    # usa a capa padrao se o rmpc retornar um exit code diferente de zero
    ALBUM_ART_PATH="${DEFAULT_ALBUM_ART_PATH}"
fi

notify-send -i "${ALBUM_ART_PATH}" "Now Playing" "$ARTIST - $TITLE"

# executa o script de letra (sem exibir o output para evitar bugar o rmpc)
exec "~/.scripts/letra" > /dev/null 2>&1
