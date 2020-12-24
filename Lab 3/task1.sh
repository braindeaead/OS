#!/bin/zsh

mkdir ~/test && {echo "catalog test was successfully created" > ~/report ; touch ~/test/$(date '+%x|%X') ; }
ping net_nikogo.ru || echo $(date '+%x|%X') not discoverable >> ~/report
