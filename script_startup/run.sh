#!/bin/bash

# Pega o hostname real do host
#HOST=$(ha info | awk -F': ' '/^hostname:/ {print $2}')

# Usa a CLI do Home Assistant para obter o hostname real
#HOST=$(/usr/bin/ha info | awk -F': ' '/^hostname:/ {print $2}')

# Tenta extrair via CLI 'ha' (hostname real do HA configurado via interface)
if [ -x /usr/bin/ha ]; then
  HOST=$(/usr/bin/ha info | awk -F': ' '/^hostname:/ {print $2}')
fi

# Fallback: tenta pegar via /etc/hostname se HOST estiver vazio
if [ -z "$HOST" ]; then
  HOST=$(cat /etc/hostname)
fi

# Verifica se ainda está vazio
if [ -z "$HOST" ]; then
  echo "❌ Não foi possível obter o hostname"
  exit 1
fi


# Define variáveis do Home Assistant
TOKEN="eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJmMmE2ZjQyMDZkZTQ0YTY0OTllMjI1Mjk5M2ZkMTEyNSIsImlhdCI6MTc1Mjk3NDEwNSwiZXhwIjoyMDY4MzM0MTA1fQ.FYJ5b-HsWIdPXcPFzLVgv_pfkz-AxRk5yPBl9TOJqXE"
HA_URL="http://127.0.0.1:8123"

# Atualiza o input_text.hostname_ha via API REST
curl -s -X POST -H "Authorization: Bearer $TOKEN" \
  -H "Content-Type: application/json" \
  -d '{"entity_id": "input_text.hostname_ha", "value": "'"$HOST"'"}' \
  $HA_URL/api/services/input_text/set_value
