#!/bin/zsh

k=$1
n=$2

for ((counter=0; counter<$k; counter++))
do
    zsh newmem.zsh $2&
done

