#!/bin/sh

sed -i \
    -e "s@2023/12/01@2023/12/02@" \
    -e "s@r12.0.100@r12.0-102@g"  \
    index.html

sed -i \
    -e "s@2023/12/01@2023/12/02@" \
    -e "s@r12.0.100@r12.0-102@g"  \
    ja.index.html

