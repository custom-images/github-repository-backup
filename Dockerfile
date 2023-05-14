FROM alpine:latest

VOLUME /mnt/local

RUN apk update

RUN apk add bash github-cli jq

COPY ["entrypoint.sh", "/"]

RUN chmod +x /entrypoint.sh

ENTRYPOINT [ "/entrypoint.sh" ]