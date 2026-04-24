#!/bin/bash

# params
DIR="${1:-repo}"
featureBranch="${2:-feature}"
isForce="${3:-1}"

# move to repo's dir
cd "$DIR"|| exit 1

# force merge with ours changes
if [ "$isForce" -eq 0 ]; then
  git merge "${featureBranch}" -s ours --no-commit
fi

# resolve conflicts manually
if ! git merge "${featureBranch}" --no-commit; then
  echo "Merge conflict detected."
  echo "Please resolve conflicts, then press Enter."
  read -r
fi