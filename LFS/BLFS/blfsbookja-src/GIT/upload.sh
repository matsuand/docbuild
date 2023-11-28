#!/bin/sh

BRANCH=GIT
NAME=blfsbookja-git

#cd /home/matsuand/build/LFS/blfsja-git/$BRANCH/builddir
#tar cf - svn-ja | bzip2 > $NAME-html.tar.bz2

cat > sftp.bat << EOF
cd /home/groups/l/lf/lfsbookja/htdocs/BLFS
lcd /home/matsuand/build/LFS/blfsja-git/__BRANCH__/builddir
put _N_-html.tar.bz2
quit
EOF
sed -i -e "s/__BRANCH__/$BRANCH/g" -e "s/_N_/$NAME/g" sftp.bat

echo SFTP html...
sftp -o "batchmode no" -b sftp.bat matsuand@shell.osdn.net

echo SSH html untar...
ssh shell.osdn.net "\
cd /home/groups/l/lf/lfsbookja/htdocs/BLFS; \
tar xf $NAME-html.tar.bz2; \
"

