
#!/bin/bash -x

declare -A Dictionary

echo "Enter the times to toss the coin"
read times
echo "Enter number of coins 1)Single 2)Double 3)Triple: "

read coins

function toss()
{

for (( index=0; index<$times; index++ ))
do
	str=""
	for (( index1=0; index1<$coins; index1++ ))
	do	
		random=$((RANDOM%2))
		if [[ $random -eq 1 ]]
		then
			str=$str"H"
		else
			str=$str"T"
		fi
	done

Dictionary[$str]=$(( ${Dictionary[$str]} + 1 ))
done

for keys in ${!Dictionary[@]}
do
	percentage=`expr "scale=2;( ${Dictionary[$keys]} / $times ) * 100" | bc -l`
	echo $keys = $percentage

done

}

toss

echo ${!Dictionary[@]}
echo ${Dictionary[@]}

