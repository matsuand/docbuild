#!/bin/sh

VER=git
NAME=lfsbookja-$VER
DIRNAME=$VER-ja

SRCDIR=$PWD/builddir
DSTDIR=$HOME/src/LFS/LFS/lfsbookja-doc

rm -fr $DSTDIR/$DIRNAME

tar xf $SRCDIR/$NAME-html.tar.bz2 -C $DSTDIR
cp -p $SRCDIR/$NAME.pdf $DSTDIR/download

cp -p $SRCDIR/$NAME{-html.tar,-nochunks.html,.txt}.bz2 $DSTDIR/download
