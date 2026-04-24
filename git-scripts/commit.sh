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

# check unresolved conflicts
if git ls-files -u | grep .; then
  echo "ERROR: Unresolved conflicts found!"
  git status
  exit 1
fi

# commit changes
git commit -m "${commitNum}"
echo "Commit ${commitNum} created"
printf "\n"