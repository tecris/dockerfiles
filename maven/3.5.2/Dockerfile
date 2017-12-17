################################################################################
#
# 1. Build
# docker build --no-cache -t casadocker/maven .
# 2. Run
# docker run --rm -it casadocker/maven /opt/apache-maven-3.5.2/bin/mvn -version
#
################################################################################
FROM casadocker/xenial-ansible


RUN ansible-galaxy install -f tecris.maven,17.10.28 ansiblebit.oracle-java geerlingguy.git

ADD playbook.yaml playbook.yaml
RUN ansible-playbook playbook.yaml -c local
