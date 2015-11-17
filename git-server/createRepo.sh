#!/bin/bash

REPO_NAME=ionradan
BARE_REPO=$REPO_NAME.git

mkdir $REPO_NAME

# create local git repository and bare repository
cd $REPO_NAME; echo "Ion Radan" >> ionradan.txt;git init; git add *; git commit -m '1st commit' *; cd ..; git clone --bare $REPO_NAME $BARE_REPO

# copy bare repository to git server home directory
scp -P 24 -r ionradan.git git@localhost:/opt/git/repositories

rm -rf ionradan*

# to checkout repo
# git clone ssh://git@localhost:24/opt/git/repositories/ionradan.git
