#!/bin/sh

sed -i \
    -e "s@2023/12/05@2023/12/15@" \
    -e "s@r12.0.110@r12.0-115@g"  \
    index.html

sed -i \
    -e "s@2023/12/05@2023/12/15@" \
    -e "s@r12.0.110@r12.0-115@g"  \
    ja.index.html

