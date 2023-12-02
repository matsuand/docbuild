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

pushd $HOME/src/LFS/LFS/lfs-git >/dev/null
git checkout arm
popd >/dev/null
pushd $HOME/src/LFS/LFS/lfsbookja-src >/dev/null
git checkout arm
popd >/dev/null

mkdir -p builddir

cd builddir
$HOME/src/LFS/LFS/lfsbookja-src/configure \
        --prefix=/usr \
        --with-bookdir=$HOME/src/LFS/LFS/lfs-git \
	--enable-maintainer-mode
