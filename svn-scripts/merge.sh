#!/bin/bash

# params
DIR=$1
FEATURE_BRANCH=$2
IS_FORCE="${3:-1}"

# validation
[[ -z "$DIR" ]] && {
    echo "Execute error: repository directory is required"
    exit 1
}
[[ -z "$FEATURE_BRANCH" ]] && {
    echo "Execute error: feature branch name is required"
    exit 1
}

# move to repo's dir
cd "$DIR"|| exit 1

svn update

if [ "$IS_FORCE" -eq 0 ]; then
  # force merge with ours changes
  svn merge "$FEATURE_BRANCH"

  svn status | grep '^C' | awk '{print $2}' | while read -r file; do
    svn resolve --accept mine-full "$file"
  done

else
  # resolve conflicts manually
  if svn status | grep -q '^C'; then
    echo "Please resolve conflicts, then press Enter."
    read -r
  fi

  svn status | grep '^C' | awk '{print $2}' | while read -r file; do
    svn resolve --accept working "$file"
  done
fi