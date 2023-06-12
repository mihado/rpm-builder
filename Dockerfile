FROM rockylinux:8.8

RUN groupadd -r mock && \
  useradd -r -g mock mockbuild

RUN groupadd -r builder && \
  useradd -r -g builder builder && \
  mkdir -p /home/builder/src && \
  chown -R builder /home/builder

RUN dnf -y group install "Development Tools"
RUN dnf -y install https://download.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
RUN dnf -y install dnf-plugins-core
RUN dnf config-manager --set-enabled powertools
RUN dnf makecache --refresh

COPY ./scripts /scripts

RUN /scripts/install-dependencies.sh

RUN ln -s /usr/bin/db2x_docbook2texi /usr/bin/docbook2x-texi

CMD [ "/bin/bash" ]
