#!/bin/bash

# params
COMMIT_NUM=$1
WORKING_DIR=$2

# validation
[[ -z "$COMMIT_NUM" ]] && {
    echo "Execute error: commit number is required"
    exit 1
}
[[ -z "$WORKING_DIR" ]] && {
    echo "Execute error: working directory is required"
    exit 1
}

# move to working copy
cd "$WORKING_DIR" || exit 1

# load active user if defined
if [ -f .svn/.active-user ]; then
    source .svn/.active-user
fi

# make changes
echo "Making some changes for ${COMMIT_NUM}"
cp -r ../../output/"${COMMIT_NUM}"/* . 2>/dev/null || true

# add new files
svn status | grep '^?' | awk '{print $2}' | xargs svn add 2>/dev/null || true

# delete files that no longer exist
svn status | grep '^!' | awk '{print $2}' | xargs svn delete 2>/dev/null || true

# check unresolved conflicts
if svn status | grep '^C' | grep .; then
    echo "ERROR: Unresolved conflicts found!"
    svn status
    exit 1
fi

# commit changes
svn commit -m "$COMMIT_NUM"

# set active user as author
if [ -n "$ACTIVE_USER" ]; then
    svn propset --revprop -r HEAD svn:author "$ACTIVE_USER" . 2>/dev/null || exit 1
fi

echo "Commit $COMMIT_NUM created by ${ACTIVE_USER:-system}"
printf "\n"