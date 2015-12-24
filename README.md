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
  - `# docker inspect --format='{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' container_name`
 1. Docker daemon log
  - `# sudo tail -f /var/log/upstart/docker.log`
 1. Docker events
  - `# docker events`
