#!/bin/bash
# get params
commitNum="${1:-r0}"
DIR="${2:-repo}"
cd "$DIR"|| exit 1
bash ../update-files.sh "${commitNum}"

echo "commit ${commitNum} created"