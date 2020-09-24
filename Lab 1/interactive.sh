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
    esac
}
