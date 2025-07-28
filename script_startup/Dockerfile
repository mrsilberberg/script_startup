# Imagem base mínima
FROM alpine:3.18

# Instala bash (já que Alpine usa /bin/sh por padrão)
RUN apk add --no-cache bash

# Copia o script principal para dentro do contêiner
COPY run.sh /run.sh

# Dá permissão de execução
RUN chmod +x /run.sh

# Define o usuário root explicitamente (já é o padrão, mas é bom declarar)
USER root

# Comando padrão ao iniciar o contêiner
CMD ["/bin/bash", "/run.sh"]
