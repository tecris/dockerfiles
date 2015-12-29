# Inspired from https://github.com/jdecool/dockerfiles/tree/master/mysql-workbench
#
# Pgadmin in a container
#
# .) Build
# docker build -t casadocker/pgadmin:3 .
#
# USAGE :
#   docker run -d \
#     --net host \
#     -v /tmp/.X11-unix:/tmp/.X11-unix \
#     -v $HOME/.pgpass:/root/.pgpass \
#     -e DISPLAY=unix$DISPLAY \
#     --name mysql-workbench \
#     casadocker/pgadmin:3
#
# to fix error: Gtk: cannot open display: unix:0
# xhost local:root
################################################################


FROM ubuntu:latest

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y \
  pgadmin3

CMD pgadmin3
