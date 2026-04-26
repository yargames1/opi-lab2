#!/bin/bash

# Create repo's dir
MAIN_BRANCH_NAME=$1
DIR=$2
WORKING_COPY=$3

# validation
[[ -z "$MAIN_BRANCH_NAME" ]] && {
    echo "Execute error: main branch name is required"
    exit 1
}
[[ -z "$DIR" ]] && {
    echo "Execute error: repository directory is required"
    exit 1
}
[[ -z "$WORKING_COPY" ]] && {
    echo "Execute error: working copy directory is required"
    exit 1
}

rm -rf "$DIR"
rm -rf "$WORKING_COPY"
mkdir "$DIR"
mkdir "$WORKING_COPY"

# initialize svn repo
svnadmin create "$DIR"

# create default structure
svn mkdir -m "Create standard structure" \
    "file://$(pwd)/$DIR/$MAIN_BRANCH_NAME" \
    "file://$(pwd)/$DIR/branches" \
    "file://$(pwd)/$DIR/tags"

# link working copy to repository
svn checkout "file://$(pwd)/$DIR/$MAIN_BRANCH_NAME" "WORKING_COPY"

# add .env file to ignore
cd "$WORKING_COPY" || exit 1

# save main branch name to .env
echo "MAIN_BRANCH_NAME=$MAIN_BRANCH_NAME" > ".svn/.main-branch"
echo "ACTIVE_USER=" > ".svn/.active-user"

svn propset svn:ignore ".svn/.main-branch"$'\n'".svn/.active-user" .