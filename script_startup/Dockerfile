FROM alpine:3.18

RUN apk add --no-cache bash

COPY run.sh /run.sh
RUN chmod +x /run.sh

# Executa como root
USER 0

CMD ["bash", "/run.sh"]

