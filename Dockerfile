FROM ubuntu:trusty
MAINTAINER Anil Madhavapeddy <anil@recoil.org>
RUN apt-get -y install sudo pkg-config git build-essential m4 software-properties-common ocaml camlp4-extra ocaml-native-compilers opam
RUN git config --global user.email "docker@example.com"
RUN git config --global user.name "Docker CI"
ADD opam-installext /usr/bin/opam-installext
RUN adduser --disabled-password --gecos "" opam
RUN passwd -l opam
ADD opamsudo /etc/sudoers.d/opam
RUN chmod 440 /etc/sudoers.d/opam
RUN chown root:root /etc/sudoers.d/opam
USER opam
ENV HOME /home/opam
ENV OPAMVERBOSE 1
ENV OPAMYES 1
RUN opam init
RUN opam install ocamlfind
ENTRYPOINT ["usr/bin/opam-installext"]
