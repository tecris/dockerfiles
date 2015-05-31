#!/bin/sh

# assumption is that there is a ldap container running
docker exec -it ldap ldapsearch -x -H ldap://localhost -b  dc=atlas,dc=org
