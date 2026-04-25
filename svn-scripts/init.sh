#!/bin/bash

# Create repo's dir
DIR=$1
workingCopy=$2

mkdir "$DIR"
mkdir "$workingCopy"

# initialize svn repo
svnadmin create "$DIR"

# link working copy to repository
svn checkout "file://$(pwd)/$DIR" "$workingCopy"

# add .env file to ignore
cd "$workingCopy" || exit 1
svn propset svn:ignore ".env" . || true