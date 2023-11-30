#!/bin/sh

export REV=sysv

pushd builddir

cp -pv src/lfs-bootscripts-*.tar.bz2 .

make dist-bzip2
make pdf
make txt

rm -f lfsbookja-html.tar.bz2
tar cf - git-ja | bzip2 > lfsbookja-git-html.tar.bz2

rm -f lfsbookja-git-nochunks.html.bz2
bzip2 lfsbookja-git.html
mv lfsbookja-git.html.bz2 lfsbookja-git-nochunks.html.bz2

rm -f lfsbookja-git.txt.bz2
bzip2 lfsbookja-git.txt

popd
