#!/bin/sh

TOPDIR=/home/matsuand/src/hugo/hugoDocs-ja
OUTPUT=lcount.txt
THISDIR=$PWD

pushd $TOPDIR/src

LIST=`find . -name "*.ch" | sort | sed -e "s@^\.\/@@g"`

rm -f $THISDIR/$OUTPUT

for f in $LIST; do
  wc -l $f | gawk -v 'OFS=\t' '{print $2,$1}'>>$THISDIR/$OUTPUT
done

popd
