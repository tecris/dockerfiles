

# .) Build
# docker build -t casa.docker/apache2 .
# docker build --no-cache -t casa.docker/apache2 .
# .) Run (Apache web server will serve content from docker host /var/www/html)
# docker run --name apache2 --restart=always -d -p 88:80 -v /var/www/html:/var/www/html casa.docker/apache2
# .) Connect
# docker exec -it apache2 bash

FROM casa.docker/ansible

# Add playbooks to the Docker image
ADD ansible /srv/example/
WORKDIR /srv/example

# Run Ansible to configure the Docker image
RUN ansible-playbook main.yml -c local

CMD ["apachectl", "-D", "FOREGROUND", "-k", "start"]
#!/bin/sh

