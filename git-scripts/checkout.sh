#!/bin/bash

# params
branchName="${1:-newBranch}"
DIR="${2:-repo}"
isExist="${3:-1}"

# move to repo's dir
cd "$DIR"|| exit 1

# create new branch
if [ "$isExist" -eq 0 ]; then
  git branch "${branchName}"
  echo "Created new branch '${branchName}'"
fi

# checkout
git checkout "${branchName}"