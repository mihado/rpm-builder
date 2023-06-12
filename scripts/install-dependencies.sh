#! /bin/bash

# yum-builddep -y git

# for ImageMagick
dnf install -y https://rpms.remirepo.net/enterprise/remi-release-9.rpm

dnf install -y \
  sudo \
  vim \
  yum-utils \
  git \
  wget \
  make \
  lzip \
  asciidoc \
  curl-devel \
  expat-devel \
  gettext-devel \
  openssl-devel \
  pcre2-devel \
  perl-devel \
  python3-devel \
  rpm-build \
  xmlto \
  zlib-devel \
  bash-completion \
  highlight \
  libsecret-devel \
  mod_dav_svn \
  perl-DBD-SQLite \
  perl-JSON \
  perl-JSON-PP \
  perl-Test-Simple \
  pkgconfig \
  subversion-perl \
  tcl \
  time \
  libtool-ltdl \
  libtool-ltdl-devel \
  tk
