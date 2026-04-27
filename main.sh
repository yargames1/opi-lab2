#!/bin/bash

# params
VERSION_CONTROL=$1 # git / svn
MAIN_BRANCH_NAME=$2 # main branch default name
IS_FORCE=$3 # 0 for force, 1 for manual
REPO_DIR=$4 # source to repo directory
WORKING_DIR=$5 # source to working directory (same as repo for git)

# exit on any error occurred
set -e

# validation
[[ -z "$VERSION_CONTROL" ]] && {
    echo "Execute error: version control is required (svn/git)"
    exit 1
}
[[ -z "$MAIN_BRANCH_NAME" ]] && {
    echo "Execute error: main branch name is required"
    exit 1
}
[[ -z "$IS_FORCE" ]] && {
    echo "Execute error: force mode param is required (0 - force, 1 - manual)"
    exit 1
}
[[ -z "$REPO_DIR" ]] && {
    echo "Execute error: repository directory is required"
    exit 1
}
[[ "$VERSION_CONTROL" == "svn" && -z "$WORKING_DIR" ]] && {
    echo "Execute error: working copy directory is required"
    exit 1
}

# change current directory to specified version control
cd "$VERSION_CONTROL-scripts"

# init
bash init.sh "$MAIN_BRANCH_NAME" "$REPO_DIR" "$WORKING_DIR"

# set active dir as working dir for svn / repo dir for git
if [[ -n "$WORKING_DIR" ]]; then
    DIR="$WORKING_DIR"
else
    DIR="$REPO_DIR"
fi

# r0
bash set-user.sh "Yaroslav" "$DIR"
bash commit.sh r0 "$DIR"

# r1
bash change-branch.sh red-bottom "$DIR" 0
bash commit.sh r1 "$DIR"

# r2
bash set-user.sh "Maksim" "$DIR"
bash change-branch.sh blue-center "$DIR" 0
bash commit.sh r2 "$DIR"

# r3
bash commit.sh r3 "$DIR"

# r4
bash set-user.sh "Yaroslav" "$DIR"
bash change-branch.sh "$MAIN_BRANCH_NAME" "$DIR"
bash commit.sh r4 "$DIR"

# r5
bash set-user.sh "Maksim" "$DIR"
bash change-branch.sh blue-top "$DIR" 0
bash commit.sh r5 "$DIR"

# r6
bash set-user.sh "Yaroslav" "$DIR"
bash change-branch.sh red-top "$DIR" 0
bash commit.sh r6 "$DIR"

# r7
bash change-branch.sh red-center "$DIR" 0
bash commit.sh r7 "$DIR"

# r8
bash set-user.sh "Maksim" "$DIR"
bash change-branch.sh blue-top "$DIR"
bash commit.sh r8 "$DIR"

# r9
bash commit.sh r9 "$DIR"

# r10
bash set-user.sh "Yaroslav" "$DIR"
bash change-branch.sh red-bottom "$DIR"
bash commit.sh r10 "$DIR"

# r11
bash set-user.sh "Maksim" "$DIR"
bash change-branch.sh blue-center "$DIR"
bash commit.sh r11 "$DIR"

# r12
bash set-user.sh "Yaroslav" "$DIR"
bash change-branch.sh "$MAIN_BRANCH_NAME" "$DIR"
bash commit.sh r12 "$DIR"

# r13
bash set-user.sh "Maksim" "$DIR"
bash change-branch.sh blue-center "$DIR"
bash commit.sh r13 "$DIR"

# r14
bash set-user.sh "Yaroslav" "$DIR"
bash change-branch.sh "$MAIN_BRANCH_NAME" "$DIR"
bash commit.sh r14 "$DIR"

# r15
bash set-user.sh "Maksim" "$DIR"
bash change-branch.sh blue-bottom "$DIR" 0
bash commit.sh r15 "$DIR"

# r16
bash change-branch.sh blue-top "$DIR"
bash commit.sh r16 "$DIR"

# r17
bash set-user.sh "Yaroslav" "$DIR"
bash change-branch.sh "$MAIN_BRANCH_NAME" "$DIR"
bash commit.sh r17 "$DIR"

# r18
bash commit.sh r18 "$DIR"

# r19
bash set-user.sh "Maksim" "$DIR"
bash change-branch.sh blue-bottom "$DIR"
bash commit.sh r19 "$DIR"

# r20
bash set-user.sh "Yaroslav" "$DIR"
bash change-branch.sh red-center "$DIR"
bash commit.sh r20 "$DIR"

# r21
bash set-user.sh "Maksim" "$DIR"
bash change-branch.sh blue-top "$DIR"
bash commit.sh r21 "$DIR"

