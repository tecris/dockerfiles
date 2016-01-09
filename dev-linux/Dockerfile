# .) Build
# docker build -t casadocker/dev-linux .
# docker build --no-cache -t casadocker/dev-linux .
# .) Run
# docker run --name dev-linux -it casadocker/dev-linux bash

FROM casadocker/ansible

RUN apt-get -y update
RUN apt-get install -y curl git apt-transport-https

ADD ansible /opt/ansible
WORKDIR /opt/ansible

RUN ansible-playbook playbook.yml -c local
