#!/bin/bash

# Create repo's dir
MAIN_BRANCH_NAME=$1
REPO_DIR=$2
WORKING_DIR=$3

# validation
[[ -z "$MAIN_BRANCH_NAME" ]] && {
    echo "Execute error: main branch name is required"
    exit 1
}
[[ -z "$REPO_DIR" ]] && {
    echo "Execute error: repository directory is required"
    exit 1
}
[[ -z "$WORKING_DIR" ]] && {
    echo "Execute error: working directory is required"
    exit 1
}

rm -rf "$REPO_DIR"
rm -rf "$WORKING_DIR"
mkdir "$REPO_DIR"
mkdir "$WORKING_DIR"

# initialize svn repo
svnadmin create "$REPO_DIR"

# create default structure
svn mkdir -m "Create standard structure" \
    "file://$(pwd)/$REPO_DIR/$MAIN_BRANCH_NAME" \
    "file://$(pwd)/$REPO_DIR/branches" \
    "file://$(pwd)/$REPO_DIR/tags"

# link working copy to repository
svn checkout "file://$(pwd)/$REPO_DIR/$MAIN_BRANCH_NAME" "$WORKING_DIR"

# add .env file to ignore
cd "$WORKING_DIR" || exit 1

# save main branch name
echo "MAIN_BRANCH_NAME=$MAIN_BRANCH_NAME" > ".svn/.main-branch"
echo "ACTIVE_USER=" > ".svn/.active-user"

svn propset svn:ignore ".svn/.main-branch"$'\n'".svn/.active-user" .