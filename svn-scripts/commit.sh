#!/bin/bash

# params
commitNum="${1:-r0}"
DIR="${2:-working_copy}"

# move to working copy
cd "$DIR" || exit 1

# load active user if exists
if [ -f .env ]; then
    source .env
fi

# make changes
echo "Making some changes for ${commitNum}"
cp -r ../../output/"${commitNum}"/* . 2>/dev/null || true

# add new files
svn add --force . 2>/dev/null || true

# delete files that no longer exist
svn status | grep '^!' | awk '{print $2}' | xargs svn delete 2>/dev/null || true

# check unresolved conflicts (проверка конфликтов в SVN)
if svn status | grep '^C' | grep .; then
    echo "ERROR: Unresolved conflicts found!"
    svn status
    exit 1
fi

# commit changes
svn commit -m "${commitNum}"

# set active user as author
if [ -n "$SVN_AUTHOR" ]; then
    svn propset --revprop -r HEAD svn:author "$SVN_AUTHOR" . 2>/dev/null || true
fi

echo "Commit ${commitNum} created by ${SVN_AUTHOR:-system}"
printf "\n"