#!/bin/bash
DIR="repo"
bash init.sh "$DIR" # r0
echo "начинаем делать ветку"
ls
bash new-branch.sh test3 r1 "$DIR" # r1
ls
# r2

# r3

# r4



read -p "Press Enter to exit..."