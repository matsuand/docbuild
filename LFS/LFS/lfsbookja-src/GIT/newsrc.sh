#!/bin/sh

SRCDIR=$HOME/src/LFS/LFS/lfsbookja-src/src

pushd ${SRCDIR} >/dev/null

if [ -e $1 ]; then
  echo Already exists: $1
  exit 1;
fi

cat > $1 << "EOF"
%
% This is part of LFSbookja package.
%
% This is a CTIE change file for the original XML source of the LFSbook.
%
EOF

git add $1

popd >/dev/null

