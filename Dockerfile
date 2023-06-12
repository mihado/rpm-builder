FROM rockylinux:8.8

RUN groupadd -r mock && \
  useradd -r -g mock mockbuild

RUN groupadd -r builder && \
  useradd -r -g builder builder && \
  mkdir -p /home/builder/src && \
  chown -R builder /home/builder

RUN yum -y groupinstall "Development Tools"
RUN yum makecache --refresh

RUN yum -y install https://download.fedoraproject.org/pub/epel/epel-release-latest-8.noarch.rpm
RUN yum-config-manager --enable powertools

COPY ./scripts /scripts

RUN /scripts/install-dependencies.sh

RUN ln -s /usr/bin/db2x_docbook2texi /usr/bin/docbook2x-texi

CMD [ "/bin/bash" ]
