FROM alpine:3.20

# Instala dependências
RUN apk update &&     apk add --no-cache bash curl jq inotify-tools libstdc++ libgcc


echo "⏳ Aguardando serviços..."
sleep 15

echo "🚀 Iniciando processo..."

RUN apk add mc

echo "⏳ Aguardando serviços..."
sleep 15

echo "🚀 Iniciando processo..."

# Baixa o binário 'unrar' do repositório EDM115
RUN curl -LsSf https://api.github.com/repos/EDM115/unrar-alpine/releases/latest \
    | jq -r '.assets[] | select(.name == "unrar") | .browser_download_url' \
    | xargs -I {} curl -Lsf {} -o /usr/local/bin/unrar && \
    chmod +x /usr/local/bin/unrar

COPY run.sh /run.sh
RUN chmod +x /run.sh

CMD ["/run.sh"]
