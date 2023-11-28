# !/bin/sh

PREV=23628

OLDPWD=${PWD}
pushd ~/src/BLFS
svn diff -r ${PREV} >${OLDPWD}/_diff.txt
svn log -r ${PREV}:HEAD >${OLDPWD}/_log.txt
#REV=`svn info | grep Revision: | sed -e "s/Revision: //"`
popd

#echo REV=${REV}
