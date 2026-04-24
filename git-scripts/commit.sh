#!/bin/bash

# params
commitNum="${1:-r0}"
DIR="${2:-repo}"

# move to repo's dir
cd "$DIR"|| exit 1

# make changes
echo "Making some changes"
cp -r ../../output/"${commitNum}"/* .
git add .

# commit changes
git commit -m "${commitNum}"
echo "Commit ${commitNum} created"
printf "\n"