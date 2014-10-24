FROM debian:wheezy
MAINTAINER Anil Madhavapeddy <anil@recoil.org>
ADD opam-installext /usr/bin/opam-installext
RUN apt-get -y update
RUN apt-get -y install sudo pkg-config git build-essential m4 software-properties-common aspcud unzip curl libx11-dev
ADD opam.list /etc/apt/sources.list.d/opam.list
RUN curl -OL http://download.opensuse.org/repositories/home:/ocaml/Debian_7.0/Release.key
RUN apt-key add - < Release.key
RUN apt-get -y update
RUN apt-get -y install opam
RUN git config --global user.email "docker@example.com"
RUN git config --global user.name "Docker CI"
RUN adduser --disabled-password --gecos "" opam
RUN passwd -l opam
ADD opamsudo /etc/sudoers.d/opam
RUN chmod 440 /etc/sudoers.d/opam
RUN chown root:root /etc/sudoers.d/opam
RUN chown -R opam:opam /home/opam
USER opam
ENV HOME /home/opam
ENV OPAMYES 1
WORKDIR /home/opam
USER opam
RUN sudo -u opam sh -c "git clone git://github.com/ocaml/opam-repository"
RUN sudo -u opam sh -c "opam init --comp=@COMPILER_VERSION@ -a -y /home/opam/opam-repository"
RUN sudo -u opam sh -c "opam install ocamlfind camlp4"
WORKDIR /home/opam/opam-repository
ONBUILD RUN sudo -u opam sh -c "cd /home/opam/opam-repository && git pull && opam update -u -y"
