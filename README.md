## Docker Cheat Sheet


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
