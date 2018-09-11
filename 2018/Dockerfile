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
ENV TEXLIVE_VERSION 2018
ENV TEXDIR /usr/local/texlive/$TEXLIVE_VERSION
ENV TEXMFCONFIG /data/.texlive$TEXLIVE_VERSION/texmf-config
ENV TEXMFHOME /data/texmf
ENV TEXMFLOCAL /usr/local/texlive/texmf-local
ENV TEXMFSYSCONFIG /usr/local/texlive/$TEXLIVE_VERSION/texmf-config
ENV TEXMFSYSVAR /usr/local/texlive/$TEXLIVE_VERSION/texmf-var
ENV TEXMFVAR /data/.texlive$TEXLIVE_VERSION/texmf-var

