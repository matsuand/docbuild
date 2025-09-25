#!/bin/sh

DIR0=/home/matsuand/ref/docker/docs-ja/docs.orig
OUT0=$PWD/lsR0.txt
DIR1=/home/matsuand/src/docker/docs-ja/build/src
OUT1=$PWD/lsR1.txt

pushd ${DIR0} >/dev/null

pwd
ls -R | sed -e "/^Makefile$/d" \
	    -e "/^2\.make\.sh/d" > ${OUT0}

popd >/dev/null

pushd ${DIR1} >/dev/null

pwd
ls -R | sed -e "/^Makefile$/d" \
	    -e "/^.*\.sub$/d" > ${OUT1}

popd >/dev/null

diff -aur ${OUT0} ${OUT1} > lsR-diff.txt
