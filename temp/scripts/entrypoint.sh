#!/usr/bin/env sh
#
# -------------------------------------------------------------------
#
# File:           entrypoint.sh
# Project:        docker-traefik
# Purpose:        The entrypoint is the shell script that starts the
#                 container, maps the Docker group and then
#                 executes traefik as the user traefiker.
#
# Created on:     07 Feb 2019
# Created by:     David Sanders
# Creator email:  david.sanders@londonlife.com
#
# -------------------------------------------------------------------
# Modifed On   | Modified By                 | Release Notes
# -------------------------------------------------------------------
# 07 Feb 2019  | David Sanders               | First release. 
# -------------------------------------------------------------------

set -e
docker_socket=/var/run/docker.sock

if [ -S ${docker_socket} ]; 
then
  echo "Initializing"
  sudo docker-action init
  echo "Executing healthwatch as ${docker_user}"
fi

echo "Arguments: $@"
sudo docker-action traefik "$@"
#traefik "$@"

echo "Container exited."