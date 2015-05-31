
How to get oms running on openshift

# get in the container
.)$ docker exec -it openshift bash


# DB - back-end
## controller
.)$ osc create -f postgres-controller.json

## service
.)$ osc create -f postgres-service.yaml


# TOMCAT - front-end
## controller
.)$ osc create -f omstomcat7-controller.json 

## service
.)$ osc create -f omstomcat7-service.yaml    
