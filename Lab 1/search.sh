#!/bin/zsh

search() {

   if grep -r "$1" "$2" ; then
       return
   else
       echo "Нет совпадений." >&2;
   fi

}
