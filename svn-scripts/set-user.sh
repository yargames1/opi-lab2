#!/bin/bash

# params
user=$1
DIR=$2

# save current user to .env file
echo "SVN_AUTHOR=${user}" > "$DIR/.env"

printf "\n"
echo "User ${user} saved as active"
printf "\n"