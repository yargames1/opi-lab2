#!/bin/bash
# get params
commitNum="${2:-r0}"
DIR="${3:-repo}"

cd "$DIR"|| exit 1

bash ../update-files.sh "${commitNum}" "$DIR"

echo "commit ${commitNum} created"