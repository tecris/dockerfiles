FROM alpine:3.17.2

COPY --from=docker:dind /usr/local/bin/docker /usr/local/bin/

RUN echo "===> Adding Python runtime..."  && \
    apk --update add \
        ansible-lint \
        gcc \
        libc-dev \
        python3 \
        py-pip \
        python3-dev

RUN python3 -m pip install molecule[docker,lint] ansible-core pytest-testinfra[ansible]
RUN python3 -m pip install --upgrade --user setuptools

RUN ansible-galaxy collection install \
        ansible.posix \
        community.docker
