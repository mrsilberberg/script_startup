FROM alpine:3.20

RUN apk update && \
    apk add bash p7zip inotify-tools

COPY run.sh /run.sh
RUN chmod +x /run.sh

CMD ["/run.sh"]
