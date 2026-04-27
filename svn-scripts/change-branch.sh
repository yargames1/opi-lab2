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

# get current branch URL
CURRENT_URL=$(svn info --show-item url)

# get repository root URL
REPO_ROOT=$(svn info --show-item repos-root-url)

# determine if this is main branch
if [ "$BRANCH_NAME" = "$MAIN_BRANCH_NAME" ]; then
    TARGET_URL="$REPO_ROOT/$MAIN_BRANCH_NAME"
else
    TARGET_URL="$REPO_ROOT/branches/$BRANCH_NAME"

    # create a new branch if needed
    if [ "$IS_EXISTS" -eq 0 ]; then
        svn copy "$CURRENT_URL" "$TARGET_URL" -m "Created branch '$BRANCH_NAME' from current branch"
        echo "Created new branch '$BRANCH_NAME' from current branch"
    fi
fi

# switch to a new branch
svn switch "$TARGET_URL"
echo "Switched to branch '$BRANCH_NAME'"