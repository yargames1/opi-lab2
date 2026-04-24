#!/bin/bash
# get params
commitNum="${1:-r0}"
DIR="${2:-repo}"
cd "$DIR"|| exit 1

echo "Making some changes"

# clear dir
git clean -fdx
# upload new files
cp -r ../../output/"${commitNum}"/* .
git add .
# commit changes
git commit -m "${commitNum}"

echo "Commit ${commitNum} created"