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
ENV TEXLIVE_VERSION 2016
ENV TEXDIR /usr/local/texlive/$TEXLIVE_VERSION
ENV TEXMFCONFIG /data/.texlive$TEXLIVE_VERSION/texmf-config
ENV TEXMFHOME /data/texmf
ENV TEXMFLOCAL /usr/local/texlive/texmf-local
ENV TEXMFSYSCONFIG /usr/local/texlive/$TEXLIVE_VERSION/texmf-config
ENV TEXMFSYSVAR /usr/local/texlive/$TEXLIVE_VERSION/texmf-var
ENV TEXMFVAR /data/.texlive$TEXLIVE_VERSION/texmf-var

ENV TEXLIVE_SHA512 f03cf62c0bd3a3c0b655939b20e549b9a7f334bae16531ecfea0a0e836058f134448294e8b16c68db2810caa8f006f55f964e8de2323d4c7d29842d7d3992d2a
RUN wget ftp://tug.org/historic/systems/texlive/$TEXLIVE_VERSION/tlnet-final/install-tl-unx.tar.gz \
  && echo "$TEXLIVE_SHA512 install-tl-unx.tar.gz" | sha512sum -c \
  && tar xzvf install-tl-unx.tar.gz \
  && ./install-tl-*/install-tl -profile /texlive.profile \
  -repository ftp://tug.org/historic/systems/texlive/$TEXLIVE_VERSION/tlnet-final \
  && rm -rf install-tl-*

ENV PATH="${TEXDIR}/bin/x86_64-linux:${PATH}"

VOLUME ["/data"]
