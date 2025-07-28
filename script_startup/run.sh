#!/bin/bash

echo "=============================================="
echo "[ADD-ON] Script Startup iniciado por Murilo"
echo "=============================================="

# Caminhos usados
SRC="/share/Drivers"
DST="/data/applysolve/drivers"

# Testa se o /data está acessível e gravável
echo "[ADD-ON] Testando permissões de escrita em /data..."
if touch /data/teste_murilo.txt 2>/dev/null; then
  echo "[ADD-ON] ✅ Acesso confirmado à /data"
  rm -f /data/teste_murilo.txt
else
  echo "[ADD-ON] ❌ ERRO: Sem permissão de escrita em /data"
  echo "[ADD-ON] Verifique se 'data:rw' foi adicionado no 'map' do config.json"
  exit 1
fi

# Cria o diretório /data/murilo_test
echo "[ADD-ON] Criando diretório /data/murilo_test..."
mkdir -p /data/murilo_test

if [ -d /data/murilo_test ]; then
  echo "[ADD-ON] ✅ Diretório /data/murilo_test criado com sucesso (ou já existia)."
else
  echo "[ADD-ON] ❌ ERRO: Falha ao criar o diretório /data/murilo_test."
  exit 1
fi

# Verifica se a pasta de origem tem arquivos
if [ -d "$SRC" ] && [ "$(ls -A "$SRC")" ]; then
  echo "[ADD-ON] Arquivos encontrados em $SRC. Iniciando movimentação..."
  mkdir -p "$DST"
  mv "$SRC"/* "$DST"/
  echo "[ADD-ON] ✅ Movimentação concluída com sucesso!"
else
  echo "[ADD-ON] ⚠️ Nenhum arquivo encontrado em $SRC. Nada foi movido."
fi

echo "=============================================="
echo "[ADD-ON] Finalizado."
echo "=============================================="