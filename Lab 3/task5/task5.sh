#!/bin/zsh

mkfifo pipe

zsh generator.sh&zsh obr.sh
rm pipe
