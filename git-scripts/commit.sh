#!/bin/bash

# params
COMMIT_NUM=$1
DIR=$2

# validation
[[ -z "$COMMIT_NUM" ]] && {
    echo "Execute error: commit number is required"
    exit 1
}
[[ -z "$DIR" ]] && {
    echo "Execute error: repository directory is required"
    exit 1
}

# move to repo's dir
cd "$DIR"|| exit 1

# make changes
  echo "Making some changes"
  cp -r ../../output/"${COMMIT_NUM}"/* .
  git add .

# check unresolved conflicts
if git ls-files -u | grep .; then
  echo "ERROR: Unresolved conflicts found!"
  git status
  exit 1
fi

# commit changes
git commit -m "${COMMIT_NUM}"
echo "Commit ${COMMIT_NUM} created"
printf "\n"