FROM caddy:alpine

RUN apk add --no-cache apache2-utils

COPY Caddyfile /etc/caddy/Caddyfile
COPY startup.sh /scripts/startup.sh

RUN chmod +x /scripts/startup.sh

RUN mkdir -p /etc/caddy/generated

ENTRYPOINT ["/scripts/startup.sh"]
