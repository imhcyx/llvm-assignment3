#!/bin/bash

SHELL_FOLDER=$(dirname $(readlink -f "$0"))
cd $SHELL_FOLDER

for s in `ls *.c`;
do
    clang -c -g -emit-llvm $s
    n="${s%.*}"
    ../build/assignment3 --dumpll "$n.bc" > "$n.ll"
done
