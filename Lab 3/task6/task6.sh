#!/bin/zsh

zsh obr.sh&pid=$!
zsh generator.sh $pid
