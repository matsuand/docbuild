#!/bin/sh

VER=11.3

export REV=sysv

pushd builddir

cp -pv src/lfs-bootscripts-*.tar.bz2 .

make dist-bzip2
make pdf
make txt

rm -f lfsbookja-$VER-html.tar.bz2
tar cf - $VER-ja | bzip2 > lfsbookja-$VER-html.tar.bz2

rm -f lfsbookja-$VER-nochunks.html.bz2
bzip2 lfsbookja-$VER.html
mv lfsbookja-$VER.html.bz2 lfsbookja-$VER-nochunks.html.bz2

rm -f lfsbookja-$VER.txt.bz2
bzip2 lfsbookja-$VER.txt

popd
