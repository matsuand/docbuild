#!/bin/sh

SKIP=$1
srcdir=$HOME/src/docker/docs-ja/docs.orig

pushd $HOME/src/docker/docs-ja/build

if test "x$SKIP" != "xskip"; then
  make || exit 1
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
# https://github.com/gohugoio/hugo/releases/download/v0.154.2/hugo_extended_0.154.2_linux-amd64.tar.gz
# https://github.com/gohugoio/hugo/releases/download/v0.156.0/hugo_extended_0.156.0_linux-amd64.tar.gz
# https://github.com/gohugoio/hugo/releases/download/v0.158.0/hugo_extended_0.158.0_linux-amd64.tar.gz
# https://github.com/gohugoio/hugo/releases/download/v0.161.1/hugo_extended_0.161.1_linux-amd64.tar.gz
# https://github.com/gohugoio/hugo/releases/download/v0.163.0/hugo_extended_0.163.0_linux-amd64.tar.gz
# tar xf hugo_extended_0.163.0_linux-amd64.tar.gz
# mv hugo /usr/bin/hugo-0.163.0-ex

VER=`grep "^HUGO_VERSION" $srcdir/netlify.toml | \
  sed -e "s/HUGO_VERSION = \"\([0-9\.]*\)\"/\1/"`
echo ***MATSUAND***
echo hugo binary should be $VER
echo hugo binary is hugo-0.163.0-ex from ./2.make.sh
echo ***MATSUAND***

# https://github.com/daveshanley/vacuum/releases/download/v0.30.6/vacuum_0.30.6_linux_x86_64.tar.gz
# tar xf vacuum_0.30.6_darwin_x86_64.tar.gz
# mv vacuum /usr/bin

cd src
hack/api-docs/run.sh test && hack/api-docs/run.sh generate
hugo-0.163.0-ex --gc --minify -b http://lfstranslation5/docker.docs-ja #--environment development

#npx pagefind@v1.5.0-beta.1 --force-language ja

if test ! -d public/pagefind; then
  PAGEFINDCOMMAND=`grep "^command" netlify.toml | sed -e "s/.*npx \(.*\)\"/\1/"`
  npx ${PAGEFINDCOMMAND}
fi

popd
