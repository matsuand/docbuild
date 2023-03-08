#!/bin/sh

BRANCH=GIT.systemd
NAME=lfssysdja-git

cd /home/matsuand/build/LFS/lfsja-git/$BRANCH/builddir

cat > sftp.bat << EOF
cd /home/groups/l/lf/lfsbookja/htdocs/git-sysdja
lcd /home/matsuand/build/LFS/lfsja-git/__BRANCH__/builddir
put _N_.pdf
cd ..
put _N_.txt.bz2
put _N_-html.tar.bz2
put _N_-nochunks.html.bz2
quit
EOF
sed -i -e "s/__BRANCH__/$BRANCH/g" -e "s/_N_/$NAME/g" sftp.bat

echo SFTP html...
sftp -o "batchmode no" -b sftp.bat matsuand@shell.osdn.net

echo SSH html untar...
ssh shell.osdn.net "\
cd /home/groups/l/lf/lfsbookja/htdocs; \
tar xf $NAME-html.tar.bz2; \
bunzip2 -c $NAME-nochunks.html.bz2 > git-sysdja/$NAME-nochunks.html
"
