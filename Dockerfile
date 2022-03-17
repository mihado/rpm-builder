FROM centos:7

RUN groupadd -r mock && \
  useradd -r -g mock mockbuild

RUN groupadd -r builder && \
  useradd -r -g builder builder && \
  mkdir -p /home/builder/rpmbuild && \
  chown -R builder /home/builder

RUN yum -y groupinstall "Development Tools"

COPY ./scripts /scripts

RUN /scripts/install-dependencies.sh

RUN ln -s /usr/bin/db2x_docbook2texi /usr/bin/docbook2x-texi

CMD [ "/bin/bash" ]
