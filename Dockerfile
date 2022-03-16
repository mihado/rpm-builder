FROM centos:7

RUN yum -y groupinstall "Development Tools"

RUN yum-builddep -y git

RUN yum install -y \
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

RUN ln -s /usr/bin/db2x_docbook2texi /usr/bin/docbook2x-texi

RUN groupadd -r mock && \
  useradd -r -g mock mockbuild

RUN groupadd -r builder && \
  useradd -r -g builder builder && \
  mkdir -p /home/builder/rpmbuild && \
  chown -R builder /home/builder

CMD [ "/bin/bash" ]
