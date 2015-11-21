## Doandcker Cheat Sheet

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
 
### Docker registry
 1. [How to](https://github.com/docker/distribution/blob/master/docs/deploying.md)
 2. For the insecure part edit /etc/default/docker file and add the following line:
  - `DOCKER_OPTS="--insecure-registry localhost"`
 3. Restart docker
  - `sudo service docker restart`

### Remote API
 1. Enable: modify /etc/default/docker file to include parameter `H tcp://0.0.0.0:4243`:
  - `DOCKER_OPTS="H tcp://0.0.0.0:4243"`
