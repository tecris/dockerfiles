# .) Build
# docker build -t casadocker/dev-linux .
# docker build --no-cache -t casadocker/dev-linux .
# .) Run
# docker run --name dev-linux -d casadocker/dev-linux

FROM casadocker/ansible

RUN apt-get -y update
RUN apt-get install -y curl git apt-transport-https

ADD ansible /opt/ansible
WORKDIR /opt/ansible

RUN ansible-galaxy install --role-file roles/ansible-java/requirements.yml
RUN ansible-playbook playbook.yml -c local
