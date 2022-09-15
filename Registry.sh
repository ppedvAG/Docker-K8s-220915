#!/bin/bash
#
# Aufbau einer einfachen Container-Registry mit WEB-Interface
# -----------------------------------------------------------
# 
# Achtung: Authentifizierung und Verschlüsselung der Kommunikation sind nicht
#          enthalten, können jedoch nachträglich konfiguriert werden.
#
# 
# Docker Registry: https://docs.docker.com/registry/
#
# WEB-Viewer: https://github.com/klausmeyer/docker-registry-browser
#

# eienes Netzwerk "registry" anlegen
docker network create registry

# docker registy als Container "registry" erzeugen
docker container run -d -p 5000:5000 --network registry --restart=always --name registry registry:2

# registry viewer als Container "registry-browser" erzeugen
docker container run -d --name registry-browser --network registry --env DOCKER_REGISTRY_URL=http://registry:5000 -p 8080:8080 klausmeyer/docker-registry-browser


