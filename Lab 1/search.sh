#!/bin/zsh

search() {

   if grep -r "$2" "$1" ; then
       return
   else
       echo "Нет совпадений." >&2;
   fi

}
