# !/bin/sh

PREV=12171

OLDPWD=${PWD}
pushd ~/src/LFS/LFS/trunk/BOOK
svn diff -r ${PREV} >${OLDPWD}/_diff.txt
svn log -r ${PREV}:HEAD >${OLDPWD}/_log.txt
popd
