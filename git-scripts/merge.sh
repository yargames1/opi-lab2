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

if [ "$IS_FORCE" -eq 0 ]; then
  # force merge with ours changes
  git merge "${FEATURE_BRANCH}" -s ours --no-commit

else
  # resolve conflicts manually
  if ! git merge "${FEATURE_BRANCH}" --no-commit; then
    echo "Please resolve conflicts, then press Enter."
    read -r
  fi
fi