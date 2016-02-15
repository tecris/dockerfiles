## Docker Cheat Sheet


### Create image from container

1. Export container as a tar file
  - `$ docker export terra/container > container_db.tar`
2. Import tar-ed container
  - `$ cat container_db.tar |docker import - terra/container`

### Backup/Restore image

1. Save image as a tar file
  - `$ docker save image_name > image_file.tar`
2. Import tar-ed image
  - `$ docker load < image_file.tar`
  
### Remove dangling volumes
 - `$ docker volume rm $(docker volume ls -qf dangling=true)`

### Remote API
 1. Enable: modify /etc/default/docker file to include parameter `-H tcp://0.0.0.0:4243`:
  - `DOCKER_OPTS="-H tcp://0.0.0.0:4243"`

### Other
 1. Find container ip address:
  - `$ docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' container_name`
 1. Docker daemon log
  - `$ sudo tail -f /var/log/upstart/docker.log`
 1. Container logs
  - `$ docker logs -f container_name`
 1. Docker events
  - `$ docker events`
 1. Static ip address (docker v1.10+)
   
   ```
   $ docker network create --subnet 203.0.113.0/24 bluesky
   $ docker run -d --name wildfly10 --net=bluesky --ip=203.0.113.20 -p 8080:8080 -p 9990:9990 casadocker/wildfly:10.0.0
   ```
