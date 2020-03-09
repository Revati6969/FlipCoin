
#!/bin/bash -x

declare -A Dictionary

#Variables
max=0

echo "Enter the times to toss the coin"
read times
echo "Enter number of coins 1)Single 2)Double 3)Triple: "
read coins
#FLIP THE COIN AND STORE RESULT IN DICTIONARY
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
}
toss

echo "Dictionary in descending order"
#SORT DICTIONARY IN DESCENDING ORDER
for k in "${!Dictionary[@]}"
do
   echo $k ' - ' ${Dictionary["$k"]}
done | sort -rn -k3
#WINNING COMBINATION
for k in "${!Dictionary[@]}"
do
   if [[ $max -lt ${Dictionary["$k"]} ]]
   then
    max=${Dictionary["$k"]}
    key1=$k
   fi
done
echo "Winning Combination : $key1 -->  $max"
