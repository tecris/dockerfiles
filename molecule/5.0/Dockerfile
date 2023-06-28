FROM alpine:3.18.2

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

RUN python3 -m pip install molecule==5.0.0 ansible-core pytest-testinfra[ansible] molecule-plugins[docker,lint]
RUN python3 -m pip install --upgrade --user setuptools

RUN ansible-galaxy collection install \
        ansible.posix \
        community.docker \
        community.general
