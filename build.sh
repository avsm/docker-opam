#!/bin/sh -ex

distro="$1"
version="$2"

cd "build/$distro-$version"
CACHE="--no-cache=true"
sudo docker.io build "${CACHE}" -t "opam:$distro-$version" .
