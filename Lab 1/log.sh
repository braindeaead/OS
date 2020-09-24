#!/bin/zsh

log() {

    warnings="$(cat /var/log/anaconda/X.log | awk '{if (($3 == "(WW)") && ($1 == "["))print $0}')"
    infos="$(cat /var/log/anaconda/X.log | awk '{if (($3 == "(II)") && ($1 == "["))print $0}')"

    echo -e "${warnings//"(WW)"/"\e[1;33Warning:\e[0m"}"
    echo -e "${infos//"(II)"/"\e[1;36Information:\e[0m"}"
}
