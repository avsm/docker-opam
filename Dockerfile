FROM ubuntu:latest
MAINTAINER Anil Madhavapeddy <anil@recoil.org>
RUN apt-get -y install sudo pkg-config git build-essential m4 software-properties-common
RUN git config --global user.email "docker@example.com"
RUN git config --global user.name "Docker CI"
RUN apt-get -y install python-software-properties
RUN echo "yes" | add-apt-repository ppa:avsm/ocaml41+opam11
RUN apt-get -y update -qq
RUN apt-get -y install -qq ocaml ocaml-native-compilers camlp4-extra opam
ADD opam-installext /usr/bin/opam-installext
RUN adduser --disabled-password --gecos "" opam
RUN passwd -l opam
ADD opamsudo /etc/sudoers.d/opam
USER opam
ENV HOME /home/opam
ENV OPAMVERBOSE 1
ENV OPAMYES 1
RUN opam init git://github.com/mirage/opam-repository#add-depexts-11
RUN opam install ocamlfind
ENTRYPOINT ["usr/bin/opam-installext"]
