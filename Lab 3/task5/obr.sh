#!/bin/zsh

oper="+"
res=1

tail -f pipe |
    while true;
    do
        read num
        case $num in
            "+")
                oper="$num"
                ;;
            "*")
                oper="$num"
                ;;
            "quit")
                killall tail
                exit 0
                ;;
            [0-9])
                if [[ $oper = "+" ]];
                then
                    res=$(($res + $num))
                    echo $res
                elif [[ $oper = "*" ]];
                then
                    res=$(($res + $num))
                    echo $res
                fi
                ;;
            *)
                killall tail
                echo "wrong command recieved"
                exit 1
                ;;
        esac
    done


