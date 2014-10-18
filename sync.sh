#!/bin/sh -ex
# Generate all Dockerfiles

for v in 4.01.0 4.02.1; do
  for d in ubuntu-trusty centos-7; do
    ./setup.sh $d $v
  done
done
