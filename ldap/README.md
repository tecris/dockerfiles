Based on:
https://registry.hub.docker.com/u/larrycai/openldap

User: cn=Test User,ou=Users,dc=atlas,dc=org
Password: test


query ldap server
ldapsearch -x -H ldap://localhost -b  dc=atlas,dc=org
