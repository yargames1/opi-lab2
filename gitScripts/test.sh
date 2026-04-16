#!/bin/bash
DIR="repo"
bash init.sh "$DIR"
echo "начинаем делать ветку"
ls
bash new-branch.sh test r1 "$DIR"

read -p "Press Enter to exit..."