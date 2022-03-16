#! /bin/bash

yum-builddep -y git

yum install -y \
  asciidoc \
  curl-devel \
  dh-autoreconf \
  docbook2X \
  epel-release \
  expat-devel \
  gettext-devel \
  openssl-devel \
  pcre2-devel \
  perl-devel \
  rpm-build \
  sudo \
  vim \
  xmlto \
  zlib-devel \
  bash-completion \
  cvs \
  cvsps \
  epel-rpm-macros \
  highlight \
  libsecret-devel \
  mod_dav_svn \
  perl-DBD-SQLite \
  perl-IO-Tty \
  perl-JSON \
  perl-JSON-PP \
  perl-Test-Simple \
  pkgconfig \
  python2-devel \
  subversion-perl \
  tcl \
  time \
  tk
