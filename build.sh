#!/bin/sh -ex

distro=$1
version=$2

cp scripts/$distro/opam-installext .
cp scripts/$distro/Dockerfile .

case $distro,$version in 
ubuntu-trusty,4.01.*)
  ;;
ubuntu-trusty,4.02.*)
  echo "RUN sudo -u opam opam switch 4.02.0+trunk" >> Dockerfile
  ;;
*)
  echo Unknown $distro $version combo
  exit 1
  ;;
esac

sudo docker.io build --no-cache=true -t opam:$distro-$version .
