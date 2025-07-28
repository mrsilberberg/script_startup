#!/bin/bash
echo "[ADD-ON] Executando script de inicialização..."
mkdir -p /mnt/data/.applysolve/.Drivers
cp -r /share/Drivers/* /mnt/data/.applysolve/.Drivers/ 2>/dev/null
echo "[ADD-ON] Cópia finalizada."
