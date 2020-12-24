#!/bin/zsh

res=1
symb="+"

USER1() {
    symbol="+"
}

USER2() {
    symbol="*"
}

TERM() {
    echo "catced sigterm"
    exit 0
}

trap 'USER1' USR1
trap 'USER2' USR2
trap 'TERM' SIGTERM

while true;
do
    if [[ $symbol = "+" ]]
    then
        result=$(($result + 2))
    elif [[ $symbol = "*" ]]
    then
        result=$(($result * 2))
    fi
    echo $result
    
    sleep 1
done
