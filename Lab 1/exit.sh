#!/bin/zsh

exit() {
    var='^[+-]?[0-9]+$'
    if [[ $1 =~ $var ]]; then
        exit "$1"
    else
         exit 0
    fi
}
