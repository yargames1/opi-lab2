#!/bin/bash
# get params
commitnum="${1:-r0}"

echo "добавляем новые файды"
ls
# clear dir
git clean -fdx
# upload new files
cp -r ../../output/"${commitnum}"/* .
git add .