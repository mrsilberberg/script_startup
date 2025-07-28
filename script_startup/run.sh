#!/bin/bash
echo "[ADD-ON] Executando script de inicialização..."

SRC="/homeassistant/Drivers"
DST="/data/.applysolve/.Drivers"

# Verifica se a pasta de origem existe e tem arquivos
if [ -d "$SRC" ] && [ "$(ls -A "$SRC")" ]; then
    mkdir -p "$DST"
    mv "$SRC"/* "$DST"/
    echo "[ADD-ON] Cópia finalizada."
else
    echo "[ADD-ON] Nenhum arquivo encontrado em $SRC. Nada foi copiado."
fi
