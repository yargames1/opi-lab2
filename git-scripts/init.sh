#!/bin/bash

# Create repo's dir
DIR="${1:-repo}"
rm -rf "$DIR"
mkdir "$DIR"

# move to repo's dir
cd "$DIR" || exit 1

# initialize git repo
git init
