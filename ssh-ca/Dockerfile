# docker build  -t ssh-honey ./
FROM ubuntu:22.04

RUN apt-get update && apt-get install -y openssh-server
WORKDIR /root
RUN ssh-keygen -b 4096 -t rsa -f ./shoepping-lab-ca -C "CA key for shoepping.lab" -q -N ""
RUN cp shoepping-lab-ca.pub /etc/ssh/
RUN ls -l . 
RUN cat shoepping-lab-ca.pub
RUN cat shoepping-lab-ca
RUN ssh-keygen -s ./shoepping-lab-ca \
    -h -n jenkins \
    -V +52w \
    -I jenkins-key \
    /etc/ssh/ssh_host_rsa_key.pub

RUN echo "HostCertificate /etc/ssh/ssh_host_rsa_key-cert.pub" | tee -a /etc/ssh/sshd_config
RUN echo "TrustedUserCAKeys /etc/ssh/shoepping-lab-ca.pub" | tee -a /etc/ssh/sshd_config

RUN adduser --disabled-password --gecos "" jenkins
RUN mkdir /home/jenkins/.ssh
RUN echo "@cert-authority *.shoepping.lab,*.shoepping.at $(cat /etc/ssh/shoepping-lab-ca.pub)" >> /home/jenkins/.ssh/known_hosts

RUN apt-get update \
    && apt-get install --no-install-recommends -y openssh-server \
    && rm -rf /var/lib/apt/lists/*
RUN sed -i /etc/ssh/sshd_config \
        -e 's/#PermitRootLogin.*/PermitRootLogin no/' \
        -e 's/#RSAAuthentication.*/RSAAuthentication yes/'  \
        -e 's/#PasswordAuthentication.*/PasswordAuthentication no/' \
        -e 's/#SyslogFacility.*/SyslogFacility AUTH/' \
        -e 's/#LogLevel.*/LogLevel INFO/' && \
    mkdir /var/run/sshd
WORKDIR /home/jenkins/.ssh
# Generate jenkins key:
RUN ssh-keygen -f jenkins -C jenkins -N ""

# Sign jenkins's key so it can log in as both root and jenkins:
RUN ssh-keygen -s /root/shoepping-lab-ca -V +52w -n root,jenkins -I jenkins-key1 -z 1 jenkins.pub

RUN ls -l

ENTRYPOINT ["/usr/sbin/sshd","-D","-e"]
