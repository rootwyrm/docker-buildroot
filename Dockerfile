FROM ubuntu:15.10
# ORIGINAL MAINTAINER Auke Willem Oosterhoff <auke@orangetux.nl>
MAINTAINER Phillip Jaenke <docker@rootwyrm.com>

ENV DEBIAN_FRONTEND=noninteractive

RUN apt-get update && \
    apt-get install -y \
    build-essential \
    bash \
    bc \
    binutils \
    build-essential \
    bzip2 \
    cpio \
    g++ \
    gcc \
    git \
    gzip \
    libncurses5-dev \
    make \
    mercurial \
    whois \         
    patch \
    perl \
    python \
    rsync \
    sed \
    tar \
    unzip \
    wget

# Sometimes Buildroot need proper locale, e.g. when using a toolchain
# based on glibc.
RUN locale-gen en_US.utf8

WORKDIR /root
RUN git clone git://git.buildroot.net/buildroot --depth=1
WORKDIR /root/buildroot

RUN touch .config
RUN touch kernel.config
VOLUME /root/buildroot/dl
VOLUME /buildroot_output

CMD ["/bin/bash"]
