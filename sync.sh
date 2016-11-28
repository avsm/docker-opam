#!/bin/sh -ex
# Generate all Dockerfiles

for v in 4.01.0 4.02.3 4.03.0 4.04.0 4.05.0; do
  for d in debian-jessie ubuntu-xenial centos-7 centos-6; do
    ./setup.sh "$d" "$v"
  done
done

# Build the archive daemon over Ubuntu Trusty
rm -rf build/ubuntu-xenial-archive
mkdir -p build/ubuntu-xenial-archive
cp scripts/ubuntu-xenial/Dockerfile.archive build/ubuntu-xenial-archive/Dockerfile
