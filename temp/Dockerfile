# -------------------------------------------------------------------
#
# File:           Dockerfile
# Project:        docker-traefik
# Purpose:        A custom Dockerfile to run traefik as a non-root
#                 user by default. This can be overridden by adding
#                 the --user command to docker run
#
#                 See the README file for instructions
#
# Created on:     05 Feb 2019
# Created by:     David Sanders
# Creator email:  david.sanders@londonlife.com
#
# -------------------------------------------------------------------
# Modifed On   | Modified By                 | Release Notes
# -------------------------------------------------------------------
# 05 Feb 2019  | David Sanders               | First release.
# -------------------------------------------------------------------

FROM    docker-registry.gwl.bz:18080/alpine:3.9
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
COPY    config/traefik.toml /etc/traefik/traefik.toml
COPY    scripts/entrypoint.sh /home/traefiker/
RUN     chown traefiker:traefiker /home/traefiker/entrypoint.sh \
        && chmod +x /home/traefiker/entrypoint.sh
USER    traefiker
WORKDIR /home/traefiker
HEALTHCHECK --interval=30s --timeout=5s --start-period=10s --retries=3 CMD [ "curl", "http://localhost:8080/metrics" ]
ENTRYPOINT ["/home/traefiker/entrypoint.sh"]
CMD     []
LABEL   group="SDE"
LABEL   description="Private GWL traefik image"
LABEL   maintainer="SDE"
LABEL   email="CanTechSDEall@londonlife.com"
LABEL   repository="https://git.gwl.bz/projects/SDE/repos/docker-traefik/browse"
LABEL   base_version="1.7.8"
LABEL   base_image="traefik"
LABEL   base_os="alpine:3.9"