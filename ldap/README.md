#LDAP Docker container

Inspired from https://registry.hub.docker.com/u/larrycai/openldap

Populated with following user:
 - User: cn=Test User,ou=Users,dc=atlas,dc=org
 - Password: test

How to query
 - ldapsearch -x -H ldap://localhost -b  dc=atlas,dc=org
