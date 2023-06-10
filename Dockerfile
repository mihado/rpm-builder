FROM rockylinux:9.2

RUN groupadd -r mock && \
  useradd -r -g mock mockbuild

RUN groupadd -r builder && \
  useradd -r -g builder builder && \
  mkdir -p /home/builder/src && \
  chown -R builder /home/builder

RUN yum -y groupinstall "Development Tools"
RUN dnf install -y epel-release
RUN dnf config-manager --set-enabled crb

COPY ./scripts /scripts

RUN /scripts/install-dependencies.sh

RUN ln -s /usr/bin/db2x_docbook2texi /usr/bin/docbook2x-texi

CMD [ "/bin/bash" ]
