#!/bin/bash

# Create repo's dir
MAIN_BRANCH_NAME=$1
DIR=$2

# validation
[[ -z "$MAIN_BRANCH_NAME" ]] && {
    echo "Execute error: main branch name is required"
    exit 1
}
[[ -z "$DIR" ]] && {
    echo "Execute error: repository directory is required"
    exit 1
}

rm -rf "$DIR"
mkdir "$DIR"

# move to repo's dir
cd "$DIR" || exit 1

# initialize git repo
git init

# set main branch name
CURRENT_BRANCH=$(git branch --show-current)
if [ "$CURRENT_BRANCH" != "$MAIN_BRANCH_NAME" ]; then
    git branch -m "$CURRENT_BRANCH" "$MAIN_BRANCH_NAME"
fi