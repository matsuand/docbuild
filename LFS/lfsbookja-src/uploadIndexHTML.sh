#!/bin/sh

cat > sftp.bat << EOF
cd /home/groups/l/lf/lfsbookja/htdocs
put index.html
put en.index.html
quit
EOF

echo SFTP html...
sftp -o "batchmode no" -b sftp.bat matsuand@shell.osdn.net

rm -f sftp.bat
