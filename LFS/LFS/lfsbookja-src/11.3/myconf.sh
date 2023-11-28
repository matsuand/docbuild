#!/bin/sh

VER=11.3
BOOKDIR=../../../../src/LFS/lfs-git
(cd $BOOKDIR && git checkout $VER)
JADIR=../../../../src/LFS/lfsja-git
(cd $JADIR && git checkout $VER)

if [ ! -f Makefile ]; then
cat > Makefile << "EOF"
export REV=sysv

all:
	make -C builddir
txt:
	make -C builddir/src txt
EOF
fi

mkdir -p builddir

cd builddir
../../../../../src/LFS/lfsja-git/configure \
        --prefix=/usr \
        --with-bookdir=../../../../../src/LFS/lfs-git \
	--enable-maintainer-mode
