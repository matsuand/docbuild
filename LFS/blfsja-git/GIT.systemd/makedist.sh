#!/bin/sh

pushd builddir

make dist-bzip2
#make pdf
#make txt

rm -f blfssysdja-git-html.tar.bz2
tar cf - git-sysdja | bzip2 > blfssysdja-git-html.tar.bz2

#rm -f lfsbookja-svn-nochunks.html.bz2
#bzip2 lfsbookja-svn.html
#mv lfsbookja-svn.html.bz2 lfsbookja-svn-nochunks.html.bz2

#rm -f lfsbookja-svn.txt.bz2
#bzip2 lfsbookja-svn.txt

popd
