# !/bin/sh

PREV=87aef465edb62894a7eb9e28a6db6ea29c3eecdf

OLDPWD=${PWD}
pushd ~/src/LFS/LFS/trunk/BOOK
svn diff -r ${PREV} >${OLDPWD}/_diff.txt
svn log -r ${PREV}:HEAD >${OLDPWD}/_log.txt
popd
