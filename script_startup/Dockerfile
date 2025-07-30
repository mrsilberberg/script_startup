FROM alpine:3.20

# Instala todas as dependências necessárias de uma só vez
RUN apk add --no-cache \
    bash \
    curl \
    jq \
    inotify-tools \
    libstdc++ \
    libgcc \
    mc

# Define versão do 'unrar' (opcional, mas mais seguro)
ENV UNRAR_VERSION="latest"

# Baixa e instala o binário 'unrar' a partir do GitHub
RUN curl -LsSf "https://api.github.com/repos/EDM115/unrar-alpine/releases/${UNRAR_VERSION}" \
    | jq -r '.assets[] | select(.name == "unrar") | .browser_download_url' \
    | xargs -I {} curl -Lsf {} -o /usr/local/bin/unrar && \
    chmod +x /usr/local/bin/unrar

# Copia o script principal
COPY run.sh /run.sh
RUN chmod +x /run.sh

# (Opcional) Healthcheck simples — substitua se tiver algo mais específico
HEALTHCHECK CMD pgrep -f run.sh || exit 1

# Comando principal
CMD ["/run.sh"]


