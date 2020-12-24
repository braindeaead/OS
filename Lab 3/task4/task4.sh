#!/bin/zsh

zsh process.sh&pid1=$!;
zsh process.sh&pid2=$!;
zsh process.sh&pid3=$!;

renice -n 19 -p $pid1
