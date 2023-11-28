#!/bin/sh

if [ ! -f Makefile ]; then
cat > Makefile << "EOF"
export REV=sysv

all:
	make -C builddir
txt:
	make -C builddir/src txt
EOF
fi

pushd ../../../../src/LFS/lfs-git
git checkout arm
popd
pushd ../../../../src/LFS/lfsja-git
git checkout arm
popd

mkdir -p builddir

cd builddir
../../../../../src/LFS/lfsja-git/configure \
        --prefix=/usr \
        --with-bookdir=../../../../../src/LFS/lfs-git \
	--enable-maintainer-mode
