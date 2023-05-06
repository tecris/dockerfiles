FROM alpine:3.17.3

COPY --from=docker:dind /usr/local/bin/docker /usr/local/bin/

RUN echo "===> Adding Python runtime..."  && \
    apk --update add \
        ansible-lint \
        curl \
        gcc \
        libc-dev \
        openssh \
        python3 \
        py-pip \
        python3-dev \
        sshpass

RUN python3 -m pip install molecule[docker,lint]==4.0.4 ansible-core pytest-testinfra[ansible]
RUN python3 -m pip install --upgrade --user setuptools

RUN ansible-galaxy collection install \
        ansible.posix \
        community.docker \
        community.general
