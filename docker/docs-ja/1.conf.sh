#!/bin/sh

pushd $HOME/src/docker/docs-ja

mkdir -p build
cd       build

../configure \
        --with-origdir=../docs.orig   \
	--enable-maintainer-mode

popd
