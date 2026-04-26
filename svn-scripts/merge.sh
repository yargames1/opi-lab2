#!/bin/bash

# params
WORKING_DIR=$1
FEATURE_BRANCH=$2
IS_FORCE="${3:-1}"

# validation
[[ -z "$WORKING_DIR" ]] && {
    echo "Execute error: working directory is required"
    exit 1
}
[[ -z "$FEATURE_BRANCH" ]] && {
    echo "Execute error: feature branch name is required"
    exit 1
}

# move to working directory
cd "$WORKING_DIR"|| exit 1

svn update
# get repository URL
REPO_URL=$(svn info --show-item url | sed 's|/trunk$||' | sed 's|/branches/[^/]*$||')

if [ "$FEATURE_BRANCH" = "$MAIN_BRANCH" ]; then
  FEATURE_BRANCH_PATH="$REPO_URL/$MAIN_BRANCH"
else
  FEATURE_BRANCH_PATH="$REPO_URL/branches/$FEATURE_BRANCH"
fi

if [ "$IS_FORCE" -eq 0 ]; then
  echo "Force merge enabled, exporting changes from '$FEATURE_BRANCH'"

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