#!/bin/sh

pushd $HOME/src/docker/docs-ja

mkdir -p build
cd       build

../configure \
        --with-origdir=../docs.orig   \
	--with-hosturl="http://lfstranslation5" \
	--enable-maintainer-mode

popd
