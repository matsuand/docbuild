#!/bin/sh

if [ ! -f Makefile ]; then
cat > Makefile << "EOF"
export REV=systemd

all:
	make -C builddir
txt:
	make -C builddir/src txt
EOF
fi

pushd ../../../../src/LFS/lfs-git
git checkout trunk
popd
pushd ../../../../src/LFS/lfsja-git
git checkout main
popd

mkdir -p builddir

cd builddir
../../../../../src/LFS/lfsja-git/configure \
        --prefix=/usr \
        --with-bookdir=../../../../../src/LFS/lfs-git \
        --with-rev=systemd \
	--enable-maintainer-mode
