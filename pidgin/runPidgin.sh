#!/bin/bash

# to fix error: Gtk: cannot open display: unix:0
xhost local:root

# how to find mysql docker container ip address
# docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' CONTAINER_NAME


 docker run -ti --rm \
 -v /tmp/.X11-unix:/tmp/.X11-unix \
 -e DISPLAY=unix$DISPLAY \
 casa.docker/pidgin
