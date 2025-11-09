#!/bin/sh

SRCDIR=/home/matsuand/src/docker/docs-ja
SHA=$1
THISDIR=`pwd`

if test -z $SHA; then
  echo Get SHA from release branch...

  pushd $SRCDIR >/dev/null

  CURRBRANCH=`git branch | grep ^* | sed "s/\* //"`

  git switch release >/dev/null 2>&1 # エラー想定なし

  SHA=`cat .git/modules/docs.orig/HEAD`

  git switch $CURRBRANCH >/dev/null 2>&1

  popd >/dev/null

else

  pushd $SRCDIR/docs.orig >/dev/null

  git log $SHA -n 1 --oneline >/dev/null 2>&1
  if [ "$?" != "0" ]; then
    echo SHA value not found: $SHA
    popd >/dev/null
    exit 1
  fi

  popd >/dev/null

fi

pushd /home/matsuand/src/docker/docs-ja/docs.orig >/dev/null

git log -p $SHA..HEAD >$THISDIR/_5.1.log
git log --name-status --oneline --no-commit-id $SHA..HEAD >$THISDIR/_5.2.log

popd >/dev/null

echo \$SHA is $SHA
echo output _5.{1,2}.log in this directory
