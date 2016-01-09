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

RUN apt-get -y update
RUN apt-get install -y curl git

ADD ansible /opt/ansible
WORKDIR /opt/ansible

RUN ansible-galaxy install --role-file roles/ansible-java/requirements.yml
RUN ansible-playbook playbook.yml -c local
