#!/bin/sh -ex
# Setup config files for a particular OCaml distro/version

distro=$1
version=$2

if [ "$distro" = "" ]; then
  echo Usage: $0 distro ocaml-version
  exit 1
fi

odir=build/$distro-$version
rm -rf $odir
mkdir -p $odir

cp scripts/$distro/* $odir/

case $version in
4.03.*)
  sed -e "s/@COMPILER_VERSION@/$version+trunk/g" < scripts/$distro/Dockerfile > $odir/Dockerfile
  ;;
*)
  sed -e "s/@COMPILER_VERSION@/$version/g" < scripts/$distro/Dockerfile > $odir/Dockerfile
  ;;
esac
