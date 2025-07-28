#!/bin/bash

ORIGEM="/share/Drivers"
DESTINO="/config/.storage/Drivers"
SENHA="Apply@2907"

echo "🚀 MONITORAMENTO DE DRIVER HA"

# Cria a pasta de destino, se necessário
mkdir -p "$DESTINO"

# Loop de monitoramento
inotifywait -m -e close_write,moved_to --format "%f" "$ORIGEM" | while read -r FILENAME; do
  EXT="${FILENAME##*.}"
  EXT=$(echo "$EXT" | tr '[:upper:]' '[:lower:]')

  if [ "$EXT" = "rar" ] || [ "$EXT" = "zip" ]; then
    SRC_FILE="$ORIGEM/$FILENAME"
    DST_FILE="$DESTINO/$FILENAME"

    echo "📥 Detecção: $SRC_FILE"
    mv "$SRC_FILE" "$DST_FILE" || { echo "❌ Falha ao mover $FILENAME"; continue; }

    echo "📦 PROCESSANDO O DRIVER $FILENAME..."
    7z x -p"$SENHA" -o"$DESTINO" "$DST_FILE" || { echo "❌ FALHA AO PROCESSAR O DRIVER $FILENAME"; continue; }

    rm -f "$DST_FILE" && echo "🗑️ DRIVER PROCESSADO COM SUCESSO: $FILENAME"
    echo "✅ DRIVER PROCESSADO COM SUCESSO: $FILENAME"
  fi
done
