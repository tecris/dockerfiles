
How to get oms running with docker-compose

.) ./runCompose.sh

How tomcat connects to db?

.) oms.properties contains a property jdbc.oms.url
jdbc.oms.url=jdbc:postgresql://localhost/oms

.) when creating container this property is updated to (see tomcat Dockerfile)
jdbc.oms.url=jdbc:postgresql://nzwoodomsdb/oms

## How tomcat resolves nzwoodomsdb?
.) By using a feature from Docker links, namely 'Updating the /etc/hosts file'
.) Docker will create a host entry for 'nzwoodomsdb' (/etc/hosts) in the tomcat container
.) why entry for 'nzwoodomsdb'? See docker-compose.yaml
