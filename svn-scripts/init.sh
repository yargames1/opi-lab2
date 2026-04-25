#!/bin/bash

# Create repo's dir
DIR="${1:-repo}"
rm -rf "$DIR"
mkdir "$DIR"

# initialize svn repo
svnadmin create "$DIR"