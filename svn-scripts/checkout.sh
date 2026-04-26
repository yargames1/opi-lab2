#!/bin/bash

# params
BRANCH_NAME=$1
WORKING_DIR=$2
IS_EXISTS="${3:-1}"

# validation
[[ -z "$BRANCH_NAME" ]] && {
    echo "Execute error: branch name is required"
    exit 1
}
[[ -z "$WORKING_DIR" ]] && {
    echo "Execute error: working directory is required"
    exit 1
}

cd "$WORKING_DIR" || exit 1

# load .main-branch if exists
if [ -f .svn/.main-branch ]; then
    source .svn/.main-branch
fi

# get repository directory
REPO_DIR=$(svn info --show-item url | sed 's|/trunk$||' | sed 's|/branches/[^/]*$||')

# determine if this is main branch
if [ "$BRANCH_NAME" = "$MAIN_BRANCH_NAME" ]; then
    BRANCH_PATH="$MAIN_BRANCH_NAME"
else
    BRANCH_PATH="branches/$BRANCH_NAME"

    # create a new branch if needed
    if [ "$IS_EXISTS" -eq 0 ]; then
        svn copy "$REPO_DIR/trunk" "$REPO_DIR/branches/$BRANCH_NAME" -m "Created branch '$BRANCH_NAME'"
        echo "Created new branch '$BRANCH_NAME'"
    fi
fi

# switch to a new branch
svn switch "$REPO_DIR/$BRANCH_PATH"
echo "Switched to branch '$BRANCH_NAME'"