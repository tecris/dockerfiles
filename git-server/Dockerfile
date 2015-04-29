FROM org.tecris.ubuntu1404.util/ansible

# ssh-keygen -t rsa -C "your_email@example.com"
# cat ~/.ssh/id_rsa.pub >> ansible/files/authorized_keys

# with Apt-Cacher-ng 
# RUN  echo 'Acquire::http { Proxy "http://172.17.42.1:3142"; };' >> /etc/apt/apt.conf.d/01proxy

# based on https://github.com/ansible/ansible-docker-base/tree/master/examples/webserver-simple

# Add playbooks to the Docker image
ADD ansible /srv/example/
WORKDIR /srv/example

# Run Ansible to configure the Docker image
RUN ansible-playbook main.yml -c local

EXPOSE 22 9148 80 443
CMD ["/usr/bin/supervisord"]
