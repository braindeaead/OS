#!/bin/zsh

mkfifo pipe

zsh obr.sh&zsh generator.sh
rm pipe
