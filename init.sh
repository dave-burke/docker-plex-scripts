#!/bin/bash

IMAGE="plexinc/pms-docker:plexpass"
CONTAINER="plex"

docker run \
--name "${CONTAINER}" \
--detach \
--restart=always \
--publish 32400:32400/tcp \
--publish 3005:3005/tcp \
--publish 8324:8324/tcp \
--publish 32469:32469/tcp \
--publish 1900:1900/udp \
--publish 32410:32410/udp \
--publish 32412:32412/udp \
--publish 32413:32413/udp \
--publish 32414:32414/udp \
--env TZ="America/Chicago" \
--env ADVERTISE_IP="http://192.168.2.150:32400/" \
--env PLEX_UID=111 \
--env PLEX_GID=117 \
--hostname plex.servy.lan \
--volume /mnt/storage/docker/plex/config:/config \
--volume /mnt/storage/docker/plex/upload:/var/lib/plexmediaserver/Library/Application\ Support/Plex\ Media\ Server/Media\ Upload/ \
--volume /mnt/storage/audio:/mnt/storage/audio \
--volume /mnt/storage/videos:/mnt/storage/videos \
--volume /mnt/storage/photos:/mnt/storage/photos \
${IMAGE}

