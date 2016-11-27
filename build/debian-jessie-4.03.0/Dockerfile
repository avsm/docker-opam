FROM debian:jessie
MAINTAINER Marek Kubica <marek@xivilization.net>
ADD opam-installext /usr/bin/opam-installext
RUN apt-get -y update && \
  apt-get -y install \
    aspcud \
    build-essential \
    git \
    libx11-dev \
    m4 \
    opam \
    pkg-config \
    sudo \
    unzip && \
  apt-get -y clean && \
  adduser --disabled-password --gecos "" opam && \
  passwd -l opam && \
  chown -R opam:opam /home/opam
ADD opamsudo /etc/sudoers.d/opam
RUN chmod 440 /etc/sudoers.d/opam && \
  chown root:root /etc/sudoers.d/opam
USER opam
ENV HOME=/home/opam OPAMYES=1
WORKDIR /home/opam
RUN git clone https://github.com/ocaml/opam-repository && \
  opam init --comp=4.03.0 -a -y /home/opam/opam-repository && \
  opam install ocamlfind camlp4
WORKDIR /home/opam/opam-repository
ONBUILD RUN sudo -u opam sh -c "cd /home/opam/opam-repository && git pull && opam update -u -y"
