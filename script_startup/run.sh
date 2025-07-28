#!/bin/bash
echo "[ADD-ON] Iniciando cópia de arquivos do /config/.Drivers para /data/.applysolve/.Drivers..."

SRC="/share/Drivers"
DST="/data/.applysolve/.Drivers"

# Verifica se a pasta de origem existe e possui arquivos
if [ -d "$SRC" ] && [ "$(ls -A "$SRC")" ]; then
    mkdir -p "$DST"
    mv "$SRC"/* "$DST"/
    echo "[ADD-ON] Movimentação concluída com sucesso!"
else
    echo "[ADD-ON] Nenhum arquivo encontrado em $SRC. Nada foi copiado."
fi
