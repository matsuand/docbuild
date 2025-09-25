#!/bin/sh

SHA=$1

if test -z $SHA; then
  echo No argument
  exit 1
fi

pushd /home/matsuand/src/docker/docs-ja/docs.orig >/dev/null

git log $SHA -n 1 --oneline >/dev/null 2>&1
if [ "$?" != "0" ]; then
  echo SHA value not found: $SHA
  popd >/dev/null
  exit 1
else

  THISDIR=`pwd`

  git log -p $SHA..HEAD >$THISDIR/_5.1.log
  git log --name-status --oneline --no-commit-id $SHA..HEAD >$THISDIR/_5.2.log

  popd >/dev/null

  echo output _5.{1,2}.log in this directory

fi
