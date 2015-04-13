# Collection of Dockerfile(s)

 - image ubuntu/ssh can be seen as a base image(very likely to be used by other containers), contains ssh and supervisor.
  - ssh mainly to debug
  - supervisor as it provides a relative clean solution to run multiple services in a single container

## Cheat Sheet

### Create image from container

1. Export container as a tar file
  - `$ docker export terra/container > container_db.tar`
2. Import tar-ed container
  - `$ cat container_db.tar |docker import - terra/container`

 ### Backup/Restore image

1. Export container as a tar
  - `$ docker save container_name > container_file.tar`
2. Import tar-ed container
  - `$ docker load < container_file.tar` 
 
