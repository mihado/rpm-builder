# RPM Builder for CentOS 7

### References
* https://git-scm.com/book/en/v2/Getting-Started-Installing-Git
* https://computingforgeeks.com/how-to-install-latest-version-of-git-git-2-x-on-centos-7/
* http://broken-by.me/building-latest-git-for-centos/

```sh
docker build . -t rpm-builder

docker run --rm -it -v ${PWD}/rpmbuild:/home/builder/rpmbuild rpm-builder

# Note: this switches user to `builder` (cannot build rpm as root)
/scripts/prepare.sh

# Example: Build git from using fedora src.rpm
rpm -i https://kojipkgs.fedoraproject.org//packages/git/2.34.1/1.fc34/src/git-2.34.1-1.fc34.src.rpm && \
cd /home/builder/rpmbuild/SPECS && \
rpmbuild -ba git.spec
```

```sh
# Try installing in stock CentOS
docker run --rm -it -v ${PWD}/rpmbuild:/root/rpmbuild rockylinux:9.2

yum install \
  /root/rpmbuild/RPMS/x86_64/git-2.34.1-1.el7.x86_64.rpm \
  /root/rpmbuild/RPMS/x86_64/git-core-2.34.1-1.el7.x86_64.rpm \
  /root/rpmbuild/RPMS/noarch/perl-Git-2.34.1-1.el7.noarch.rpm \
  /root/rpmbuild/RPMS/noarch/git-core-doc-2.34.1-1.el7.noarch.rpm
```


```sh
# https://blog.packagecloud.io/working-with-source-rpms/
wget https://mirror.2degrees.nz/fedora/linux/updates/38/Everything/source/tree/Packages/i/ImageMagick-7.1.1.8-1.fc38.src.rpm
rpm -ivh ImageMagick-7.1.1.8-1.fc38.src.rpm

rpmbuild --recompile ImageMagick-7.1.1.8-1.fc38.src.rpm

dnf install -y doxygen giflib-devel jbigkit-devel libgs-devel urw-base35-fonts-devel openexr-devel bzip2-devel jasper-devel lcms2-devel libheif-devel libjpeg-turbo-devel libjxl-devel libpng-devel libtiff-devel libwebp-devel libwmf-devel libzip-devel pango-devel fftw-devel libXt-devel librsvg2-devel LibRaw-devel djvulibre-devel graphviz-devel openjpeg2-devel libraqm-devel liblqr-1-devel

rpmbuild -bp ImageMagick.spec
rpmbuild -ba ImageMagick.spec
```


```sh
# file-5.44
docker run --rm -it -v ${PWD}/rpmbuild:/home/builder/rpmbuild rpm-builder

/scripts/prepare.sh

wget https://download.fedoraproject.org/pub/fedora/linux/releases/38/Everything/source/tree/Packages/f/file-5.44-3.fc38.src.rpm
rpm -ivh file-5.44-3.fc38.src.rpm

rpmbuild --recompile file-5.44-3.fc38.src.rpm

cd /home/builder/rpmbuild/
rpmbuild -bp file.spec
rpmbuild -ba file.spec

docker run --rm -it -v ${PWD}/rpmbuild:/root/rpmbuild rockylinux:8.8
```
