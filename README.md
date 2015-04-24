# Collection of Dockerfile(s)

 - ubuntu-util provides basic utilities(ssh, wget, etc) on top of standard ubuntu image and can be seen as a base image (very likely to be used by other containers)

## Cheat Sheet

### Create image from container

1. Export container as a tar file
  - `$ docker export terra/container > container_db.tar`
2. Import tar-ed container
  - `$ cat container_db.tar |docker import - terra/container`

 ### Backup/Restore image

1. Save container as a tar file
  - `$ docker save container_name > container_file.tar`
2. Import tar-ed container
  - `$ docker load < container_file.tar` 
 
### Docker registry
 1. [How to](https://github.com/docker/distribution/blob/master/docs/deploying.md)
 2. For the insecure part edit /etc/default/docker file and add the following line:
  - `DOCKER_OPTS="--insecure-registry localhost:5000"`
 3. Restart docker
  - `sudo service docker stop`

