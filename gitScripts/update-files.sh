#!/bin/bash
# get params
commitNum="${1:-r0}"

echo "добавляем новые файлы"

# clear dir
git clean -fdx
# upload new files
cp -r ../../output/"${commitNum}"/* .
git add .
# commit changes
git commit -m "${commitNum}"