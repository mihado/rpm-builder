# RPM Builder for Rocky Linux 8

### References
* https://git-scm.com/book/en/v2/Getting-Started-Installing-Git
* https://computingforgeeks.com/how-to-install-latest-version-of-git-git-2-x-on-centos-7/
* http://broken-by.me/building-latest-git-for-centos/

```sh
docker build . -t rpm-builder
docker run --rm -it -v ${PWD}/rpmbuild:/home/builder/rpmbuild rpm-builder

# Note: this switches user to `builder` (cannot build rpm as root)
/scripts/prepare.sh

# file-5.44
wget https://download.fedoraproject.org/pub/fedora/linux/releases/38/Everything/source/tree/Packages/f/file-5.44-3.fc38.src.rpm
rpm -ivh file-5.44-3.fc38.src.rpm
rpmbuild --recompile file-5.44-3.fc38.src.rpm
rpmbuild -bp /home/builder/rpmbuild/SPECS/file.spec
rpmbuild -ba /home/builder/rpmbuild/SPECS/file.spec

# try install in stock rockylinux8
docker run --rm -it -v ${PWD}/rpmbuild:/root/rpmbuild rockylinux:8.8
dnf install -y /root/rpmbuild/RPMS/x86_64/file-5.44-3.el8.x86_64.rpm  /root/rpmbuild/RPMS/x86_64/file-libs-5.44-3.el8.x86_64.rpm
```
