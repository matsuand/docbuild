#!/bin/sh

FILE=$1


TOPDIR=/home/matsuand/src/docker/docs-ja

ORIGDIR=$TOPDIR/docs.orig

echo Finding $FILE in $ORIGDIR...
ls $ORIGDIR
find $ORIGDIR -name $FILE

