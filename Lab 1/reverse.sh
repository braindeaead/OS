#!/bin/zsh

reverse() {
    IFS=$"\n"
    for string in $(tac "$1")
    do
        for symbol in $string
        do
            echo $value | awk '{for (i=NF; i>1; i--) printf("%s ",$i); print $1; }' >> $2
            done
        done
}
