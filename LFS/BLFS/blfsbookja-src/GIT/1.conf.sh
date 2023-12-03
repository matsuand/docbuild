#!/bin/sh

if [ ! -f Makefile ]; then
cat > Makefile << "EOF"
export REV=sysv

all:
	cd builddir && make
pdf:
	cd builddir && make pdf
EOF
fi

mkdir -p builddir

cd builddir
$HOME/src/LFS/BLFS/blfsbookja-src/configure \
        --with-bookdir=$HOME/src/LFS/BLFS/blfs-git \
        --with-ipafontdir=/usr/share/fonts/IPA \
	--with-rev=sysv
