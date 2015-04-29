FROM org.tecris.ubuntu1404.util/ansible

# ssh-keygen -t rsa -C "your_email@example.com"
# cat ~/.ssh/id_rsa.pub >> ansible/files/authorized_keys

# with Apt-Cacher-ng 
# RUN  echo 'Acquire::http { Proxy "http://172.17.42.1:3142"; };' >> /etc/apt/apt.conf.d/01proxy

# inspired from
# https://github.com/EHER/ansible-git (for the ansible part)
# https://github.com/ansible/ansible-docker-base/tree/master/examples/webserver-simple
# http://superuser.com/questions/844101/docker-login-via-ssh-always-asks-for-password

# Add playbooks to the Docker image
ADD ansible /srv/example/
WORKDIR /srv/example

# User creation not in ansible as ansible has no 
# equivalent for --disabled-password
ENV USER git
RUN adduser --disabled-password --gecos "" $USER
RUN adduser $USER sudo

# Run Ansible to configure the Docker image
RUN ansible-playbook main.yml -c local

EXPOSE 22 9148 80 443
