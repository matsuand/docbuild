#!/bin/sh

pushd $HOME/src/hugo/hugoDocs-ja

mkdir -p build
cd       build

../configure \
        --prefix=/usr                      \
        --with-origdir=../hugoDocs.orig \
	--enable-maintainer-mode

popd
