#!/bin/bash
# get params
commitnum="${1:-r0}"
DIR="${2:-repo}"
echo "добавляем новые файды"
ls
# clear dir
rm -rf "$DIR"
ls
mkdir "$DIR"
ls
# upload new files
cp -r ../output/"${commitnum}"/* "$DIR"