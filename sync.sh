#!/bin/sh -ex
# Generate all Dockerfiles

for v in 4.01.0 4.02.1; do
  for d in debian-wheezy ubuntu-trusty centos-7 centos-6; do
    ./setup.sh $d $v
  done
done

# Build the archive daemon over Ubuntu Trusty
rm -rf build/ubuntu-trusty-archive
cp -r build/ubuntu-trusty-4.02.1 build/ubuntu-trusty-archive
cat scripts/ubuntu-trusty/Dockerfile.archive >> build/ubuntu-trusty-archive/Dockerfile
