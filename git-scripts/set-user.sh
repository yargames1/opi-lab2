#!/bin/bash

# params
user="${1:-user0}"
repository="${2:-.}"

git -C "$repository" config user.name "${user}"
git -C "$repository" config user.email "${user}@mail.com"

printf "\n"
echo "User ${user} set as active"
printf "\n"