#!/bin/sh

sed -i \
    -e "s@2025/11/02@2025/11/08@" \
    -e "s@r12.4-38@r12.4-44@g"  \
    index.html

sed -i \
    -e "s@2025/11/02@2025/11/08@" \
    -e "s@r12.4-38@r12.4-44@g"  \
    ja.index.html
