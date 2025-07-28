# Cria o diretório /data/murilo_test se não existir
echo "[ADD-ON] Criando diretório /data/murilo_test..."
mkdir -p /data/murilo_test

if [ -d /data/murilo_test ]; then
  echo "[ADD-ON] ✅ Diretório /data/murilo_test criado com sucesso (ou já existia)."
else
  echo "[ADD-ON] ❌ ERRO: Falha ao criar o diretório /data/murilo_test."
  exit 1
fi
