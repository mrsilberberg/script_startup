#!/bin/bash
echo "[ADD-ON] Iniciando cópia de arquivos do /share/Drivers para /data/applysolve/drivers..."

SRC="/share/Drivers"
DST="/data"

# Verifica se a pasta de origem existe e possui arquivos
if [ -d "$SRC" ] && [ "$(ls -A "$SRC")" ]; then
    mkdir -p "$DST"
    mv "$SRC"/* "$DST"/
    echo "[ADD-ON] MOVIMENTACAO CONCLUIDA COM SUCESSO!"
else
    echo "[ADD-ON] NENHUMA ARQUIVO ENCONTRADO NA $SRC. Nada foi copiado!!!"
fi
