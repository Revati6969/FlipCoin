#!/bin/bash -x

echo "Welcome to Flip Coin Simulation"

random=$((RANDOM%2))

if [[ $random -eq 1 ]]
then
	echo "Head"
else
	echo "Tail"
fi

