#!/bin/zsh

mkfifo channel

zsh generator.sh&zsh obr.sh
rm channel
