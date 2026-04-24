#!/bin/bash
# Create repository folder
DIR="${1:-repo}"
rm -rf "$DIR"
mkdir "$DIR"
cd "$DIR" || exit 1

# Initialize git repo
git init
