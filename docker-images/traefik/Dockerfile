FROM    alpine:3.9
COPY    scripts/docker-action /usr/local/bin/
RUN     apk update \
        && apk upgrade --no-cache --force-overwrite  --progress \
        && apk add --update curl sudo \
        && rm -rf /var/cache/apk/* \
        && curl -L --output traefik https://github.com/containous/traefik/releases/download/v1.7.8/traefik_linux-amd64 \
        && mv traefik /usr/local/bin/ \
        && chmod +x /usr/local/bin/traefik \
        && chmod +x /usr/local/bin/docker-action \
        && addgroup -S -g 10000 traefiker \
        && adduser -S traefiker -u 10000 -G traefiker -s /bin/sh \
        && echo "traefiker ALL=(root) NOPASSWD:/usr/local/bin/docker-action" >> /etc/sudoers \
        && echo "%wheel ALL=(ALL) NOPASSWD:/usr/local/bin/docker-action" >> /etc/sudoers \
        && echo "Defaults lecture=never" >> /etc/sudoers        
COPY    traefik.toml /etc/traefik/traefik.toml
COPY    scripts/entrypoint.sh /home/traefiker/
RUN     chown traefiker:traefiker /home/traefiker/entrypoint.sh \
        && chmod +x /home/traefiker/entrypoint.sh
USER    traefiker
WORKDIR /home/traefiker
HEALTHCHECK --interval=30s --timeout=5s --start-period=10s --retries=3 CMD [ "curl", "http://localhost:8080/metrics" ]
ENTRYPOINT ["/home/traefiker/entrypoint.sh"]
CMD     []
LABEL   project="CI Dev Workspace"
LABEL   description="Private traefik image for CI Dev Workspace"
LABEL   author="David J. Sanders"
LABEL   email="dsanderscanada@gmail.com"
LABEL   repository="https://github.com/dsandersAzure/cidevworkspace"
LABEL   base_version="1.7.8"
LABEL   base_image="traefik"
LABEL   base_os="alpine:3.9"
# FROM    traefik:v1.7-alpine
# USER    root
# RUN     apk add --no-cache --update \
#             curl \
#         && mkdir -p /etc/traefik \
#         && addgroup -S traefiker \
#         && adduser -S traefiker -G traefiker
# COPY    traefik.toml /etc/traefik/traefik.toml
# USER    traefiker