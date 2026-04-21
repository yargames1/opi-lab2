#!/bin/bash
# get params
branchName="${1:-newBranch}"
commitNum="${2:-r0}"
DIR="${3:-repo}"
isExist="${4:-1}"

cd "$DIR"|| exit 1
# create new branch
if [ "$isExist" -eq 0 ]; then
  git branch "${branchName}"
  echo "git branch ${branchName}"
fi

# checkout
git checkout "${branchName}"

# add changes
bash ../update-files.sh "${commitNum}"

echo "new branch created, commit ${commitNum} created"