#!/bin/bash
DIR="repo"
set -e
bash init.sh "$DIR" # r0

# r1
bash branch-checkout.sh bottom "$DIR" 0
bash commit.sh r1 "$DIR"

# r2

# r3

# r4
bash set-user.sh "Yaroslav"
bash branch-checkout.sh main "$DIR"
bash commit.sh r4 "$DIR"

# r5

# r6

# r7

# r8

# r9

# r10
bash set-user.sh "Yaroslav"
bash branch-checkout.sh bottom "$DIR"
bash commit.sh r10 "$DIR"

# r11

# r12
bash set-user.sh "Yaroslav"
bash branch-checkout.sh main "$DIR"
bash commit.sh r12 "$DIR"

# r13

# r14
bash set-user.sh "Yaroslav"
bash branch-checkout.sh main "$DIR"
bash commit.sh r14 "$DIR"

# r15

# r16

# r17
bash set-user.sh "Yaroslav"
bash branch-checkout.sh main "$DIR"
bash commit.sh r17 "$DIR"

# r18
bash commit.sh r18 "$DIR"

# r19

# r20

# r21

# r22

# r23

# r24

# r25

# r26

# r27

# r28

# r29

# r30
bash branch-checkout.sh bottom "$DIR"
bash commit.sh r30 "$DIR"

# r31

# r32

# r33
bash set-user.sh "Yaroslav"
bash branch-checkout.sh bottom "$DIR"
bash commit.sh r33 "$DIR"

# r34

# r35

# r36

# r37

# r38

# r39

# r40

# r41

# r42

# r43

# r44

# r45
bash set-user.sh "Yaroslav"
bash branch-checkout.sh main "$DIR"
bash commit.sh r45 "$DIR"

# r46
bash branch-checkout.sh bottom "$DIR"
bash commit.sh r46 "$DIR"

# r47

# r48

# r49

# r50

# r51

# r52


read -p "Press Enter to exit..."