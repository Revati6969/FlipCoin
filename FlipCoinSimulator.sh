#!/bin/bash -x

declare -A Dictionary

echo "Enter the times to toss the coin"
read times
Head=0
Tail=0

for (( index=0; index<$times; index++ ))
do
	random=$((RANDOM%2))
	if [[ $random -eq 1 ]]
	then
		Head=$(($Head+1))
	else
		Tail=$(($Tail+1))
	fi
done

Dictionary[Head]=$Head
Dictionary[Tail]=$Tail

echo ${Dictionary[@]}
echo ${!Dictionary[@]}
head=`expr "scale=3;( ${Dictionary[Head]} / $times ) * 100" | bc -l`
echo $head
tail=`expr "scale=3;( ${Dictionary[Tail]} / $times ) * 100" | bc -l`
echo $tail
