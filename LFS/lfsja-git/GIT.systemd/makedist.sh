#!/bin/sh

pushd builddir

make dist-bzip2
make pdf
make txt

rm -f lfssysdja-git-html.tar.bz2
tar cf - git-sysdja | bzip2 > lfssysdja-git-html.tar.bz2

rm -f lfssysdja-git.html.bz2
bzip2 lfssysdja-git.html
mv lfssysdja-git.html.bz2 lfssysdja-git-nochunks.html.bz2

rm -f lfssysdja-git.txt.bz2
bzip2 lfssysdja-git.txt

popd
