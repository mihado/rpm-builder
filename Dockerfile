FROM centos:7

COPY ./scripts/install-dependencies.sh /install-dependencies.sh

RUN yum -y groupinstall "Development Tools"

RUN /install-dependencies.sh

RUN ln -s /usr/bin/db2x_docbook2texi /usr/bin/docbook2x-texi

RUN groupadd -r mock && \
  useradd -r -g mock mockbuild

RUN groupadd -r builder && \
  useradd -r -g builder builder && \
  mkdir -p /home/builder/rpmbuild && \
  chown -R builder /home/builder

CMD [ "/bin/bash" ]
