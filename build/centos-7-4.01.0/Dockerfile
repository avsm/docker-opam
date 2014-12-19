FROM centos:centos7
MAINTAINER Anil Madhavapeddy <anil@recoil.org>
RUN yum install -y sudo passwd git
RUN useradd -d /home/opam -m -s /bin/bash opam
RUN passwd -l opam
ADD opamsudo /etc/sudoers.d/opam
RUN chmod 440 /etc/sudoers.d/opam
RUN chown root:root /etc/sudoers.d/opam
RUN sed -i.bak 's/^Defaults.*requiretty//g' /etc/sudoers
ADD opam-installext /usr/bin/opam-installext
RUN git config --global user.email "docker@example.com"
RUN git config --global user.name "Docker CI"
RUN yum groupinstall -y "Development Tools"
RUN curl -o /etc/yum.repos.d/home:ocaml.repo -OL http://download.opensuse.org/repositories/home:ocaml/CentOS_7/home:ocaml.repo
RUN yum install -y opam
RUN yum install -y ocaml ocaml-camlp4-devel ocaml-ocamldoc
RUN chown -R opam:opam /home/opam
USER opam
ENV HOME /home/opam
ENV OPAMYES 1
WORKDIR /home/opam
USER opam
RUN sudo -u opam git clone git://github.com/ocaml/opam-repository
RUN sudo -u opam opam init -a -y /home/opam/opam-repository
RUN sudo -u opam opam switch 4.01.0
RUN sudo -u opam opam installext ocamlfind camlp4
WORKDIR /home/opam/opam-repository
ONBUILD RUN sudo -u opam sh -c "cd /home/opam/opam-repository && git pull && opam update -u -y"
