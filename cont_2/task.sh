#!/bin/bash

echo -n "Your string: "
read -a string
size=${#string[@]}
for ((k=$(($size-1)); k>=0; --k)) {
        echo -n "${string[$k]} "
}
echo 
exit 0
