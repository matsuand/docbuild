#!/bin/sh

sed -i \
    -e "s@2023/12/02@2023/12/05@" \
    -e "s@r12.0.102@r12.0-110@g"  \
    index.html

sed -i \
    -e "s@2023/12/02@2023/12/05@" \
    -e "s@r12.0.102@r12.0-110@g"  \
    ja.index.html

