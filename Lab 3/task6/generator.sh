#!/bin/zsh

while true;
do
    read symbol

    case $symbol in
        "+")
            kill -USR1 $1
            ;;
        "*")
            kill -USR2 $1
            ;;
        "TERM")
            kill -SIGTERM $1
            exit 0
            ;;
        *)
            continue
            ;;
    esac
done
