#!/bin/sh

pushd $HOME/src/docker/docs-ja

rm -fr autom4te/
autoreconf && touch configure

popd
