

# .) Build
# docker build -t org.tecris:5000/apache2 .
# docker build --no-cache -t org.tecris:5000/apache2 .
# .) Run (Apache web server will serve content from docker host /var/www/html)
# docker run --name apache2 --restart=always -d -p 88:80 -v /var/www/html:/var/www/html org.tecris:5000/apache2 
# .) Connect
# docker exec -it apache2 bash

FROM org.tecris:5000/ansible

# Add playbooks to the Docker image
ADD ansible /srv/example/
WORKDIR /srv/example

# Run Ansible to configure the Docker image
RUN ansible-playbook main.yml -c local

CMD ["apachectl", "-D", "FOREGROUND", "-k", "start"]
#!/bin/sh

