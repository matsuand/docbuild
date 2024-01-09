#!/bin/sh

SKIP=$1

pushd $HOME/src/hugo/hugoDocs-ja/build/src

echo $SKIP
if test "x$SKIP" != "xskip"; then
  make
  if [ $? -ne 0 ]; then
    exit 1
  fi
fi

sed -e "/baseURL/s@https://gohugo.io/@http://lfstranslation5/hugoDocs-ja/@g" \
	hugo.toml > hugo-lfs5.toml

hugo --config hugo-lfs5.toml

popd
