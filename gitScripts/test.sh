#!/bin/bash
DIR="repo"
bash init.sh "$DIR" # r0
# r1
# Сделать ветку
# добавить файлы r1, сохранить изменения
echo "начинаем делать ветку"
ls
bash new-branch.sh test3 r1 "$DIR" 0 # r1
ls
# r2

# r3

# r4
# сменить ветку на main
# добавить файлы r4, сохранить изменения


read -p "Press Enter to exit..."