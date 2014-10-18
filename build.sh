#!/bin/sh -ex

distro=$1
version=$2

cp scripts/$distro/opam-installext .

case $version in
4.03.*)
  sed -e "s/@COMPILER_VERSION@/$version+trunk/g" < scripts/$distro/Dockerfile > Dockerfile
  ;;
*)
  sed -e "s/@COMPILER_VERSION@/$version/g" < scripts/$distro/Dockerfile > Dockerfile
  ;;
esac

CACHE="--no-cache=true"
sudo docker.io build ${CACHE} -t opam:$distro-$version .
