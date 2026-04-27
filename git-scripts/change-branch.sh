#!/bin/bash

# params
BRANCH_NAME=$1
DIR=$2
IS_EXISTS="${3:-1}"

# validation
[[ -z "$BRANCH_NAME" ]] && {
    echo "Execute error: branch name is required"
    exit 1
}
[[ -z "$DIR" ]] && {
    echo "Execute error: repository param is required"
    exit 1
}

# move to repo's dir
cd "$DIR"|| exit 1

# create a new branch
if [ "$IS_EXISTS" -eq 0 ]; then
  git branch "${BRANCH_NAME}"
  echo "Created new branch '${BRANCH_NAME}'"
fi

# checkout
git checkout "${BRANCH_NAME}"