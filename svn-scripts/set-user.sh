#!/bin/bash

# params
USER=$1
WORKING_DIR=$2

# validation
[[ -z "$USER" ]] && {
    echo "Execute error: USER (name) is required"
    exit 1
}
[[ -z "$WORKING_DIR" ]] && {
    echo "Execute error: working directory is required"
    exit 1
}

# save current USER to .env file
echo "ACTIVE_USER=$USER" > "$WORKING_DIR/.svn/.active-user"

printf "\n"
echo "USER $USER saved as active"
printf "\n"