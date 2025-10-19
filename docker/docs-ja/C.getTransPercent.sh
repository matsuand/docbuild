#!/bin/sh

THISDIR=$PWD
SRCDIR=/home/matsuand/src/docker/docs-ja/src
OUTPUT=$THISDIR/getTransPercent.txt

rm -f $OUTPUT

FILES=`find $SRCDIR -name "*.ch" | sort`

for f in $FILES; do
  $THISDIR/B.transPercent.perl $f | sed -e "s|$SRCDIR/||" >> $OUTPUT
done
