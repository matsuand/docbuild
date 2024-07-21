#!/bin/sh

SKIP=$1

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

cd src && hugo #--environment development
popd
