#!/bin/bash

# params
BRANCH_NAME=$1
WORKING_COPY=$2
IS_EXISTS="${3:-1}"

# validation
[[ -z "$BRANCH_NAME" ]] && {
    echo "Execute error: branch name is required"
    exit 1
}
[[ -z "$WORKING_COPY" ]] && {
    echo "Execute error: working copy param is required"
    exit 1
}

cd "$WORKING_COPY" || exit 1

# load .main-branch if exists
if [ -f .svn/.main-branch ]; then
    source .svn/.main-branch
fi

# get repository directory
REPO_URL=$(svn info --show-item url | sed 's|/trunk$||' | sed 's|/branches/[^/]*$||')

# determine if this is main branch
if [ "$BRANCH_NAME" = "$MAIN_BRANCH_NAME" ]; then
    BRANCH_PATH="$MAIN_BRANCH_NAME"
else
    BRANCH_PATH="branches/$BRANCH_NAME"

    # create a new branch if needed
    if [ "$IS_EXISTS" -eq 0 ]; then
        svn copy "$REPO_URL/trunk" "$REPO_URL/branches/$BRANCH_NAME" -m "Created branch '$BRANCH_NAME'"
        echo "Created new branch '$BRANCH_NAME'"
    fi
fi

# switch to a new branch
svn switch "$REPO_URL/$BRANCH_PATH"
echo "Switched to branch '$BRANCH_NAME'"