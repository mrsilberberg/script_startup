#!/bin/bash
echo "[ADD-ON] Testando acessos a diretórios do Home Assistant OS..."

declare -a paths=(
  "/config"
  "/config/.Drivers"
  "/share"
  "/data"
  "/data/.applysolve"
  "/media"
  "/homeassistant"
  "/~config"
)

for path in "${paths[@]}"; do
  echo -e "\n📁 Testando: $path"

  # Verifica se existe
  if [ -d "$path" ]; then
    echo "✅ Existe: $path"

    # Testa leitura
    if ls "$path" >/dev/null 2>&1; then
      echo "🔎 Leitura OK"
    else
      echo "❌ Sem permissão de leitura"
    fi

    # Testa escrita
    test_file="$path/teste_$(date +%s).txt"
    if echo "teste" > "$test_file" 2>/dev/null; then
      echo "✏️ Escrita OK"
      rm -f "$test_file"
    else
      echo "❌ Sem permissão de escrita"
    fi
  else
    echo "❌ Diretório NÃO existe"
  fi
done

echo -e "\n[ADD-ON] Teste de acessos finalizado."
