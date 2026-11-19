#!/bin/bash
# Remember to use \* when performing multiplication,
# so that it doesn't pull in all the files from the folder.

if [[ $# -ne 3 ]]; then
    echo "Use: $0 <num1> <operator> <num2>"
    exit 1
fi

# Regular Expression
# =~ -> to compare the left side with the right side
# ^ -> indicates the beginning of the text. (The pattern starts with the first character)
# -? -> optional hifen
# [0-9] -> character that is a digit
# + -> repeats the last item
# $ -> End of text. (Nothing comes after the digits)
if ! [[ $1 =~ ^-?[0-9]+(\.[0-9]+)?$ && $3 =~ ^-?[0-9]+(\.[0-9]+)?$ ]]; then
    echo "Error: Not a number"
    exit 1
fi

# It executes, but doesn't perform decimal calculations;
# you need to use `echo "scale=2; $1 op $3" | bc`.
if [[ $# -eq 3 ]]; then
    case "$2" in
        '+') expr "$1" + "$3"
            # echo "scale=2; $1 + $3" | bc
        ;;
        '*'|'x') expr "$1" \* "$3"
            # echo "scale=2; $1 * $3" | bc
        ;;
        '-') expr "$1" - "$3"
            # echo "scale=2; $1 - $3" | bc
            ;;
        '/')
            if [[ $3 -eq 0 ]]; then
                echo "Error: Division by zero"
                exit 1
            fi
            expr "$1" / "$3"
            # echo "scale=2; $1 / $3" | bc
        ;;
        *) echo "Invalid values"
        ;;
    esac
    # echo $(($1 $2 $3)) -> another version
else
    echo "Use: $0 <num1> <operator> <num2>"
    exit 1
fi
