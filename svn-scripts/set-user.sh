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

# save current USER to .env file
echo "SVN_AUTHOR=${USER}" > "$DIR/.env"

printf "\n"
echo "USER ${USER} saved as active"
printf "\n"