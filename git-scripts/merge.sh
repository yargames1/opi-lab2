#!/bin/bash

# params
DIR="${1:-repo}"
featureBranch="${2:-feature}"
isForce="${3:-1}"

# move to repo's dir
cd "$DIR"|| exit 1

if [ "$isForce" -eq 0 ]; then
  # force merge with ours changes
  git merge "${featureBranch}" -s ours --no-commit

else
  # resolve conflicts manually
  if ! git merge "${featureBranch}" --no-commit; then
    echo "Please resolve conflicts, then press Enter."
    read -r
  fi
fi