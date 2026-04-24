#!/bin/bash
DIR="repo"
set -e
bash init.sh "$DIR"

# r0
bash set-user.sh "Yaroslav"
bash commit.sh r0 "$DIR"

# r1
bash branch-checkout.sh red-bottom "$DIR" 0
bash commit.sh r1 "$DIR"

# r2
bash set-user.sh "Maksim"
bash branch-checkout.sh blue-center "$DIR" 0
bash commit.sh r2 "$DIR"

# r3
bash commit.sh r2 "$DIR"

# r4
bash set-user.sh "Yaroslav"
bash branch-checkout.sh main "$DIR"
bash commit.sh r4 "$DIR"

# r5
bash set-user.sh "Maksim"
bash branch-checkout.sh blue-top "$DIR" 0
bash commit.sh r5 "$DIR"

# r6
bash set-user.sh "Yaroslav"
bash branch-checkout.sh red-top "$DIR" 0
bash commit.sh r6 "$DIR"

# r7
bash branch-checkout.sh red-center "$DIR" 0
bash commit.sh r6 "$DIR"

# r8
bash set-user.sh "Maksim"
bash branch-checkout.sh blue-top "$DIR"
bash commit.sh r8 "$DIR"

# r9
bash commit.sh r8 "$DIR"

# r10
bash set-user.sh "Yaroslav"
bash branch-checkout.sh red-bottom "$DIR"
bash commit.sh r10 "$DIR"

# r11
bash set-user.sh "Maksim"
bash branch-checkout.sh blue-center "$DIR"
bash commit.sh r11 "$DIR"

# r12
bash set-user.sh "Yaroslav"
bash branch-checkout.sh main "$DIR"
bash commit.sh r12 "$DIR"

# r13
bash set-user.sh "Maksim"
bash branch-checkout.sh blue-center "$DIR"
bash commit.sh r13 "$DIR"

# r14
bash set-user.sh "Yaroslav"
bash branch-checkout.sh main "$DIR"
bash commit.sh r14 "$DIR"

# r15
bash set-user.sh "Maksim"
bash branch-checkout.sh blue-bottom "$DIR" 0
bash commit.sh r15 "$DIR"

# r16
bash branch-checkout.sh blue-top "$DIR"
bash commit.sh r16 "$DIR"

# r17
bash set-user.sh "Yaroslav"
bash branch-checkout.sh main "$DIR"
bash commit.sh r17 "$DIR"

# r18
bash commit.sh r18 "$DIR"

# r19
bash set-user.sh "Maksim"
bash branch-checkout.sh blue-bottom "$DIR"
bash commit.sh r19 "$DIR"

# r20
bash set-user.sh "Yaroslav"
bash branch-checkout.sh red-center "$DIR"
bash commit.sh r20 "$DIR"

# r21
bash set-user.sh "Maksim"
bash branch-checkout.sh blue-top "$DIR"
bash commit.sh r21 "$DIR"

# r22
bash branch-checkout.sh blue-bottom "$DIR"
bash commit.sh r22 "$DIR"

# r23
bash set-user.sh "Yaroslav"
bash branch-checkout.sh red-center "$DIR"
bash commit.sh r23 "$DIR"

# r24
bash set-user.sh "Maksim"
bash branch-checkout.sh blue-top "$DIR"
bash commit.sh r24 "$DIR"

# r25
bash set-user.sh "Yaroslav"
bash branch-checkout.sh red-center "$DIR"
bash commit.sh r25 "$DIR"

# r26
bash set-user.sh "Maksim"
bash branch-checkout.sh blue-bottom "$DIR"
bash commit.sh r26 "$DIR"

# r27
bash branch-checkout.sh blue-top "$DIR"
bash commit.sh r27 "$DIR"

# r28
bash commit.sh r28 "$DIR"

# r29
bash set-user.sh "Yaroslav"
bash branch-checkout.sh red-center "$DIR"
bash commit.sh r29 "$DIR"

# r30
bash branch-checkout.sh red-bottom "$DIR"
bash commit.sh r30 "$DIR"

# r31
bash branch-checkout.sh red-top "$DIR"
bash commit.sh r31 "$DIR"

# r32
bash set-user.sh "Maksim"
bash branch-checkout.sh blue-bottom "$DIR"
bash commit.sh r32 "$DIR"

# r33
bash set-user.sh "Yaroslav"
bash branch-checkout.sh red-bottom "$DIR"
bash commit.sh r33 "$DIR"

# r34
bash set-user.sh "Maksim"
bash branch-checkout.sh blue-top "$DIR"
bash commit.sh r34 "$DIR"

# r35
bash set-user.sh "Yaroslav"
bash branch-checkout.sh main "$DIR"
bash commit.sh r35 "$DIR"

# r36
bash set-user.sh "Maksim"
bash branch-checkout.sh blue-center "$DIR"
bash commit.sh r36 "$DIR"

# r37
bash branch-checkout.sh blue-bottom "$DIR"
bash commit.sh r37 "$DIR"

# r38

# r39
bash set-user.sh "Yaroslav"
bash branch-checkout.sh red-top "$DIR"
bash commit.sh r39 "$DIR"

# r40
bash branch-checkout.sh red-center "$DIR"
bash commit.sh r40 "$DIR"

# r41
bash branch-checkout.sh red-top "$DIR"
bash commit.sh r41 "$DIR"

# r42
bash branch-checkout.sh red-center "$DIR"
bash commit.sh r42 "$DIR"

# r43
bash branch-checkout.sh red-top "$DIR"
bash commit.sh r43 "$DIR"

# r44

# r45
bash set-user.sh "Yaroslav"
bash branch-checkout.sh main "$DIR"
bash commit.sh r45 "$DIR"

# r46
bash branch-checkout.sh red-bottom "$DIR"
bash commit.sh r46 "$DIR"

# r47

# r48

# r49

# r50

# r51
bash set-user.sh "Maksim"
bash branch-checkout.sh blue-top "$DIR"
bash commit.sh r51 "$DIR"

# r52