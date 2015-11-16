#!/bin/bash

REPO_NAME=ionradan
BARE_REPO=$REPO_NAME.git

mkdir $REPO_NAME

# create local git repository and bare repository
cd $REPO_NAME; echo "Ion Radan" >> ionradan.txt;git init; git add *; git commit -m '1st commit' *; cd ..; git clone --bare $REPO_NAME $BARE_REPO

# copy bare repository to git server home directory
cp -r $BARE_REPO /opt/docker_volumes/git/repositories
