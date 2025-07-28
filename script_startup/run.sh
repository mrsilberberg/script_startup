#!/bin/bash

ORIGEM="/share/Drivers"
DESTINO="/config/.storage/Drivers"
SENHA="Apply@2907"

echo "🚀 MONITORAMENTO DE DRIVER HA"

# Cria a pasta de destino, se necessário
mkdir -p "$DESTINO"

# Loop de monitoramento de arquivos novos
inotifywait -m -e close_write,moved_to --format "%f" "$ORIGEM" | while read -r FILENAME; do
  EXT="${FILENAME##*.}"
  EXT=$(echo "$EXT" | tr '[:upper:]' '[:lower:]')

  if [ "$EXT" = "rar" ] || [ "$EXT" = "zip" ]; then
    SRC_FILE="$ORIGEM/$FILENAME"
    DST_FILE="$DESTINO/$FILENAME"

    echo "📥 Detecção: $SRC_FILE"
    mv "$SRC_FILE" "$DST_FILE" || { echo "❌ Falha ao mover $FILENAME"; continue; }

    echo "📦 PROCESSANDO O DRIVER $FILENAME..."

    if [ "$EXT" = "rar" ]; then
      # Descompacta com unrar
      unrar x -o+ -p"$SENHA" "$DST_FILE" "$DESTINO/" || { echo "❌ FALHA AO DESCOMPACTAR .RAR: $FILENAME"; continue; }
    else
      # Descompacta com 7z
      7z x -p"$SENHA" -o"$DESTINO" "$DST_FILE" || { echo "❌ FALHA AO DESCOMPACTAR .ZIP: $FILENAME"; continue; }
    fi

    rm -f "$DST_FILE" && echo "🗑️ DRIVER REMOVIDO: $FILENAME"
    echo "✅ DRIVER PROCESSADO COM SUCESSO: $FILENAME"
  fi
done
