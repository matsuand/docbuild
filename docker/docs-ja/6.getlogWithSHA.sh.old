#!/bin/sh

SHA=$1
THISDIR=`pwd`

if test -z $SHA; then
  echo Get SHA from matsuand.github.io...

  wget -N https://matsuand.github.io/docker.docs-ja/index.html \
	--output-document index.html.tmp >/dev/null 2>&1

  if [ "$?" != "0" ]; then

    echo Cannot access matsuand.github.io
    exit 1

  fi

  # index.html から "暫定公開中" が記述されている行を抽出
  LINE=`grep 暫定公開中 index.html.tmp`

  # 上の行を ">" で改行した上で "対応" が記述されている行を抽出
  # 抽出結果は "<SHA値> 対応, yyyy/mm/dd</a>" といった単純文字列となる
  LINE1=`echo $LINE | sed -e "s/>/>\n/g" | grep 対応`

  # SHA値を抽出する
  SHA=`echo $LINE1 | sed -e "s/^\([0-9a-z]*\) 対応.*$/\1/"`

  rm -f index.html.tmp

else

  pushd /home/matsuand/src/docker/docs-ja/docs.orig >/dev/null

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
