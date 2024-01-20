FROM python:3.9.18-alpine

COPY --from=docker:dind /usr/local/bin/docker /usr/local/bin/

RUN python3 -m pip install \
    --no-cache-dir \
    molecule==6.0.2 \
    ansible-core==2.14 \
    pytest-testinfra[ansible] \
    molecule-plugins[docker]

RUN python3 -m pip install \
    --no-cache-dir \
    --upgrade --user setuptools

RUN ansible-galaxy collection install \
        ansible.posix \
        community.docker \
        community.general

CMD ["sh"]
