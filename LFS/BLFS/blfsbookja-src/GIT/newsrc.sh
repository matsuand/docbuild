#!/bin/sh

SRCDIR=$HOME/src/LFS/BLFS/blfsbookja-src/src

if [ -e ${SRCDIR}/$1 ]; then
  echo Already exists: $1
  exit 1;
fi

cat > ${SRCDIR}/$1 << "EOF"
%
% This is part of BLFSbookja package.
%
% This is a CTIE change file for the original XML source of the BLFSbook.
%
EOF

#git add ${SRCDIR}/$1
