FROM alpine:3.10.2

COPY cron /etc/crontabs/root
COPY ddns-update.sh /

RUN chmod ugo+x /ddns-update.sh
RUN apk add --no-cache wget bind-tools

# start crond with log level 8 in foreground, output to stderr
CMD ["crond", "-f", "-d", "8"]