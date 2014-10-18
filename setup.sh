#!/bin/sh -ex
# Setup config files for a particular OCaml distro/version

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
