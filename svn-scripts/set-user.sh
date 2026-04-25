#!/bin/bash

# params
user="${1:-user0}"
repository="${2:-repo}"

# save current user to .env file
echo "export SVN_AUTHOR=${user}" > "$repository/.env"

printf "\n"
echo "User ${user} saved as active"
printf "\n"