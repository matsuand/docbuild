#!/bin/sh

TOPDIR=/home/matsuand/src/docker/docs-ja
OUTPUT=brokenlinks.txt
THISDIR=$PWD

pushd $TOPDIR/build/src >/dev/null

grep --exclude='*.png' --exclude-dir={node_modules,public} -rP "]\(/(?!docker\.docs-ja)" * | sort > $THISDIR/$OUTPUT

popd >/dev/null

echo >$OUTPUT
echo Check between @y@z...

pushd $TOPDIR/src >/dev/null

pcre2grep -Mnr '@y\n@z' * > $THISDIR/$OUTPUT

popd >/dev/null

cat $OUTPUT
