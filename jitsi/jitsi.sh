#!/bin/bash

# to fix error: Gtk: cannot open display: unix:0
xhost local:root

# how to find mysql docker container ip address
# docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' CONTAINER_NAME

docker run -ti --rm \
	--net host \
	--device=/dev/snd:/dev/snd \
        -e DISPLAY=$DISPLAY \
	-v /etc/machine-id:/etc/machine-id \
        -v /tmp/.X11-unix:/tmp/.X11-unix \
        casa.docker/jitsi
