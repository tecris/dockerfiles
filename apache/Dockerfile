FROM tecris.org:5000/ansible

# Add playbooks to the Docker image
ADD ansible /srv/example/
WORKDIR /srv/example

# Run Ansible to configure the Docker image
RUN ansible-playbook main.yml -c local

CMD ["apachectl", "-D", "FOREGROUND", "-k", "start"]