# r22
bash change-branch.sh blue-bottom "$DIR"
bash commit.sh r22 "$DIR"

# r23
bash set-user.sh "Yaroslav" "$DIR"
bash change-branch.sh red-center "$DIR"
bash commit.sh r23 "$DIR"

# r24
bash set-user.sh "Maksim" "$DIR"
bash change-branch.sh blue-top "$DIR"
bash commit.sh r24 "$DIR"

# r25
bash set-user.sh "Yaroslav" "$DIR"
bash change-branch.sh red-center "$DIR"
bash commit.sh r25 "$DIR"

# r26
bash set-user.sh "Maksim" "$DIR"
bash change-branch.sh blue-bottom "$DIR"
bash commit.sh r26 "$DIR"

# r27
bash change-branch.sh blue-top "$DIR"
bash commit.sh r27 "$DIR"

# r28
bash commit.sh r28 "$DIR"

# r29
bash set-user.sh "Yaroslav" "$DIR"
bash change-branch.sh red-center "$DIR"
bash commit.sh r29 "$DIR"

# r30
bash change-branch.sh red-bottom "$DIR"
bash commit.sh r30 "$DIR"

# r31
bash change-branch.sh red-top "$DIR"
bash commit.sh r31 "$DIR"

# r32
bash set-user.sh "Maksim" "$DIR"
bash change-branch.sh blue-bottom "$DIR"
bash commit.sh r32 "$DIR"

# r33
bash set-user.sh "Yaroslav" "$DIR"
bash change-branch.sh red-bottom "$DIR"
bash commit.sh r33 "$DIR"

# r34
bash set-user.sh "Maksim" "$DIR"
bash change-branch.sh blue-top "$DIR"
bash commit.sh r34 "$DIR"

# r35
bash set-user.sh "Yaroslav" "$DIR"
bash change-branch.sh "$MAIN_BRANCH_NAME" "$DIR"
bash commit.sh r35 "$DIR"

# r36
bash set-user.sh "Maksim" "$DIR"
bash change-branch.sh blue-center "$DIR"
bash commit.sh r36 "$DIR"

# r37
bash change-branch.sh blue-bottom "$DIR"
bash commit.sh r37 "$DIR"

# r38
bash change-branch.sh blue-center "$DIR"
bash merge.sh "$DIR" blue-bottom "$IS_FORCE"
bash commit.sh r38 "$DIR" 0

# r39
bash set-user.sh "Yaroslav" "$DIR"
bash change-branch.sh red-top "$DIR"
bash commit.sh r39 "$DIR"

# r40
bash change-branch.sh red-center "$DIR"
bash commit.sh r40 "$DIR"

# r41
bash change-branch.sh red-top "$DIR"
bash commit.sh r41 "$DIR"

# r42
bash change-branch.sh red-center "$DIR"
bash commit.sh r42 "$DIR"

# r43
bash change-branch.sh red-top "$DIR"
bash commit.sh r43 "$DIR"

# r44
bash set-user.sh "Maksim" "$DIR"
bash change-branch.sh blue-center "$DIR"
bash merge.sh "$DIR" red-top "$IS_FORCE"
bash commit.sh r44 "$DIR"

# r45
bash set-user.sh "Yaroslav" "$DIR"
bash change-branch.sh "$MAIN_BRANCH_NAME" "$DIR"
bash commit.sh r45 "$DIR"

# r46
bash change-branch.sh red-bottom "$DIR"
bash commit.sh r46 "$DIR"

# r47
bash change-branch.sh "$MAIN_BRANCH_NAME" "$DIR"
bash merge.sh "$DIR" red-bottom "$IS_FORCE"
bash commit.sh r47 "$DIR"

# r48
bash set-user.sh "Maksim" "$DIR"
bash change-branch.sh blue-center "$DIR"
bash commit.sh r48 "$DIR"

# r49
bash set-user.sh "Yaroslav" "$DIR"
bash change-branch.sh red-center "$DIR"
bash merge.sh "$DIR" blue-center "$IS_FORCE"
bash commit.sh r49 "$DIR"

# r50
bash set-user.sh "Maksim" "$DIR"
bash change-branch.sh blue-top "$DIR"
bash merge.sh "$DIR" red-center "$IS_FORCE"
bash commit.sh r50 "$DIR"

# r51
bash commit.sh r51 "$DIR"

# r52
bash set-user.sh "Yaroslav" "$DIR"
bash change-branch.sh "$MAIN_BRANCH_NAME" "$DIR"
bash merge.sh "$DIR" blue-top "$IS_FORCE"
bash commit.sh r52 "$DIR"