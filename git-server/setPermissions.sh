#!/bin/bash

SSH_HOME=/opt/docker_volumes/git
ME=`whoami`

echo Setting owner for .ssh to $ME

sudo mkdir -p $SSH_HOME/.ssh
sudo chmod 700 $SSH_HOME/.ssh
sudo chmod go-w $SSH_HOME $SSH_HOME/.ssh
sudo chmod 600 $SSH_HOME/.ssh/authorized_keys
sudo chown $ME:$ME $SSH_HOME/.ssh/authorized_keys $SSH_HOME/.ssh 
