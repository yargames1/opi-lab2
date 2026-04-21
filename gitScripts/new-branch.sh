#!/bin/bash
# get params
branchname="${1:-newBranch}"
commitnum="${2:-r0}"
DIR="${3:-repo}"

echo "в ветке"
ls
cd "$DIR"|| exit 1
# create new branch
git branch "${branchname}"
echo "git branch ${branchname}"
git checkout "${branchname}"
# add changes
ls
cd ../
bash update-files.sh "${commitnum}" "$DIR"
cd "$DIR"|| exit 1
# commit changes
ls
git commit -m "${commitnum}"

echo "new branch created, commit ${commitnum} created"