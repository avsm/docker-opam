FROM ubuntu:trusty
MAINTAINER Anil Madhavapeddy <anil@recoil.org>
ADD scripts/ubuntu-trusty/opam-installext /usr/bin/opam-installext
RUN apt-get -y update
RUN apt-get -y install sudo pkg-config git build-essential m4 software-properties-common aspcud unzip curl libx11-dev
ADD scripts/ubuntu-trusty/opam.list /etc/apt/sources.list.d/opam.list
RUN curl -OL http://download.opensuse.org/repositories/home:ocaml/xUbuntu_14.04/Release.key
RUN apt-key add - < Release.key
RUN apt-get -y update
#RUN apt-get -y install opam
RUN git clone git://github.com/ocaml/opam
RUN sh -c "cd opam && make cold && make install"
RUN git config --global user.email "docker@example.com"
RUN git config --global user.name "Docker CI"
RUN adduser --disabled-password --gecos "" opam
RUN passwd -l opam
ADD opamsudo /etc/sudoers.d/opam
RUN chmod 440 /etc/sudoers.d/opam
RUN chown root:root /etc/sudoers.d/opam
USER opam
ENV HOME /home/opam
ENV OPAMVERBOSE 1
ENV OPAMYES 1
WORKDIR /home/opam
USER opam
RUN sudo -u opam git clone git://github.com/ocaml/opam-repository
RUN sudo -u opam opam init --comp=@COMPILER_VERSION@ -a -y /home/opam/opam-repository
RUN sudo -u opam opam install ocamlfind
WORKDIR /home/opam/opam-repository
RUN sudo -u opam opam-admin make
