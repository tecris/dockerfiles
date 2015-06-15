# Dockerize Apache Web Server
============================================

1. Build image
  * `$ ./build.sh`
2. Run image
  * The run script makes use of docker data volumes to share data between docker host and docker container. Basically Apache web server will serve content from docker host /var/www/html.
  * `$ ./run.sh`
