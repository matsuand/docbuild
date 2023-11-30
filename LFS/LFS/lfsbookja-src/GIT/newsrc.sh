#!/bin/sh

SRCDIR=$HOME/src/LFS/LFS/lfsbookja-src/src

if [ -e ${SRCDIR}/$1 ]; then
  echo Already exists: $1
  exit 1;
fi

cat > ${SRCDIR}/$1 << "EOF"
%
% This is part of LFSbookja package.
%
% This is a CTIE change file for the original XML source of the LFSbook.
%
EOF

git add ${SRCDIR}/$1
