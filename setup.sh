#!/bin/sh -ex
# Setup config files for a particular OCaml distro/version

distro="$1"
version="$2"

if [ "$distro" = "" ]; then
  echo "Usage: $0 distro ocaml-version"
  exit 1
fi

odir="build/$distro-$version"
rm -rf "$odir"
mkdir -p "$odir"

cp scripts/$distro/* "$odir/"

case $version in
4.05.*)
  sed -e "s/@COMPILER_VERSION@/$version+trunk/g" < "scripts/$distro/Dockerfile" > "$odir/Dockerfile"
  ;;
4.03.*|4.04*)
  sed -e "s/@COMPILER_VERSION@/$version/g" < "scripts/$distro/Dockerfile" > "$odir/Dockerfile"
  odir_flambda="$odir-flambda"
  rm -rf "$odir_flambda"
  mkdir -p "$odir_flambda"
  cp scripts/$distro/* "$odir_flambda/"
  sed -e "s/@COMPILER_VERSION@/$version+flambda/g" < "scripts/$distro/Dockerfile" > "$odir_flambda/Dockerfile"
  ;;
*)
  sed -e "s/@COMPILER_VERSION@/$version/g" < "scripts/$distro/Dockerfile" > "$odir/Dockerfile"
  ;;
esac
