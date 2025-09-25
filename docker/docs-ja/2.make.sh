#!/bin/sh

SKIP=$1
srcdir=$HOME/src/docker/docs-ja/docs.orig

pushd $HOME/src/docker/docs-ja/build

if test "x$SKIP" != "xskip"; then
  make
  if [ $? -ne 0 ]; then
    exit 1
  fi
fi

sed -i -e "/baseURL/s@https://docs.docker.com@http://lfstranslation5/docker.docs-ja@g" \
       -e "s@repo: https://github.com/docker/docs@repo: https://github.com/matsuand/docker.docs-ja@g" \
	src/hugo.yaml

#grep ^permalink src/hugo.yaml
#if [ $? -ne 0 ]; then
#  sed -i -e "/baseURL/apermalinks: docker.docs-ja" \
#       src/hugo.yaml
#fi

# https://github.com/gohugoio/hugo/releases/download/v0.134.3/hugo_0.134.3_linux-amd64.tar.gz
# https://github.com/gohugoio/hugo/releases/download/v0.136.2/hugo_0.136.2_linux-amd64.tar.gz
# https://github.com/gohugoio/hugo/releases/download/v0.141.0/hugo_extended_0.141.0_linux-amd64.tar.gz
# mv hugo /usr/bin/hugo-0.141.0-ex

VER=`grep "^HUGO_VERSION" $srcdir/netlify.toml | \
  sed -e "s/HUGO_VERSION = \"\([0-9\.]*\)\"/\1/"`
echo ***MATSUAND***
echo hugo binary should be $VER
echo hugo binary is hugo-0.141.0-ex from ./2.make.sh
echo ***MATSUAND***
cd src && hugo-0.141.0-ex --gc --minify -b http://lfstranslation5/docker.docs-ja #--environment development
popd
