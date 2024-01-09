#!/bin/sh

pushd $HOME/src/hugo/hugoDocs-ja

autoreconf && touch configure

popd
