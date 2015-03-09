# Collection of Dockerfile(s)

 - image ubuntu/ssh can be seen as a base image(very likely to be used by other containers), contains ssh and supervisor.
  - ssh mainly to debug
  - supervisor as it provides a relative clean solution to run multiple services in a single container

## Cheat Sheet

### How to create image from container
 - docker export container_name > container_db.tar
 - cat container_db.tar |docker import - terra/container
