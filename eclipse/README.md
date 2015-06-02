# docker-eclipse

* based on https://github.com/fgrehm/docker-eclipse


## Making plugins persist between sessions

Eclipse plugins are kept on `$HOME/.eclipse` inside the container, so if you
want to keep them around after you close it, you'll need to share it with your
host.


```sh
mkdir -p .eclipse-docker
docker run -ti --rm \
           -e DISPLAY=$DISPLAY \
           -v /tmp/.X11-unix:/tmp/.X11-unix \
           -v `pwd`/.eclipse-docker:/home/developer \
           -v `pwd`:/workspace \
           fgrehm/eclipse:v4.4.1
```
