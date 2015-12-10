# https://github.com/tommyoshaw/pidgin

FROM ubuntu:14.04

# .) Build
# docker build --no-cache -t casa.docker/pidgin .
# .) Run
# docker run -d --device /dev/snd \
# -v /tmp/.X11-unix:/tmp/.X11-unix \
# -e DISPLAY=unix$DISPLAY \
# thshaw/pidgin

MAINTAINER tommyoshaw

RUN sudo apt-get install -y software-properties-common 
RUN sudo add-apt-repository -y ppa:pidgin-developers/ppa

RUN sudo apt-get update

RUN sudo apt-get install -y pidgin

ENTRYPOINT ["pidgin"]
