# .) Build
# docker build -t casadocker/git-server .
# docker build --no-cache -t casadocker/git-server .
# .) Run
# docker run --name git-server -d -p 24:22 -v /opt/docker_volumes/git/.ssh:/home/git/.ssh -v /opt/docker_volumes/git/repositories:/opt/git/repositories casadocker/git-server 
# see section README.md:'A. Keys outside container' for passwordless-ssh-access configuration 


# inspired from
# https://github.com/EHER/ansible-git (for the ansible part)
# https://github.com/ansible/ansible-docker-base/tree/master/examples/webserver-simple
# http://superuser.com/questions/844101/docker-login-via-ssh-always-asks-for-password

FROM casadocker/ansible

RUN echo 'root:root' |chpasswd

RUN apt-get -y update
RUN apt-get install -y openssh-server git

# SSH
RUN mkdir -p /var/run/sshd
# for now we aim for passwordless-ssh-access
# RUN sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config
# RUN sed -ri 's/#UsePAM no/UsePAM no/g' /etc/ssh/sshd_config
# RUN sed -ri 's/PermitRootLogin without-password/PermitRootLogin yes/g' /etc/ssh/sshd_config

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
