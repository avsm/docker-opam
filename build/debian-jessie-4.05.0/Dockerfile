FROM debian:jessie
MAINTAINER Marek Kubica <marek@xivilization.net>
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
WORKDIR /home/opam
ENV HOME=/home/opam OPAMYES=1
ADD opam-installext /usr/bin/opam-installext
ADD opamsudo /etc/sudoers.d/opam
RUN chmod 440 /etc/sudoers.d/opam && \
  chown root:root /etc/sudoers.d/opam
USER opam
RUN opam init --comp=4.05.0+trunk -a -y && \
  opam install ocamlfind camlp4
ONBUILD RUN opam update -u -y
