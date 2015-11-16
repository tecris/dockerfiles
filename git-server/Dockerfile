# .) Build
# docker build -t org.tecris:5000/git-server .
# docker build --no-cache -t org.tecris:5000/git-server .
# .) Run
# docker run --name git-server -d -p 24:22 -v /datadrive/git/repositories:/opt/git/repositories org.tecris:5000/git-server 

# inspired from
# https://github.com/EHER/ansible-git (for the ansible part)
# https://github.com/ansible/ansible-docker-base/tree/master/examples/webserver-simple
# http://superuser.com/questions/844101/docker-login-via-ssh-always-asks-for-password

FROM org.tecris:5000/ansible

RUN echo 'root:root' |chpasswd

RUN apt-get -y update
RUN apt-get install -y openssh-server git

# SSH
RUN mkdir -p /var/run/sshd
RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config
RUN sed -ri 's/#UsePAM no/UsePAM no/g' /etc/ssh/sshd_config
RUN sed -ri 's/PermitRootLogin without-password/PermitRootLogin yes/g' /etc/ssh/sshd_config

# ssh-keygen -t rsa -C "your_email@example.com"
# cat ~/.ssh/id_rsa.pub >> ansible/files/authorized_keys

# with Apt-Cacher-ng 
# RUN  echo 'Acquire::http { Proxy "http://172.17.42.1:3142"; };' >> /etc/apt/apt.conf.d/01proxy

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

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
