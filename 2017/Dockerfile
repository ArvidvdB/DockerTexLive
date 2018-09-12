#
# THIS DOCKERFILE IS GENERATED VIA "update.sh"
#
# PLEASE DO NOT EDIT IT DIRECTLY.
#
FROM debian:jessie
MAINTAINER Arvid van den Brink <a.b.vandenbrink@alumnus.utwente.nl>
ENV DEBIAN_FRONTEND noninteractive

#Build dependencies
RUN apt-get update \
  && apt-get install --no-install-recommends -y \
    wget perl perl-tk fontconfig libwww-perl \
  && apt-get clean \
  && rm -rf /var/lib/apt/lists/*
    
#Configuration
COPY texlive.profile /
WORKDIR /data
ENV TEXLIVE_VERSION 2017
ENV TEXDIR /usr/local/texlive/$TEXLIVE_VERSION
ENV TEXMFCONFIG /data/.texlive$TEXLIVE_VERSION/texmf-config
ENV TEXMFHOME /data/texmf
ENV TEXMFLOCAL /usr/local/texlive/texmf-local
ENV TEXMFSYSCONFIG /usr/local/texlive/$TEXLIVE_VERSION/texmf-config
ENV TEXMFSYSVAR /usr/local/texlive/$TEXLIVE_VERSION/texmf-var
ENV TEXMFVAR /data/.texlive$TEXLIVE_VERSION/texmf-var

ENV TEXLIVE_SHA512 fabdf9d625d76c9a54e023c7a0d1b74c6e0fd72c29ef452116409a3ce5b2b5ea1f1a2d0b96e7db95a13ca1d2d3d4b657b9f86f777c88cfe631328a9f959c6e30
RUN wget ftp://tug.org/historic/systems/texlive/$TEXLIVE_VERSION/tlnet-final/install-tl-unx.tar.gz \
  && echo "$TEXLIVE_SHA512 install-tl-unx.tar.gz" | sha512sum -c \
  && tar xzvf install-tl-unx.tar.gz \
  && ./install-tl-*/install-tl -profile /texlive.profile \
  -no-persistent-downloads \
  -repository ftp://tug.org/historic/systems/texlive/$TEXLIVE_VERSION/tlnet-final \
  && rm -rf install-tl-*

ENV PATH="${TEXDIR}/bin/x86_64-linux:${PATH}"

VOLUME ["/data"]
