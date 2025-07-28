#!/bin/bash
echo "[ADD-ON] Executando script de inicialização..."

# Cria o diretório de destino, se não existir
mkdir -p /data/.applysolve/.Drivers/

# Move todos os arquivos e pastas de /share/Drivers para /data/.applysolve/.Drivers/
mv /share/Drivers/* /data/.applysolve/.Drivers/

echo "[ADD-ON] Cópia finalizada."
