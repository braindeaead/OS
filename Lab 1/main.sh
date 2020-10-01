#!/bin/zsh

# если честно на этом моменте я уже очень сильно хотел сдохнуть

case $1 in
    calc)
        if ! [ -f "calc.sh" ]; then
            echo "Ошибка: калькулятор спиздили." >&2; exit -1
        fi
        . ./calc.sh
        if ! [[ $# -eq 4 ]]; then
            echo "Ошибка: для корректной работы калькулятора нужно указать действие и 2 целых числа. Спасибо за внимание." >&2; exit -2
        fi
        if [[ "$2" != "sum" && "$2" != "sub" && "$2" != "mul" && "$2" != "div" ]]; then
            echo "Ошибка: такого калькулятор не может (пока что)." >&2; exit -3
        fi
        nums='^[+-]?[0-9]+$'
        if ! [[ "$3" =~ $nums && "$4" =~ $nums ]]; then
            echo "Ошибка: чтоб калькулятор корректно работал необходимо ввести 2 ЦЕЛЫХ числа. Спасибо за внимание." >&2; exit -5
        fi
        if [[ "$2" = "div" && "$4" == "0" ]]; then
            echo "Ошибка: на ноль делить нельзя." >&2; exit -5
        fi

        calc "$2" "$3" "$4"
        exit 0:
        ;;
    search)
        if ! [ -f "search.sh" ]; then
            echo "Ошибка: серч спиздили." >&2; exit -1
        fi
        . ./search.sh
        if ! [[ $# -eq 3 ]]; then
            echo "Ошибка: для корректной работы серча нужно указать верное количество параметров (2). Спасибо за внимание." >&2; exit -2
        fi
        if ! [ -d "$2" ]; then
            echo "Ошибка: такой директории не существует. Спасибо за внимание." >&2; exit -4
        fi

        search "$2" "$3"
        exit 0
        ;;
    reverse)
        if ! [ -f "reverse.sh" ]; then
            echo "Ошибка: реверс спиздили." >&2; exit -1
        fi
        . ./reverse.sh
        if ! [[ $# -eq 3 ]]; then
            echo "Ошибка: для корректной работы реверса нужно указать верное количество параметров (2). Спасибо за внимание." >&2; exit -2
        fi
        if ! [ -f "$2" ]; then
            echo "Ошибка: такого файла не существует. Необходимо указать существующий. Спасибо за внимание." >&2; exit -4
        fi

        reverse "$2" "$3"
        exit 0
        ;;
    strlen)
        if ! [ -f "strlen.sh" ]; then
            echo "Ошибка: стрлен спиздили." >&2; exit -1
        fi
        . ./strlen.sh
        if ! [[ $# -eq 2 ]]; then
            echo "Ошибка: для корректной работы стрлена нужно указать верное количество параметров (1). Спасибо за внимание." >&2; exit -2
        fi

        strlen "$2"
        exit 0
        ;;
    log)
        if ! [ -f "log.sh" ]; then
            echo "Ошибка: лог спиздили." >&2; exit -1
        fi
        . ./log.sh
        if ! [ -f "/var/log/anaconda/X.log" ]; then
            echo "Ошибка: файла X.log не сущесвует в искомой директории. Спасибо за внимание." >&2; exit -4
        fi
        
        log "/var/log/anaconda/X.log"
        exit 0
        ;;
    "exit")
        if ! [ -f "exitL.sh" ]; then
            echo "Ошибка: экзит спиздили." >&2; exit -1
        fi
        . ./exitL.sh
        if  [ -z "$2" ]; then
           exit_ 0
       else
           exit_ "$2"
        fi
        ;;
    help)
        if ! [ -f "help.sh" ]; then
            echo "Ошибка: хелп спиздили." >&2; exit -1
        fi
        . ./help.sh

        help
        ;;
    interactive)
        if ! [ -f "interactive.sh" ]; then
            echo "Ошибка: интерактив спиздили." >&2; exit -1
        fi
        . ./interactive.sh

        interactive
        ;;
esac
