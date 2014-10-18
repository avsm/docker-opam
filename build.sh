#!/bin/sh -ex

distro=$1
version=$2

./setup.sh $1 $2
CACHE="--no-cache=true"
sudo docker.io build ${CACHE} -t opam:$distro-$version .
