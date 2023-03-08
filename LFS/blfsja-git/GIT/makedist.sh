#!/bin/sh

pushd builddir

make dist-bzip2
#make pdf
#make txt

rm -f blfsbookja-git-html.tar.bz2
tar cf - git-ja | bzip2 > blfsbookja-git-html.tar.bz2

#rm -f lfsbookja-svn-nochunks.html.bz2
#bzip2 lfsbookja-svn.html
#mv lfsbookja-svn.html.bz2 lfsbookja-svn-nochunks.html.bz2

#rm -f lfsbookja-svn.txt.bz2
#bzip2 lfsbookja-svn.txt

popd
