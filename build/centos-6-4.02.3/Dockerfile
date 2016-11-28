FROM centos:centos6
MAINTAINER Anil Madhavapeddy <anil@recoil.org>
RUN  curl -o /etc/yum.repos.d/home:ocaml.repo -OL http://download.opensuse.org/repositories/home:ocaml/CentOS_6/home:ocaml.repo && \
  yum groupinstall -y "Development Tools" && \
  yum install -y \
    git \
    opam \
    passwd \
    sudo && \
  useradd -d /home/opam -m -s /bin/bash opam && \
  passwd -l opam && \
  chown -R opam:opam /home/opam
ADD opamsudo /etc/sudoers.d/opam
ADD opam-installext /usr/bin/opam-installext
RUN chmod 440 /etc/sudoers.d/opam && \
  chown root:root /etc/sudoers.d/opam && \
  sed -i.bak 's/^Defaults.*requiretty//g' /etc/sudoers
ENV HOME=/home/opam OPAMYES=1
USER opam
WORKDIR /home/opam
RUN opam init --comp=4.02.3 -a -y && \
  opam installext ocamlfind camlp4
ONBUILD RUN opam update -u -y
