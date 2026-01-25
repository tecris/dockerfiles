# FROM python:3.9.18-alpine
FROM python:3.12-alpine3.23

COPY --from=docker:dind /usr/local/bin/docker /usr/local/bin/

# https://docs.ansible.com/ansible/latest/reference_appendices/release_and_maintenance.html
RUN python3 -m pip install \
    --no-cache-dir \
    molecule==25.12.0 \
    ansible-core==2.20.1 \
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
