#!/bin/bash

# Create repo's dir
DIR=$1

# validation
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
