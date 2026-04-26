#!/bin/bash

# ask user to select execution params with validation
ask_with_validation() {
    local prompt="$1"
    local var_name="$2"
    local validation_func="$3"
    local error_msg="$4"
    local value=""

    while true; do
        echo -n "$prompt"
        read -r value
        if eval "$validation_func \"$value\""; then
            eval "$var_name=\"$value\""
            break
        else
            echo "$error_msg"
        fi
    done
}

# render gif
play_infinite_gif() {
    local gif="$1"
    local temp="/tmp/gif_$$"

    mkdir -p "$temp"
    convert -coalesce "$gif" "$temp/frame_%04d.png" 2>/dev/null

    frames=("$temp"/frame_*.png)

    tput civis
    while true; do
        for frame in "${frames[@]}"; do
            clear
            jp2a --width=60 --colors --background=dark "$frame" 2>/dev/null
            sleep 0.02
        done
    done
}

# cleanup on interrupt
cleanup() {
    tput cnorm
    rm -rf "$temp"
    clear
    exit 0
}
trap cleanup INT TERM

# validation functions
validate_version_control() {
    local vc="$1"
    [[ "$vc" == "git" || "$vc" == "svn" ]]
}

validate_not_empty() {
    [[ -n "$1" ]]
}

validate_force_mode() {
    [[ "$1" == "0" || "$1" == "1" ]]
}

validate_different_dirs() {
    local repo="$1"
    local working="$2"
    [[ "$repo" != "$working" ]]
}

# clear screen
clear
tput cnorm

echo "========================================="
echo "  Интерактивный запуск сценария SVN/Git  "
echo "========================================="

# version control select
ask_with_validation \
    "Выберите систему контроля версий (git/svn): " \
    "VERSION_CONTROL" \
    "validate_version_control" \
    "Неверный формат ввода. Пожалуйста, введите 'git' или 'svn':"

# show art based on selection
echo ""
jp2a --width=40 "assets/$VERSION_CONTROL.png"
echo ""

echo "✓ Выбрано: $VERSION_CONTROL"

# main branch select
echo -n "Введите имя главной ветки (например, main/master/trunk): "
read -r MAIN_BRANCH_NAME
while [[ -z "$MAIN_BRANCH_NAME" ]]; do
    echo -n "Имя главной ветки не может быть пустым. Введите имя: "
    read -r MAIN_BRANCH_NAME
done
echo "✓ Главная ветка: $MAIN_BRANCH_NAME"

# merging mode
ask_with_validation \
    "Выберите режим разрешения конфликтов (0 - автоматический, 1 - ручной): " \
    "IS_FORCE" \
    "validate_force_mode" \
    "Неверный формат. Введите 0 (автоматически) или 1 (ручной):"
echo "✓ Режим: $([ "$IS_FORCE" -eq 0 ] && echo "автоматический" || echo "ручной")"

# repository directory name
echo -n "Введите имя папки репозитория (по умолчанию: repo): "
read -r REPO_DIR
REPO_DIR="${REPO_DIR:-repo}"
echo "✓ Папка репозитория: $REPO_DIR"

# working copy directory name (for svn)
WORKING_DIR=""
if [[ "$VERSION_CONTROL" == "svn" ]]; then
    echo -n "Введите имя рабочей копии (по умолчанию: working_copy): "
    read -r WORKING_DIR
    WORKING_DIR="${WORKING_DIR:-working_copy}"

    # check if directories are the same
    while [[ "$REPO_DIR" == "$WORKING_DIR" ]]; do
        echo "✗ Ошибка: папка репозитория и рабочая копия не могут быть одинаковыми!"
        echo -n "Введите другое имя для рабочей копии: "
        read -r WORKING_DIR
        WORKING_DIR="${WORKING_DIR:-working_copy}"
    done
    echo "✓ Рабочая копия: $WORKING_DIR"
else
    echo "Для Git рабочая директория совпадает с репозиторием."
fi

# confirm selection
echo "========================================="
echo "Параметры для запуска:"
echo "  Система: $VERSION_CONTROL"
echo "  Главная ветка: $MAIN_BRANCH_NAME"
echo "  Режим: $([ "$IS_FORCE" -eq 0 ] && echo "автоматический" || echo "ручной")"
echo "  Репозиторий: $REPO_DIR"
[[ -n "$WORKING_DIR" ]] && echo "  Рабочая копия: $WORKING_DIR"
echo "========================================="

echo -n "Запустить? (y/n): "
read -r confirm
if [[ "$confirm" != "y" && "$confirm" != "Y" ]]; then
    echo "Отменено."
    exit 0
fi

# run main.sh with provided params
echo ""
echo "Запуск main.sh..."
echo "========================================="

if [[ -n "$WORKING_DIR" ]]; then
    bash main.sh "$VERSION_CONTROL" "$MAIN_BRANCH_NAME" "$IS_FORCE" "$REPO_DIR" "$WORKING_DIR"
else
    bash main.sh "$VERSION_CONTROL" "$MAIN_BRANCH_NAME" "$IS_FORCE" "$REPO_DIR"
fi

exit_code=$?

# display end of execution
echo ""
echo "========================================="
if [[ $exit_code -eq 0 ]]; then
    echo "✓ Скрипт выполнен успешно!"
    echo "Спасибо за ожидание <3"

    # Play funny GIF
    play_infinite_gif "assets/cat-rotating.gif"
else
    echo "✗ Скрипт завершился с ошибкой (код $exit_code)"
fi

exit $exit_code