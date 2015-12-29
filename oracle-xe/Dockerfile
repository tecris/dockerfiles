FROM casadocker/jdk:8


# set environment
ENV ORACLE_SID XE
ENV ORACLE_HOME /u01/app/oracle/product/11.2.0/xe
ENV PATH $ORACLE_HOME/bin:$PATH
ENV LD_LIBRARY_PATH $ORACLE_HOME/lib

# install oracle xe
ADD ./files /tmp/filesOracle
RUN apt-get install -y alien dpkg-dev debhelper build-essential
RUN chmod +x /tmp/filesOracle/*.sh
RUN /tmp/filesOracle/install.sh

EXPOSE 1521 8080

ENTRYPOINT ["/run.sh"]
