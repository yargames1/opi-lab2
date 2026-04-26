#!/bin/bash

# params
WORKING_DIR=$1
FEATURE_BRANCH_NAME=$2
IS_FORCE="${3:-1}"

# validation
[[ -z "$WORKING_DIR" ]] && {
    echo "Execute error: working directory is required"
    exit 1
}
[[ -z "$FEATURE_BRANCH_NAME" ]] && {
    echo "Execute error: feature branch name is required"
    exit 1
}

# move to working directory
cd "$WORKING_DIR"|| exit 1

# load .main-branch if exists
if [ -f .svn/.main-branch ]; then
    source .svn/.main-branch
fi

svn update
# get repository URL
REPO_URL=$(svn info --show-item url | sed "s|/$MAIN_BRANCH_NAME$||" | sed 's|/branches/[^/]*$||')

if [ "$FEATURE_BRANCH_NAME" = "$MAIN_BRANCH_NAME" ]; then
  FEATURE_BRANCH_PATH="$REPO_URL/$MAIN_BRANCH_NAME"
else
  FEATURE_BRANCH_PATH="$REPO_URL/branches/$FEATURE_BRANCH_NAME"
fi

if [ "$IS_FORCE" -eq 0 ]; then

  svn export --force "$FEATURE_BRANCH_PATH" .
  svn add --force .
  svn status | grep '^!' | awk '{print $2}' | xargs svn delete --force 2>/dev/null || true

else
  # resolve conflicts manually
  svn merge "$FEATURE_BRANCH_PATH"

  if svn status | grep -q '^C'; then
    echo "Please resolve conflicts, then press Enter."
    read -r
  fi

  svn status | grep '^C' | awk '{print $2}' | while read -r file; do
    svn resolve --accept working "$file"
  done
fi