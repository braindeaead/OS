#!/bin/zsh

while true;
do
    read symbol

    echo $symbol > channel

    if [[ $symbol == "quit" ]];
    then
        echo "quitted";
        exit 0;
    fi

    if [[ $symbol != "+" && $symbol != "*" && $symbol != [0-9] ]];
    then
        echo "wrong command"
        exit 1;
    fi

done
