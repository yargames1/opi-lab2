#!/bin/bash

# params
commitNum="${1:-none}"
DIR="${2:-repo}"

# move to repo's dir
cd "$DIR"|| exit 1

# make changes
if [ "$commitNum" != "none" ]; then
  echo "Making some changes"
  cp -r ../../output/"${commitNum}"/* .
  git add .
fi

# commit changes
git commit -m "${commitNum}"
echo "Commit ${commitNum} created"
printf "\n"