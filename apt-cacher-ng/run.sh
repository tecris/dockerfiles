#!/bin/bash

docker run -d -p 3142:3142 --name test_apt_cacher_ng eg_apt_cacher_ng

# To see the logfiles that are tailed in the default command
# docker logs -f test_apt_cacher_ng
