#!/bin/zsh

at -f ./task1.sh now +2 minutes
tail -n 0 -f ~/report
