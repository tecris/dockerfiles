################################################################################
#
# MySQL Workbench in a container
#
# https://github.com/jdecool/dockerfiles/tree/master/mysql-workbench
#
#
# .) Build
# docker build -t casadocker/mysql-workbench .
#
# USAGE :
#   docker run -d \
#     --net host \
#     -v /tmp/.X11-unix:/tmp/.X11-unix \
#     -v $HOME/.mysql-workbench:/root/.mysql/workbench \
#     -e DISPLAY=unix$DISPLAY \
#     --name mysql-workbench \
#     jdecool/mysql-workbench [COMMAND]
#
# to fix error: Gtk: cannot open display: unix:0
# xhost local:root
#
################################################################################


FROM ubuntu:latest

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get install -y \
  mysql-workbench

CMD mysql-workbench
