FROM avsm/docker-opam:ubuntu-trusty-4.02.1
MAINTAINER Anil Madhavapeddy <anil@recoil.org>
RUN sudo apt-get install -y libssl-dev
RUN sudo -u opam sh -c "cd /home/opam/opam-repository && opam-admin make"
RUN sudo -u opam sh -c "opam init -y -a"
RUN sudo -u opam sh -c "opam install -y lwt ssl cohttp"
