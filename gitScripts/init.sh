#!/bin/bash
# Create repository folder
DIR="repo"
rm -rf "$DIR"
mkdir "$DIR"
cd "$DIR" || exit 1

# Initialize git repo
git init

# Set new user for feature actions
bash ../set-user.sh "Yaroslav"

# Create commit
cp -r ../../output/commit0/* .
git add .
git commit -m "r0"