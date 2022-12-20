#!/bin/bash

declare data
declare Shift
declare char_after=""
declare result=""

# check integer
integer='^[0-9]+$'

echo -n "Enter your data = "
read data
echo -n "Shift = "
read Shift

#check Shift is integer
if ! [[ $Shift =~ $integer ]]; then 
      echo ERROR Shift
      exit 1
fi

function Shift() {
        num_in_ascii=$@
        # +Shift
        num_in_ascii_shift=$(( $num_in_ascii + $Shift ))
        while [[ num_in_ascii_shift -gt 90 ]]; do
                num_in_ascii_shift=$(( $num_in_ascii_shift - 26 ))
        done
        return $num_in_ascii_shift
}
#calculating numbers(9-digit)
function cal_num() {
        digit=$@
        digit=$(( 9 - $digit ))
        return $digit
}
# data 
# ${#data} = data.size()
for ((i = 0; i < ${#data}; i++)); do
        # read char from data
        char=${data:$i:1}
        # take the ascii_number of input char using od -An -tuC
        # od is octal dump, it gives the octal number of input
        # -An takes the second byte
        # -tuC removes the shifts
        num_in_ascii=$( echo -n $char | od -An -tuC )
        #checking if char is letter
        if [[ $num_in_ascii -gt 64 ]] && [[ $num_in_ascii -lt 91 ]]; then
                Shift $num_in_ascii
                num_in_ascii=$?
                # as the starting condition says we
                #decrease register of odd(iterator in string) letters
                if [[ $(( $i % 2 )) == 0 ]]; then
                        # given : a = 65 decimal integer
                        # printf %x $a gives us 41 in hex = 65 in decimal
                        # printf "\x $HEX_a" takes hex number and give ascii_letter
                        # for a=65 in decimal we recieve A in ascii
                        char_after+=$(printf "\x$(printf %x $num_in_ascii)")
                else
                        # to decrease register we add 32 to ascii_number
                        # (ex. A = 65, a = 97 in ascii)
                        char_after+=$(printf "\x$( printf %x $(( $num_in_ascii + 32 )))")
                fi
        # else if our char is number 0-9
        elif [[ $num_in_ascii -lt 58 ]] && [[ $num_in_ascii -gt 47 ]]; then
                cal_num $char
                char=$?
                char_after+=$char
        else
                char_after+=$char
        fi
done
# text reversing
for ((i = ${#char_after}; i != -1; i--)); do
        char=${char_after:$i:1}
        result+=$char
done
echo result: \"$result\"
#"$?" - last result from our returned function
