#!/bin/bash

user="${1:-user0}"
repo="${2:-.}"

git -C "{$repo}" config user.name "${user}"
git -C "{$repo}" config user.email "${user}@mail.com"

echo "User ${user} set as active"