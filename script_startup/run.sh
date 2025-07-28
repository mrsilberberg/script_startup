#!/bin/bash

echo "=============================================="
echo "[ADD-ON] Script Startup iniciado por Murilo"
echo "=============================================="

# === Obtém o hostname do Home Assistant ===
echo "[ADD-ON] Obtendo o hostname do Home Assistant..."

if [ -x /usr/bin/ha ]; then
  HOST=$(/usr/bin/ha info | awk -F': ' '/^hostname:/ {print $2}')
fi

# Fallback via /etc/hostname
if [ -z "$HOST" ]; then
  HOST=$(cat /etc/hostname)
fi

# Verifica se hostname foi obtido
if [ -z "$HOST" ]; then
  echo "[ADD-ON] ❌ Não foi possível obter o hostname."
  exit 1
fi

echo "[ADD-ON] ✅ Hostname detectado: $HOST"

# === Define URL e TOKEN do Home Assistant ===
TOKEN="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJmMmE2ZjQyMDZkZTQ0YTY0OTllMjI1Mjk5M2ZkMTEyNSIsImlhdCI6MTc1Mjk3NDEwNSwiZXhwIjoyMDY4MzM0MTA1fQ.FYJ5b-HsWIdPXcPFzLVgv_pfkz-AxRk5yPBl9TOJqXE"
HA_URL="http://127.0.0.1:8123"

# === Envia o hostname para o input_text.hostname_ha ===
echo "[ADD-ON] Atualizando input_text.hostname_ha via API REST..."

curl -s -X POST -H "Authorization: Bearer $TOKEN" \
  -H "Content-Type: application/json" \
  -d '{"entity_id": "input_text.hostname_ha", "value": "'"$HOST"'"}' \
  $HA_URL/api/services/input_text/set_value

if [ $? -eq 0 ]; then
  echo "[ADD-ON] ✅ input_text.hostname_ha atualizado com sucesso!"
else
  echo "[ADD-ON] ❌ Falha ao atualizar input_text.hostname_ha"
  exit 1
fi

# === Cria diretório para teste ===
echo "[ADD-ON] Criando diretório /data/murilo_test..."
mkdir -p /data/murilo_test

if [ -d /data/murilo_test ]; then
  echo "[ADD-ON] ✅ Diretório /data/murilo_test criado com sucesso."
else
  echo "[ADD-ON] ❌ Falha ao criar /data/murilo_test."
  exit 1
fi

echo "[ADD-ON] Script finalizado com sucesso."
echo "=============================================="
