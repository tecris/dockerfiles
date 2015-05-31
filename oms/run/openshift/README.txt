
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

How tomcat connects to db?

.) oms.properties contains a property jdbc.oms.url
jdbc.oms.url=jdbc:postgresql://localhost/oms

.) when creating container this property is updated to (see tomcat Dockerfile)
jdbc.oms.url=jdbc:postgresql://nzwoodomsdb/oms

## How tomcat resolves nzwoodomsdb?
.) kubernetes supports Docker links, and,
.) backend service is named 'nzwoodomsdb'
