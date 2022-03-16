# RPM Builder for CentOS 7

### References
* https://git-scm.com/book/en/v2/Getting-Started-Installing-Git
* https://computingforgeeks.com/how-to-install-latest-version-of-git-git-2-x-on-centos-7/
* http://broken-by.me/building-latest-git-for-centos/

```sh
docker build . -t rpm-builder

docker run --rm -it -v ${PWD}/rpmbuild:/home/builder/rpmbuild rpm-builder

# Install dependencies again. Not sure why docker build didn't install them all
/install-dependencies.sh

# Fix up permissions
chown -R builder /home/builder

# Build
sudo su builder
rpm -i https://kojipkgs.fedoraproject.org//packages/git/2.34.1/1.fc34/src/git-2.34.1-1.fc34.src.rpm
cd /home/builder/rpmbuild/SPECS && rpmbuild -ba git.spec
```

```sh
# Try installing in stock CentOS
docker run --rm -it -v ${PWD}/rpmbuild:/root/rpmbuild centos:7

yum install \
  /root/rpmbuild/RPMS/x86_64/git-2.34.1-1.el7.x86_64.rpm \
  /root/rpmbuild/RPMS/x86_64/git-core-2.34.1-1.el7.x86_64.rpm \
  /root/rpmbuild/RPMS/noarch/perl-Git-2.34.1-1.el7.noarch.rpm \
  /root/rpmbuild/RPMS/noarch/git-core-doc-2.34.1-1.el7.noarch.rpm
```
