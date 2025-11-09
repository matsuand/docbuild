#!/bin/sh

SKIP=$1
srcdir=$HOME/src/hugo/hugoDocs-ja/hugoDocs.orig

pushd $HOME/src/hugo/hugoDocs-ja/build/src

if test "x$SKIP" != "xskip"; then
  make
  if [ $? -ne 0 ]; then
    exit 1
  fi
fi

sed -e "/baseURL/s@https://gohugo.io/@http://lfstranslation5/hugoDocs-ja/@g" \
	hugo.toml > hugo-lfs5.toml

VER0=`grep "HUGO_VERSION" $srcdir/netlify.toml | \
  sed -e "s/[ \t]*HUGO_VERSION = \"\([0-9\.]*\)\"/\1/"`
VER1=`hugo version | gawk '{print $2}' | gawk -F[-+] '{print $1" "$3}'`

echo ***MATSUAND***
echo hugo binary should be ${VER0}
echo hugo binary is ${VER1} in `which hugo`
echo ***MATSUAND***

# https://github.com/gohugoio/hugo/releases/download/v0.134.2/hugo_extended_0.134.2_linux-amd64.tar.gz

hugo --config hugo-lfs5.toml

popd
