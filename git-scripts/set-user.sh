#!/bin/bash

# params
USER=$1
DIR=$2

# validation
[[ -z "$USER" ]] && {
    echo "Execute error: USER (name) is required"
    exit 1
}
[[ -z "$DIR" ]] && {
    echo "Execute error: repository directory is required"
    exit 1
}

git -C "$DIR" config USER.name "${USER}"
git -C "$DIR" config USER.email "${USER}@mail.com"

printf "\n"
echo "USER ${USER} set as active"
printf "\n"