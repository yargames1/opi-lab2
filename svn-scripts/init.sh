#!/bin/bash

# Create repo's dir
DIR=$1
WORKING_COPY=$2

# validation
[[ -z "$DIR" ]] && {
    echo "Execute error: repository directory is required"
    exit 1
}
[[ -z "$WORKING_COPY" ]] && {
    echo "Execute error: working copy directory is required"
    exit 1
}

mkdir "$DIR"
mkdir "$WORKING_COPY"

# initialize svn repo
svnadmin create "$DIR"

# link working copy to repository
svn checkout "file://$(pwd)/$DIR" "$WORKING_COPY"

# add .env file to ignore
cd "$WORKING_COPY" || exit 1
svn propset svn:ignore ".env" . || true