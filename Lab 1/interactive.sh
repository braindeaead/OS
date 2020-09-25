#!/bin/zsh

interactive() {

    echo "Введите соответсвующую цифру для выбора функции:
    1 - calc
    2 - search
    3 - reverse
    4 - strlen
    5 - log
    Для просмотра руководства по функциям введите \"help\"
    Для завершения работы программы введите \"exit\" "

    read button

    case $button in
        1)
            if ! [ -f "calc.sh" ]; then
                echo "Ошибка: калькулятора нема." >&2;
                interactive
            fi
            . ./calc.sh
            echo "Введите, какую операцию вы хотите выполнить."
            read operation
            if [[ "$operation" != "sum" && "$operation" != "sub" && "$operation" != "mul" && "$operation" != "div" ]]; then
                echo "Ошибка: вы выбрали несуществующее действие." >&2;
                interactive
            fi
            nums='^[+-]?[0-9]+$'
            echo "Введите первое число."; read number1
            echo "Введите второе число."; read number2
            if ! [[ "$number1" =~ $nums && "$number2" =~ $nums ]]; then
                echo "Ошибка: для корректной работы калькулятора необходимо ввести 2 ЦЕЛЫХ ЧИСЛА." >&2;
                interactive
            fi
            if [[ "$operation" == "div" && "$number2" == "0" ]]; then
                echo "Ошибка: на ноль делить нельзя." >&2;
                interactive
            fi

            calc "$operation" "$number1" "$number2"

            interactive
            ;;
        2)
            if ! [ -f "search.sh" ]; then
                echo "Ошибка: серча нема." >&2;
                interactive
            fi
            . ./search.sh
            echo "Введите регулярное выражение."; read regular
            echo "Введите директорию."; read directory
            if ! [ -d "$directory" ]; then
                echo "Ошибка: данной директории не существует." >&2;
                interactive
            fi

            search "$regular" "$directory"
            interactive
            ;;
        3)
            if ! [ -f "reverse.sh" ]; then
                echo "Ошибка: реверса нема." >&2;
                interactive
            fi
            . ./reverse.sh
            echo "Введите название файла, откуда мы будем писать."; read from
            if ! [ -f "$from" ]; then
                echo "Ошибка: данного файла не существует." >&2
                interactive
            fi
            echo "Введите название файла, куда мы будем записывать."; read where
            if ! [ -f "$where" ]; then
                echo "Ошибка: такого файла не существует." >&2;
                interactive
            fi

            reverse "$from" "$where"
            interactive
            ;;
        4)
            if ! [ -f "strlen.sh" ]; then
                echo "Ошибка: стрлена нема." >&2;
                interactive
            fi
            . ./strlen.sh
            echo "Введите строку."; read string

            strlen "$string"
            interactive
            ;;
        5)
            if ! [ -f "log.sh" ]; then
                echo "Ошибка: лога нема." >&2;
                interactive
            fi
            . ./log.sh
            if ! [ -f "/var/log/anaconda/X.log" ]; then
                echo "Ошибка: лог файл не найден." >&2;
                interactive
            fi

            log "/var/log/anaconda/X.log"
            interactive
            ;;
        help)
            if ! [ -f "help.sh" ]; then
                echo "Ошибка: помощи не будет." >&2;
                interactive
            fi
            . ./help.sh
            help
            interactive
            ;;
        exit)
            if ! [ -f "exitL.sh" ]; then
                echo "Ошибка: выхода нет." >&2;
                interactive
            fi
            . ./exitL.sh
            echo "Введите код ошибки или оставьте строку пустой."; read code
            if [ -z "$code" ]; then
                exit_ 0;
            else
                exit_ "$code"
            fi
            ;;
        *)
            echo "Такого действия нет. Выберите из предложенных." >&2;
            interactive
            ;;
    esac
}
