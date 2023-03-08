#!/bin/sh

VER=11.3

pushd builddir

make dist-bzip2
make pdf
make txt

rm -f lfssysdja-$VER-html.tar.bz2
tar cf - $VER-sysdja | bzip2 > lfssysdja-$VER-html.tar.bz2

rm -f lfssysdja-$VER.html.bz2
bzip2 lfssysdja-$VER.html
mv lfssysdja-$VER.html.bz2 lfssysdja-$VER-nochunks.html.bz2

rm -f lfssysdja-$VER.txt.bz2
bzip2 lfssysdja-$VER.txt

popd
