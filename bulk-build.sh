#!/bin/sh -x

REPO=~/src/git/avsm/opam-bulk-logs
if [ ! -d $REPO ]; then
  git clone git@github.com:avsm/opam-bulk-logs $REPO
fi
cd $REPO
RUN=20140428/4.01.0
pkg=`opam list -s -a`
mkdir -p $RUN/raw $RUN/err $RUN/ok

for p in $pkg; do
  sudo docker.io run avsm/opam opam installext $p > $RUN/raw/$p 2>&1
  if [ $? != 0 ]; then
    ln -s ../raw/$p $RUN/err/$p
    git add $RUN/err/$p
  else
    ln -s ../raw/$p $RUN/ok/$p
    git add $RUN/ok/$p
  fi
  git add $RUN/raw/$p
  git commit -m "$RUN: $p " -a
  git pull --no-edit
  git push origin master
done 
git push origin master
