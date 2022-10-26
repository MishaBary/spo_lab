#!/bin/bash

up=1
for ((c=0;c<"$1";c++)) do
  for ((d=0;d<(($1-up));d++)) do
    echo -n " "
  done
  for ((f=0;f<$up;f++)) do
    echo -n ". "
  done
  echo ""
  up=$(($up+1))
done

size=$1
down=size-1
for ((c=0;c<=(($1-1));c++)) do
  for ((g=0;g<((size-down));g++)) do
    echo -n " "
  done
  for ((h=0;h<down;h++)) do
    echo -n ". "
  done
  echo ""
  down=$(($down-1))
done

exit 0

//исправил оформление кода
