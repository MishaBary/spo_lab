#!/bin/bash
#проверяем аргументы командной строки
if [ "$#" -eq "0" ]; then
    echo "ERROR INPUT "
    exit 1
fi
#разделяем ромб на 2 части(up and down), начинаем с up
up=1
for ((c=0;c<"$1";c++)); do
    for ((d=0;d<(($1-up));d++)); do
        echo -n " "
    done
    for ((f=0;f<$up;f++)); do
        echo -n ". "
    done
    echo ""
    up=$(($up+1))
done
#переходим к down части
size=$1
down=size-1
for ((c=0;c<=(($1-1));c++)); do
    for ((g=0;g<((size-down));g++)); do
        echo -n " "
    done
    for ((h=0;h<down;h++)); do
        echo -n ". "
    done
    echo ""
    down=$(($down-1))
done
exit 0
#исправил оформление и добавил проверку аргументов
