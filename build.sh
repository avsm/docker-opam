#!/bin/sh -ex

distro=$1
version=$2

cp scripts/$distro/opam-installext .

case $distro,$version in 
ubuntu-trusty,4.01.*)
  sed -e "s/@COMPILER_VERSION@/$version/g" < scripts/$distro/Dockerfile > Dockerfile
  ;;
ubuntu-trusty,4.02.*)
  sed -e "s/@COMPILER_VERSION@/$version/g" < scripts/$distro/Dockerfile > Dockerfile
  ;;
ubuntu-trusty,4.03.*)
  sed -e "s/@COMPILER_VERSION@/$version+trunk/g" < scripts/$distro/Dockerfile > Dockerfile
  ;;
*)
  echo Unknown $distro $version combo
  exit 1
  ;;
esac

sudo docker.io build --no-cache=true -t opam:$distro-$version .
