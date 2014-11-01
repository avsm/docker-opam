Basic OPAM Docker environment for Ubuntu, Debian, CentOS and Fedora.

The image includes an OPAM plugin `installext` that installs external
dependencies via `apt-get` or `yum` before attempting to compile the package.
Binary builds are available at <https://registry.hub.docker.com/u/avsm/docker-opam/>.

To use the binary images, just do:

    docker pull avsm/docker-opam
    docker run -t avsm/docker-opam:ubuntu-trusty-4.02.1 opam installext ssl

Example usage of this repository to construct an image:

```
$ ./build.sh ubuntu-trusty 4.01.0
```

