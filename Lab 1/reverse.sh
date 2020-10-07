#!/bin/zsh

reverse() {
    tmp=$(mktemp /tmp/AppBuffer.XXXXXX)
    exec 3>"$tmp"
    cat $1 >&3
    tac "$tmp" | rev 1> $2 2> /dev/null
    rm "$tmp"
    exec 3>&-
}
