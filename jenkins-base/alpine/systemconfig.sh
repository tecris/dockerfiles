#!/bin/bash

DIRECTORYLIST="/usr/share/jenkins /usr/share/jenkins/ref ${JENKINS_SHARE} ${JENKINS_HOME} /usr/local/bin /usr/bin "

for dir in ${DIRECTORYLIST}; do
    mkdir -p ${dir}
    chown -R jenkins:jenkins ${dir}
    chmod -R 775 ${dir}
done
